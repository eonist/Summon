import UIKit

class ResponseView:UIView{
    var textView:DialogTextView?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear//debug
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
extension UIView{
    /**
     * Creates EditableText
     */
    func createText(textFieldHeight:CGFloat = 220, textStr:String = "Test") -> DialogTextView{
//        let textFieldHeight:CGFloat = 220
        let centerY:CGFloat = (UIScreen.main.bounds.size.height/2) - (textFieldHeight/2)
        let margin:CGFloat = 40
        let rect:CGRect = CGRect.init(x: margin, y: centerY, width: UIScreen.main.bounds.width-margin*2, height: textFieldHeight)
        let text:DialogTextView = DialogTextView.init(frame: rect)
        text.text = textStr
        addSubview(text)
        return text
    }
}
