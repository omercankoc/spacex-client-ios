import Foundation

struct LaunchesModel : Decodable {
    let launchesID : String?
    let flightNumber : Int?
    let name : String?
    let details : String?
    let date : String?
    let success : Bool?
    let links : LinkModel?
    
    enum CodingKeys : String, CodingKey {
        case launchesID = "id"
        case flightNumber = "flight_number"
        case name = "name"
        case details = "details"
        case date = "date_local"
        case success = "success"
        case links = "links"
    }
}
