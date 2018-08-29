import UIKit

/**
 * NOTE: It's nice to have mainView as a sort of container, because you might want to have a header and a footer as well
 */
class MainView:UIView{
    var curView:UIView?
    var stepIndex:Int = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black//debug
        curView = createSubView(viewType: .send)
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
        if let curView = self.curView { curView.removeFromSuperview() } /*Remove it if it exists*/
        let view:UIView = {
            switch viewType {
            case .setup:
                return UIView.init()
            case .send:
                let sendView = SendView.init(frame: UIScreen.main.bounds)
                sendView.sendButton.clickCallBack = {
                    Swift.print("sendView.sendButton.clickCallBack:  \(sendView.sendButton.clickCallBack)")
                    self.curView = self.createSubView(viewType: .receive)
                }
                return sendView
                
            case .receive:
                let receiveView = ReceiveView.init(frame: UIScreen.main.bounds)
                receiveView.acceptButton.clickCallBack = {
                    Swift.print("receiveView.acceptButton.clickCallBack")
                
                        self.curView = self.createSubView(viewType: .receiveStep)
                    
                    
                }
                return receiveView
            case .receiveStep:
                if self.stepIndex == MainView.steps.count {
                    self.curView = self.createSubView(viewType: .send)
                    self.stepIndex = 0
                    return  self.curView!
                }
                let receiveStepView:ReceiveStepView = ReceiveStepView.init(frame: UIScreen.main.bounds)
                receiveStepView.onReleased = {
                    self.curView = self.createSubView(viewType: .receiveStep)
                }
                let step:Step = MainView.steps[stepIndex]
                receiveStepView.setState(step:step)//(hasCompass: true, textStr: )
                stepIndex += 1
                return receiveStepView
            case .response:
                return ResponseView.init(frame: UIScreen.main.bounds)
            }
        }()
        addSubview(view)
        return view
    }
}


typealias Step = (text:String,hasCompass:Bool,  currentProgress:String?)

extension MainView {
    
    
    static let steps:[Step] = {
        let step1:Step = {
            let text:String = "Anne is in the \n East wing \n room 202"
            return (text:text, hasCompass:false, currentProgress:nil)
        }()
        let step2:Step = {
            let text:String = "Go down \n 6 floors"
            return (text:text, hasCompass:false, currentProgress:"3 floors left")
        }()
        let step3:Step = {
            let text:String = "Walk 30m to \n East wing"
            return (text:text, hasCompass:true, currentProgress:"20m left")
        }()
        let step4:Step = {
            let text:String = "Go up to \n 2nd floor"
            return (text:text, hasCompass:false, currentProgress:"1 floor left")
        }()
        let step5:Step = {
            let text:String = "Walk 20m to \n room 202"
            return (text:text, hasCompass:true, currentProgress:"20m left")
        }()
        let step6:Step = {
            let text:String = "You have \n arrived"
            return (text:text, hasCompass:false, currentProgress:"0m left")
        }()
        return [step1,step2,step3,step4,step5,step6]
        
    }()

}
