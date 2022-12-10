
import Foundation

class SearchViewModel{
    
    
    func weatherForSpecialСities(city:String, _ complition: @escaping (CurrentWeatherModel)->()){
        let new = city.replacingOccurrences(of: " ", with: "_")
        NetworkManager.shared.locactionToCoordinate(city: new){ locationData in
           
   
            guard locationData.first != nil else {return}
            
            NetworkManager.shared.currentWeather(latitude: locationData.first!.lat, longitude: locationData.first!.lon) { currentWeather in
                
                    complition(currentWeather)
                }
            
        }
                
    }
 
    func searchWeather(city:String, _ complition: @escaping ([CurrentWeatherModel])->()){
        let new = city.replacingOccurrences(of: " ", with: "_")
        var arrayForComplition: [CurrentWeatherModel] = []
        NetworkManager.shared.locactionToCoordinate(city: new){ locationData in
           
   
           // guard locationData.first != nil else {return}
            for data in locationData{
                NetworkManager.shared.currentWeather(latitude: data.lat, longitude: data.lon) { currentWeather in
                    arrayForComplition.append(currentWeather)
                    complition(arrayForComplition)
                    //print(currentWeather)
                }
            }
            
            
        }
                
    }
    
    
    
}
