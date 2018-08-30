import Foundation
import CoreLocation

/**
 * Extension for Loc
 */
extension Loc{
    /**
     * Fetches Name of Place and Country (ASYNC)
     * Example: country: Norway, locality Akershus
     */
    func locality(onComplete:@escaping (_ locality:String)->Void) {
        let userLocation:CLLocation = CLLocation.init(latitude: lat, longitude: long)
        //        Swift.print("user latitude = \(userLocation.coordinate.latitude)")
        //        Swift.print("user longitude = \(userLocation.coordinate.longitude)")
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if error != nil{
                print("error in reverseGeocode")
            }
            if  let placemarksUnwrapped:[CLPlacemark] = placemarks,
                let firstPlacemark:CLPlacemark = Optional(placemarksUnwrapped[0]),
                let locality:String = firstPlacemark.locality,
                let country:String = firstPlacemark.country {
                let localityStr:String = "\(locality), \(country)" // \(placemark.administrativeArea!),
                onComplete(localityStr)
            }else {
                onComplete("unknown location")
            }
        }
    }
}

//                let placemark = placemarks! as [CLPlacemark]
//                if placemark.count > 0{
//                let placemark = placemarks![0]
//                Swift.print("placemark.locality:  \(placemark.locality)")

//                print(placemark.administrativeArea!)
//                Swift.print("placemark.country:  \(placemark.country)")

