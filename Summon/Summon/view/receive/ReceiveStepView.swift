import UIKit

class ReceiveStepView:UIView,UIGestureRecognizerDelegate{
    var compassView:UIView?
    var textView:DialogTextView?
    var progressTextLabel:UILabel?
    
//    var onPressed = {}/* Called when the view goes to pressed state (set desired appearance) */
    var onReleased = {}/* Called when the view is released (perform desired action) */

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear//debug
        textView = createText()
        
        //
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(touched(_:)))
        recognizer.delegate = self
        recognizer.minimumPressDuration = 0.0
        addGestureRecognizer(recognizer)
        self.isUserInteractionEnabled = true
    }
    /**
     * Gesture handler
     */
    @objc func touched(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            //onPressed()
        } else if sender.state == .ended {
            onReleased()
        }
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ReceiveStepView{
    /**
     * 
     */
    func setState(step:Step){
//        let step:Step = MainView.steps[stepIndex]
//        let textstr:String = step.text
//        let currentProgress:String? = step.currentProgress != nil
//        let
        
        
        if step.hasCompass {
            compassView = createCompassView()
        }else {
            if let compassView = self.compassView { compassView.removeFromSuperview() } /*Remove it if it exists*/
        }
        if step.currentProgress != nil {
            let progressTextLabel = self.progressTextLabel ?? createProgressTextLabel()
            progressTextLabel.text = step.currentProgress
        }else {
            if let progressTextLabel = self.progressTextLabel { progressTextLabel.removeFromSuperview() } /*Remove it if it exists*/
        }
        textView?.text = step.text
    }
    /**
     * Creates compassview
     */
    func createCompassView() -> UIView{
        let margin:CGFloat = 40
//        let rect = CGRect.init(x: 0, y: 0, width: 132, height: 132)
        let view = UIImageView.init(image: #imageLiteral(resourceName: "arrow"))//UIView(frame: rect)
        view.frame.origin.x = UIScreen.main.bounds.width/2 - view.frame.size.width / 2
        view.frame.origin.y = margin
        view.backgroundColor = .purple
        addSubview(view)
        return view
    }
    
    /**
     *
     */
    func createProgressTextLabel() -> UILabel{
//        let rect = CGRect.init(x: 0, y: 0, width: 300, height: 64)
        let label = UILabel.init(frame: .zero)
        label.textColor = .white
        label.textAlignment = .center
        addSubview(label)
        label.activateConstraint{ view in/*Constraints*/
            let anchor = Constraint.anchor(view, to: self, align: .bottomCenter, alignTo: .bottomCenter)
            let size = Constraint.size(view, size: CGSize(width:300,height:64))
            return [anchor.x,anchor.y,size.w,size.h]
        }
        
        return label
    }
}
