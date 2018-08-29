import UIKit

class ViewController: UIViewController {
    lazy var mainView = createMainView()
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .gray
         _ = mainView
        testDummyService()
        
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
/**
 * Tests
 */
extension ViewController{
    /**
     * Tests if dummyService works
     */
    func testDummyService(){
        let eastWing:String? = DummyService.getBuildingName(loc: DummyService.eastWing.loc)
        Swift.print("eastWing:  \(String(describing: eastWing))")//East wing
        
        let eastWingRoom202:String? = DummyService.getRoomName(loc: DummyService.eastWing.rooms.first!.loc, floor:2)
        Swift.print("eastWingRoom202:  \(String(describing: eastWingRoom202))")//202
        
        let westWing:String? = DummyService.getBuildingName(loc: DummyService.westWing.loc)
        Swift.print("westWing:  \(String(describing: westWing))")//West wing
        
        let westWingRoom405:String? = DummyService.getRoomName(loc: DummyService.westWing.rooms.first!.loc, floor: 4)
        Swift.print("westWingRoom405:  \(String(describing: westWingRoom405))")//405
    }
}
