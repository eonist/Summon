import UIKit

class DialogTextView:UITextView,UITextViewDelegate{
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setup()
        //applyGestureRecognizer(view:self)
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
/**
 * Setup
 */
extension DialogTextView{
    /**
     * Setup text
     */
    func setup(){//configDesign
        self.text = "John text green master \n dynamics flat borrow brown"
//        self.font = .systemFont(ofSize: 32)
        
        self.textAlignment = .center
        //textField.isMultipleTouchEnabled!!?!???
        
        self.textContainer.lineBreakMode = .byWordWrapping//allows multiline
        self.isScrollEnabled = false
        self.isEditable = true//maybe toggle editable on touch etc
        self.textColor = .white
        self.font = .systemFont(ofSize: 36)
        self.backgroundColor = UIColor.clear
        // Now the this should work
        
        //        self.layer.cornerRadius = 6//rounded corners for regular
        self.delegate = self /*Without setting the delegate you won't be able to track UITextView events*/
        
        /*Keyboard-bar*/
        //        self.inputAccessoryView = createKeyboardBar()//Adds a bar above the keyboard
    }
}
