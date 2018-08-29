import UIKit

class DummyService:Service {
    static let buildings:[BuildingData] = DummyService.generateDummyData()
    /**
     * Returns building data for loc
     */
    func getBuildingData(loc: Loc) -> BuildingData? {
        let buildingData:BuildingData? = DummyService.buildings.first(where: {// TODO: ⚠️️ move into closure assert var
            let minLong:CGFloat = $0.loc.long - $0.radius
            let maxLong:CGFloat = $0.loc.long + $0.radius
            let minLat:CGFloat = $0.loc.lat - $0.radius
            let maxLat:CGFloat = $0.loc.lat - $0.radius
            let isWithinLong:Bool = loc.long >= minLong && loc.long <= maxLong
            let isWithinLat:Bool = loc.long >= minLat && loc.long <= maxLat
            return isWithinLong && isWithinLat
        })
        return buildingData
    }
    /**
     * Returns room data for loc, buildingData and floor
     */
    func getRoomData(loc: Loc, buildingData: BuildingData, floor: Int) -> RoomData? {
        let roomData:RoomData? = buildingData.rooms.first(where: {// TODO: ⚠️️ move into closure assert var
            let minLong:CGFloat = $0.loc.long - $0.radius
            let maxLong:CGFloat = $0.loc.long + $0.radius
            let minLat:CGFloat = $0.loc.lat - $0.radius
            let maxLat:CGFloat = $0.loc.lat - $0.radius
            let isWithinLong:Bool = loc.long >= minLong && loc.long <= maxLong
            let isWithinLat:Bool = loc.long >= minLat && loc.long <= maxLat
            return isWithinLong && isWithinLat
        })
        return roomData
    }
}
/**
 * Dummy data
 */
extension DummyService{
    /**
     * Generates dummy data
     */
    static func generateDummyData() -> [BuildingData] {
        let eastWing:BuildingData = {
            let buildingLoc:Loc = (long:23100,lat:31442)
            let room1:RoomData = {
                let roomLoc:Loc = (long:buildingLoc.long+10,lat:buildingLoc.lat-12)
                let room:RoomData = (roomId:0,roomName:"202",floor:2,loc:roomLoc,radius:10)
                return room
            }()
            let building:BuildingData = (id:0,name:"East wing",loc:buildingLoc,radius:20,rooms:[room1])
            return building
        }()
        let westWing:BuildingData = {
            let buildingLoc:Loc = (long:23020,lat:31462)
            let room1:RoomData = {
                let roomLoc:Loc = (long:buildingLoc.long+4,lat:buildingLoc.lat-15)
                let room:RoomData = (roomId:0,roomName:"405",floor:4,loc:roomLoc,radius:10)
                return room
            }()
            let building:BuildingData = (id:0,name:"West wing",loc:buildingLoc,radius:15,rooms:[room1])
            return building
        }()
        return [eastWing,westWing]
    }
}
