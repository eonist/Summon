
import UIKit

class MainView:UIView{
    lazy var sendButton:SendButton = self.createSendButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black//debug
        _ = sendButton
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
extension MainView{
    /**
     * Creates SendButton
     */
    func createSendButton() -> SendButton{
        let btn = SendButton.init(title: "Send pin")
        addSubview(btn)
        btn.activateConstraint{ view in/*constraints*/
            let anchor = Constraint.anchor(view, to: self, align: .centerCenter, alignTo: .centerCenter)
            let size = Constraint.size(view, size: CGSize(width:UIScreen.main.bounds.width-SendButton.margin,height:UIScreen.main.bounds.width-SendButton.margin))
            return [anchor.x,anchor.y,size.w,size.h]
        }
        return btn
    }
}
