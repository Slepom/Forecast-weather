// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct HourlyModel: Codable {
    let cod: String
    let message, cnt: Int
    let list: [ListHourly]
    //let city: City
}

// MARK: - City
//struct City: Codable {
//    let id: Int
//    let name: String
//    let coord: Coord
//    let country: String
//    let population, timezone, sunrise, sunset: Int
//}

// MARK: - Coord
//struct Coord: Codable {
//    let lat, lon: Double
//}

// MARK: - List
struct ListHourly: Codable {
    let dt: Int
    let main: MainClassHourly
    //let weather: [WeatherHourly]
    let clouds: CloudsHourly
    let wind: WindHourly
    let visibility: Int
    //let pop: Double
   // let sys: SysHourly
    let dtTxt: String
   // let rain: RainHourly?

    enum CodingKeys: String, CodingKey {
        case dt, main, clouds, wind, visibility
        case dtTxt = "dt_txt"
        //case rain
    }
}

// MARK: - Clouds
struct CloudsHourly: Codable {
    let all: Int
}

// MARK: - MainClass
struct MainClassHourly: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Rain
//struct RainHourly: Codable {
//    let the3H: Double
//
//    enum CodingKeys: String, CodingKey {
//        case the3H = "3h"
//    }
//}

// MARK: - Sys
//struct Sys: Codable {
//    let pod: Pod
//}

//enum Pod: String, Codable {
//    case d = "d"
//    case n = "n"
//}

// MARK: - Weather
struct WeatherHourly: Codable {
    let id: Int
    //let main: MainEnum
    let weatherDescription: Description
    let icon: Icon

//    enum CodingKeys: String, CodingKey {
//        case id
//        case weatherDescription = "description"
//        case icon
//    }
}

enum Icon: String, Codable {
    case the04D = "04d"
    case the04N = "04n"
   // case the10N = "10n"
}

//enum MainEnum: String, Codable {
//    case clouds = "Clouds"
//    case rain = "Rain"
//}

enum Description: String, Codable {
    case lightRain = "light rain"
    case overcastClouds = "overcast clouds"
}

// MARK: - Wind
struct WindHourly: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}
