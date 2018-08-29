import UIKit

/**
 * TODO: Bluetooth nearfield detection Exchange id
 * TODO: CloudKit send ping to other user UUID
 * TODO: Altimeter detect stair flight count 👈
 * TODO: Basic UI 👈
 */

/**
 * - basic UI 👈
 * - timer that simulates the CLLocation manager 👈
 * - Make gif-video 👈
 * - ClLocManger x and y
 * - Clloc floor
 * - Fake BIM model api ✅
 * - Live loc updates UI steps
 */


/**
 * Click send -> nav -> add ReceiveStepView
 * Click accept -> nav -> stepIndex -> ReceiveStepView.setState (step:steps[stepIndex];stepIndex += 1)
 * click view.addGestureTap -> nav.setView(.receiveStepView) -> iterates -> and so on
 */

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    /**
     * Boilerplate
     */
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {return true}
    func applicationWillResignActive(_ application: UIApplication) {  }
    func applicationDidEnterBackground(_ application: UIApplication) { }
    func applicationWillEnterForeground(_ application: UIApplication) { }
    func applicationDidBecomeActive(_ application: UIApplication) { }
    func applicationWillTerminate(_ application: UIApplication) { }
}

