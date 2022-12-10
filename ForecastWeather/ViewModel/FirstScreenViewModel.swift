
import Foundation
class FirstScreenViewModel{
   var searchViewModel = SearchViewModel()
    
    
    var arrayCities = ["Warsaw","Bucharest","Martuni","Shah Alam","Karmie","Budapest","Munich","Netivot","Santa Cruz de la Sierra","Porto Alegre","Kfar Yona","Palermo","Bremen","Jermuk","Beit Shemesh","Florence","Utrecht","Buenos Aires","Guayaquil","Rosario","Soledad","Subang Jaya","Valencia","Pasir Gudang","Akhtala"]
    

    
    
    
    func createDataForFirstScreen(_ complition: @escaping ([CurrentWeatherModel]?)->()){
        var arrayForComplition: [CurrentWeatherModel] = []
        
        for city in arrayCities {
            searchViewModel.weatherForSpecialСities(city: city) { [weak self] currentWeather in
                guard self != nil else {return}
                arrayForComplition.append(currentWeather)
                complition(arrayForComplition)
                
            }
            
        }
    }
    

    
    
    
}
