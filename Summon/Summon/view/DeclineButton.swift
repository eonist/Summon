import Foundation

class DeclineButton:ActionButton{
    override init(title: String) {
        super.init(title: title)
        self.backgroundColor = .green
        self.setTitleColor(.white, for: .normal)
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
