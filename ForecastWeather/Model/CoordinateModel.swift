

import Foundation

struct Coordinate: Codable {
    let name: String
    let localNames: [String: String]?
    let lat, lon: Double
    let country, state: String?

    enum CodingKeys: String, CodingKey {
        case name
        case localNames = "local_names"
        case lat, lon, country, state
    }
}
typealias CoordinateModel = [Coordinate]
