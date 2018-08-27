#if os(iOS)
import UIKit

typealias SizeConstraint = (w:NSLayoutConstraint,h:NSLayoutConstraint)
typealias AnchorConstraint = (x:NSLayoutConstraint,y:NSLayoutConstraint)

protocol ConstraintKind:class{
    var anchor:AnchorConstraint? {get set}
    var size:SizeConstraint? {get set}
}
extension ConstraintKind{
    /**
     * Convenient
     */
    func setConstraint(anchor:AnchorConstraint,size:SizeConstraint) {
        self.anchor = anchor
        self.size = size
    }
}
/**
 * Animation
 */
extension ConstraintKind where Self:UIView{
    /**
     * Animates a UIView that adhers to ConstraintKind (hor)
     */
    func animate(to:CGFloat, align:HorizontalAlign, alignTo:HorizontalAlign, onComplete:@escaping AnimComplete = Self.defaultOnComplete){
        UIView.animate({self.update(offset: to, align: align, alignTo: alignTo)},onComplete:onComplete)
    }
    /**
     * Anim for ver
     */
    func animate(to:CGFloat, align:VerticalAlign = .top, alignTo:VerticalAlign = .top, onComplete:@escaping AnimComplete = Self.defaultOnComplete){
        UIView.animate({self.update(offset: to, align: align, alignTo: alignTo)},onComplete:onComplete)
    }
}
/**
 * Update
 */
extension ConstraintKind where Self:UIView{
    typealias UIViewConstraintKind = UIView & ConstraintKind
    typealias ReturnType = (anchor:AnchorConstraint,size:SizeConstraint)
    typealias ConstraintKindClosure = (_ view:UIViewConstraintKind) -> ReturnType
    /**
     * Same as UIView().activateConstraint... but also sets size and anchor constraints (ConstraintKind) (For animation etc)
     * TODO: ⚠️️ maybe reuse the code from activateConstraint, by forwarning the closure etc.
     * TODO: ⚠️️ Could be possible to do something like: typealias UIViewConstraintKind = UIView & ConstraintKind
     * Example:
     * sliderBar.activateConstraintKind { view in
     *      let anchor = Constraint.anchor(view, to: self, align: .topLeft, alignTo: .topLeft)
     *      let size = Constraint.size(view, size: size)
     *      return (anchor:anchor, size:size)
     * }
     */
    func activateConstraintKind(closure:ConstraintKindClosure) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraints:ReturnType = closure(self)/*the constraints is returned from the closure*/
        self.size = constraints.size
        self.anchor = constraints.anchor
        NSLayoutConstraint.activate([constraints.anchor.x,constraints.anchor.y,constraints.size.w,constraints.size.h])
    }
    /**
     * Updates horizontal anchor
     */
    func update(offset:CGFloat, align:HorizontalAlign, alignTo:HorizontalAlign){
        guard let superview:UIView = self.superview else {fatalError("err superview not available")}
        guard let oldAnchor = self.anchor else {fatalError("err anchor not available")}
        NSLayoutConstraint.deactivate([oldAnchor.x])
        let newAnchorX = Constraint.anchor(self, to: superview, align: align, alignTo: alignTo, offset: offset)
        NSLayoutConstraint.activate([newAnchorX])
        self.anchor?.x = newAnchorX
        superview.layoutIfNeeded()/*The superview is responsible for updating subView constraint updates*/
    }
    /**
     * Updates vertical anchor
     */
    func update(offset:CGFloat, align:VerticalAlign, alignTo:VerticalAlign){
        guard let superview:UIView = self.superview else {fatalError("err superview not available")}
        guard let oldAnchor = self.anchor else {fatalError("err anchor not available")}
        NSLayoutConstraint.deactivate([oldAnchor.y])
        let newAnchorY = Constraint.anchor(self, to: superview, align: align, alignTo: alignTo, offset: offset)
        NSLayoutConstraint.activate([newAnchorY])
        self.anchor?.y = newAnchorY
        superview.layoutIfNeeded()/*The superview is responsible for updating subView constraint updates*/
    }
}
/**
 * Animation (Static & convenient)
 */
extension UIView{
    typealias AnimComplete = () -> Void
    typealias AnimUpdate = () -> Void
    static func defaultOnComplete() {Swift.print("default anim completed closure")}
    /**
     * Animate
     * Example:
     */
    static func animate(_ onUpdate:@escaping AnimUpdate,onComplete:@escaping AnimComplete = UIView.defaultOnComplete){
        let anim = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut, animations: {
            onUpdate()
        })
        anim.addCompletion{_ in onComplete() }
        anim.startAnimation()
    }
}
#endif
