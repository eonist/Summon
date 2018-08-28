import UIKit

class ResponseView:UIView{
    var textView:DialogTextView?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .purple//debug
        textView = createText()
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
/**
 *
 */
extension ResponseView{
    /**
     * Creates EditableText
     */
    func createText() -> DialogTextView{
        let textFieldHeight:CGFloat = 160
        let centerY:CGFloat = (UIScreen.main.bounds.size.height/2) - (textFieldHeight/2)
        let rect:CGRect = CGRect.init(x: 0, y: centerY, width: UIScreen.main.bounds.width, height: textFieldHeight)
        let text:DialogTextView = DialogTextView.init(frame: rect)
        addSubview(text)
        return text
    }
}
