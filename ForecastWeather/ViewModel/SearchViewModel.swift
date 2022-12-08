
import Foundation

class SearchViewModel{
    
    
    func searchWeather(city:String, _ complition: @escaping (CurrentWeatherModel)->()){
        NetworkManager.shared.locactionToCoordinate(city: city){ locationData in
            

 
            guard locationData.first != nil else {return}
            
            NetworkManager.shared.currentWeather(latitude: locationData.first!.lat, longitude: locationData.first!.lon) { currentWeather in
                
                    complition(currentWeather)
                    //print(currentWeather)
                }
            
        }
                
    }
    
    
    
    
}
