import Foundation

/**
 * Callback signatures
 */
extension LocationManager{
    typealias ExitRegion = () -> Void
    typealias BeganMonitoring = () -> Void
    typealias Authorization = (Bool) -> Void
}
