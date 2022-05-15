import Foundation

struct LaunchesModel : Decodable {
    let launchesID : String?
    let name : String?
    let details : String?
    let date : String?
    let links : LinkModel?
    
    enum CodingKeys : String, CodingKey {
        case launchesID = "id"
        case name = "name"
        case details = "details"
        case date = "date_local"
        case links = "links"
    }
}
