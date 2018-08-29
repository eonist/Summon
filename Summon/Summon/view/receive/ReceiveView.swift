import UIKit

class ReceiveView:UIView {
    var textView:DialogTextView?
    lazy var acceptButton:AcceptButton = self.createAcceptButton()
    lazy var sendButton:DeclineButton = self.createDeclineButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear//debug
        _ = acceptButton
        _ = sendButton
        let textStr:String = "Anne is in \n the East wing \n room 202"
        textView = createText(textFieldHeight: 220, textStr: textStr)
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
/**
 * Create
 */
extension ReceiveView{
    /**
     * Creates AcceptButton
     */
    func createAcceptButton() -> AcceptButton{
        let btn = AcceptButton.init(title: "Let's go")
        addSubview(btn)
        btn.activateConstraint{ view in/*Constraints*/
            let anchor = Constraint.anchor(view, to: self, align: .bottomLeft, alignTo: .bottomLeft)
            let size = Constraint.size(view, size: CGSize(width:180,height:64))
            return [anchor.x,anchor.y,size.w,size.h]
        }
        return btn
    }
    /**
     * Creates DeclineButton
     */
    func createDeclineButton() -> DeclineButton{
        let btn = DeclineButton.init(title: "Dismiss")
        addSubview(btn)
        btn.activateConstraint{ view in/*Constraints*/
            let anchor = Constraint.anchor(view, to: self, align: .bottomRight, alignTo: .bottomRight)
            let size = Constraint.size(view, size: CGSize(width:180,height:64))
            return [anchor.x,anchor.y,size.w,size.h]
        }
        return btn
    }
}
