import UIKit

/**
 * These are universal methods across all services
 */
extension Service{
    
    /**
     * TODO: ⚠️️ Should throw of course
     */
    static func getBuildingName(loc:Loc) -> String?{
        guard let buildingData:BuildingData = getBuildingData(loc: loc) else {return nil}
        let buildingName:String = buildingData.name//getBuildingName(buildingData:buildingData) else {return nil}
        return buildingName
    }
    /**
     * TODO: ⚠️️ Should throw of course
     */
    static func getRoomName(loc:Loc, floor:Int) -> String? {
        guard let buildingData:BuildingData = getBuildingData(loc: loc) else {return nil}
        guard let roomData:RoomData = getRoomData(loc: loc, buildingData: buildingData, floor: floor) else {return nil}
        let roomName:String = roomData.roomName//getRoomName(buildingId:buildingId,roomId:roomId) else {return nil}
        return roomName
    }
    /**
     * Returns buildingName and roomName for loc and floor
     */
    static func getBuildingNameAndRoomName(loc:Loc, floor:Int) -> BuildingNameAndRoomName? {
        let buildingName:String? = getBuildingName(loc: loc)
        let roomName:String? = getRoomName(loc: loc, floor: floor)
        return (buildingName:buildingName,roomName:roomName)
    }
}
/**
 * TODO: ⚠️️ Use structs 
 */
typealias Loc = (long:CGFloat,lat:CGFloat)
typealias BuildingNameAndRoomName = (buildingName:String?,roomName:String?)
typealias BuildingData = (id:Int, name:String, loc:Loc, radius:CGFloat, rooms:[RoomData])
typealias RoomData = (roomId:Int, roomName:String,floor:Int,loc:Loc, radius:CGFloat)
