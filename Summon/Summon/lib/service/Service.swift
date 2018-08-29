import UIKit
/**
 * TODO: ⚠️️ Should throw of course
 */
protocol Service {
//    func getBuildingId(loc:Loc) -> Int?
//    func getRoomId(loc:Loc,buildingId:Int,floor:Int) -> Int?
    static func getBuildingData(loc:Loc) -> BuildingData?
    static func getRoomData(loc:Loc, buildingData: BuildingData, floor:Int) -> RoomData?
}

