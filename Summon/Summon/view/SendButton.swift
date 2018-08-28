
import UIKit

class SendButton:ActionButton{
    override init(title: String) {
        super.init(title: title)
        Swift.print("self.frame.width:  \(self.frame.width)")
        let width:CGFloat = UIScreen.main.bounds.width-SendButton.margin
        layer.cornerRadius = width/2
        layer.masksToBounds = true
        backgroundColor = .blue
        self.setTitleColor(.white, for: .normal)
        
        //Add border
        self.layer.borderWidth = 10
        self.layer.borderColor = UIColor.gray.cgColor
        
        //Set font
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = .boldSystemFont(ofSize: 32)//
    }
    /**
     *
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SendButton {
    static let margin:CGFloat = 160
}
