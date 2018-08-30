import Foundation
import CoreLocation

/**
 * Core-methods
 */
extension LocationManager{
    /**
     * Ask the user to use GPS location for this app
     */
    func requestAuthorization() {
        Swift.print("🎉requestAuthorization-begin")
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        Swift.print("🎉requestAuthorization-ended")
    }
    /**
     * Starts monitoring GPS location data
     */
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    /**
     * Starts monitoring GPS location data
     */
    func startMonitoringForRegion() {
        setupRegion()
        locationManager.startMonitoring(for: region)
    }
    /**
     * Setup notifier for a region defined by radius and loc
     */
    func setupRegion() {
        /*Create region with center at device location*/
        if let currentLocation = locationManager.location?.coordinate {
            region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: currentLocation.latitude, longitude:  currentLocation.longitude), radius: LocationManager.regionRadius, identifier: "UpdateForecastRegion")
        } else {
            region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: loc.lat, longitude:  loc.long), radius: LocationManager.regionRadius, identifier: "UpdateForecastRegion")
        }
        region.notifyOnEntry = false/*We don't need notification when the user walks into the region,because the user is already in the region*/
        region.notifyOnExit = true/*Notify when the user walks outside this region*/
    }
}
