import Foundation
import CoreLocation

/**
 * Event handlers
 */
extension LocationManager {
    /**
     * Event handler for when the autherization is accepted or denied
     */
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.denied {
            Swift.print("denied 👌")
            authorizationCallback(false)
        } else if status == CLAuthorizationStatus.authorizedAlways {
            /*The user accepted authorization*/
            Swift.print("accepted 👌")
            authorizationCallback(true)
        }
    }
    /**
     * Event handler for when the GPS location updates
     */
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        Swift.print("didUpdateLocations: \(locations.last!)")
        /*Update current location*/
        currentLocation = locations.last!
    }
    /**
     * Event handler for when the GPS location starts monitoring
     */
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        Swift.print("didStartMonitoringFor 👈")
        Swift.print("loc:  \(loc)")
        onBeganMonitoring()/*Calls */
    }
    /**
     * Event handler for when the GPS location goes outside the defined "radius fence"
     */
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("LocationManager: exited region")
        /*Stop monitoring for old region so we can create a new region*/
        locationManager.stopMonitoring(for: self.region)
        /*Setup and start monitoring for new region*/
        startMonitoringForRegion()
        onExitRegion()/*call the callback method*/
    }
}
/**
 * Error handlers
 */
extension LocationManager:CLLocationManagerDelegate {
    /**
     * Error handler
     */
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location: Location Manager failed with the following error: \(error)")
    }
    /**
     * Error handler
     */
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        Swift.print("Location: Monitoring failed for region with identifier: \(region!.identifier)")
    }
}
