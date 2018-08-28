
import UIKit

class MainView:UIView{
    var curView:UIView?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black//debug
        curView = createSubView(viewType: .response )
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView{
    /**
     * Creates view
     */
    func createSubView(viewType:ViewType) -> UIView{
        let view:UIView = {
            switch viewType {
            case .setup:
                return UIView.init()
            case .send:
                return SendView.init(frame: UIScreen.main.bounds)
            case .receive:
                return UIView.init()
            case .response:
                return ResponseView.init(frame: UIScreen.main.bounds)
            }
        }()
        addSubview(view)
        return view
    }
}
extension MainView{
    enum ViewType {
        case setup, send, receive, response
    }
}
