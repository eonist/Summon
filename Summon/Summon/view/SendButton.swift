
import UIKit

class SendButton:ActionButton{
    override init(title: String) {
        super.init(title: title)
        layer.cornerRadius = self.frame.width/2
        layer.masksToBounds = true
        backgroundColor = .blue
        self.setTitleColor(.white, for: .normal)
    }
    /**
     *
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

