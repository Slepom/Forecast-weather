

import Foundation

class WeatherCurrentCityViewModel{
    
//    func weatherByName(city:String, _ complition: @escaping (CurrentWeatherModel)->()){
//        let new = city.replacingOccurrences(of: " ", with: "_")
//        NetworkManager.shared.locactionToCoordinate(city: new){ locationData in
//
//
//            guard locationData.first != nil else {return}
//
//            NetworkManager.shared.currentWeather(latitude: locationData.first!.lat, longitude: locationData.first!.lon) { currentWeather in
//
//                    complition(currentWeather)
//                }
//
//        }
//
//    }
 
    func weatherByCoordinate(city:String, _ complition: @escaping ([ListHourly]?)->()){
        let new = city.replacingOccurrences(of: " ", with: "_")
        //var arrayForComplition: [ListHourly]?
        NetworkManager.shared.locactionToCoordinate(city: new){ locationData in
            
   
           guard locationData.first != nil else {return}
        
            NetworkManager.shared.weatherCurrentCity(latitude: locationData.first!.lat, longitude: locationData.first!.lon) { currentWeather in
                    //arrayForComplition?.append(currentWeather)
                    complition(currentWeather)
                    //print(currentWeather)
                }
            
            
            
        }
                
    }
    
}
