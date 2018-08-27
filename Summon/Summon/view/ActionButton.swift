import UIKit
/**
 * EXAMPLE:
 * let customButton:CustomButton = CustomButton.init(frame:CGRect.init(x:0,y:0,width:120,height:40))
 * addSubview(customButton)
 * customButton.tapUpInsideCallBack = {
 *    Swift.print("🎉")
 * }   
 */
class ActionButton:CustomButton{
    var clickCallBack:ClickCallBack = ActionButton.defaultClickCallBack//TODO: ⚠️️ move to exitbtn
    override init(title: String) {
        super.init(title: title)
        self.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ActionButton{
    typealias ClickCallBack = ()->Void
    static var defaultClickCallBack = { Swift.print("no call back attached")}
    /**
     * Selector handler
     */
    @objc func buttonTouched(sender:UIButton) {
        clickCallBack()/*Calls whichever method that is attached to the call-back variable*/
    }
}
extension ActionButton{
    static let width:CGFloat = 60
    static let height:CGFloat = 20
}
