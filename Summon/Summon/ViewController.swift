import UIKit

class ViewController: UIViewController {
    lazy var mainView = createMainView()
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .gray
         _ = mainView
    }
    override var prefersStatusBarHidden:Bool {return true}/*hides statusbar*/
}
/**
 * Create
 */
extension ViewController{
    /**
     * Create the FlowView
     */
    func createMainView() -> MainView{
        let mainView:MainView = MainView.init(frame: UIScreen.main.bounds)
        self.view.addSubview(mainView)
        let screenSize:CGSize = {
            let size = UIScreen.main.bounds.size
            return CGSize(width:size.width, height:size.height)
        }()
        mainView.activateConstraint { view in
            let size = Constraint.size(view, size: screenSize)
            let pos = Constraint.anchor(view, to: self.view, align: .topLeft, alignTo: .topLeft)
            return [pos.x,pos.y,size.w,size.h]
        }
        return mainView
    }
}
