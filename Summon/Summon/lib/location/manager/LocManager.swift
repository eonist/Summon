import Foundation
import CoreLocation

class LocationManager: NSObject {
    var loc:Loc { return .init(lat:currentLocation.coordinate.latitude, long:currentLocation.coordinate.longitude) }//init(lat:59.9139,long:10.7522)//⚠️️ init in oslo, debug
    var currentLocation = CLLocation()
    var locationManager = CLLocationManager()
    var region = CLCircularRegion()
    /*Callbacks*/
    var onExitRegion:ExitRegion = { Swift.print("⚠️️ onExitRegion - no callback is assigned ⚠️️")}
    var onBeganMonitoring:BeganMonitoring = { Swift.print("⚠️️ onBeganMonitoring - no callback is assigned ⚠️️")}
    var authorizationCallback:Authorization = { _ in Swift.print("⚠️️ authorizationCallback - no callback is assigned ⚠️️")}
    /*singleton*/
    static let sharedInstance = LocationManager()
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
    }
}


