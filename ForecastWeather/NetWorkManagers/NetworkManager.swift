

import Foundation
import Alamofire
class NetworkManager{
    
    static var shared = NetworkManager()
   
    
    private init() {}
    
    let apiKey = "78e7f9f338c58758934eb23fad97fb9c"
    let scheme = "https://"
    let host = "api.openweathermap.org"
    
// http://api.openweathermap.org/geo/1.0/direct?q=London&appid=78e7f9f338c58758934eb23fad97fb9c
//    https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

    func locactionToCoordinate(city: String,complitionHandler: @escaping (CoordinateModel)->()){
//        let parameters: [String: Any] = [
//            "q": city,
//            "appid": apiKey
//        ]

        let request = AF.request("https://api.openweathermap.org/geo/1.0/direct?q=\(city)&appid=\(apiKey)", method: .get)
        request.responseDecodable(of: CoordinateModel.self) { response in

            do {
                let requestModel = try response.result.get()
                complitionHandler(requestModel)
                //print(requestModel)
            } catch{
                print("error????????? \(error)")
            }

        }


    }
    
    func currentWeather(latitude: Double, longitude: Double, complitionHandler: @escaping (CurrentWeatherModel)->Void){
//        let parameters: [String: Any] = [
//            "lat": latitude,
//            "lon": longitude,
//            "appid": apiKey
//        ]
    
        let request = AF.request("https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric", method: .get)
        request.responseDecodable(of: CurrentWeatherModel.self) { response in
            
            do{
                let requestModel = try response.result.get()
                complitionHandler(requestModel)
                //print(requestModel)
            } catch{
                print("error!!!!!!!!!!!!!!!!! \(error)")
            }
        }
        
        
    }
    
//    func new(latitude: Double, longitude: Double, complitionHandler: @escaping ([CurrentWeatherModel])->Void){
////        let parameters: [String: Any] = [
////            "lat": latitude,
////            "lon": longitude,
////            "appid": apiKey
////        ]
//
//        var arraySearch: [CurrentWeatherModel] = []
//        let request = AF.request("https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric", method: .get)
//        request.responseDecodable(of: CurrentWeatherModel.self) { response in
//
//            do{
//                let requestModel = try response.result.get()
//                arraySearch.append(requestModel)
//                complitionHandler(arraySearch)
//                //print(requestModel)
//            } catch{
//                print("error!!!!!!!!!!!!!!!!! \(error)")
//            }
//        }
//
//
//    }
    
    //api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid=78e7f9f338c58758934eb23fad97fb9c&units=metric
    
    func weatherCurrentCity(latitude: Double, longitude: Double, complitionHandler: @escaping ([ListHourly]?)->Void){
//        let parameters: [String: Any] = [
//            "lat": latitude,
//            "lon": longitude,
//            "appid": apiKey
//        ]
    
        let request = AF.request("https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric", method: .get)
        request.responseDecodable(of: HourlyModel.self) { response in
            
            do{
                let requestModel = try response.result.get().list
                complitionHandler(requestModel)
                //print("!@1231231231231231231 \(requestModel)")
            } catch{
                print("error request weatherCurrentCity \(error)")
            }
        }
        
        
    }
    
    
    
}
