
import Foundation
class FirstScreenViewModel{
   var searchViewModel = SearchViewModel()
    
    
    var arrayCities = ["Warsaw","Bucharest","Martuni","Shah Alam","Karmie","Budapest","Munich","Netivot","Santa Cruz de la Sierra","Porto Alegre","Kfar Yona","Palermo","Bremen","Jermuk","Beit Shemesh","Florence","Utrecht","Buenos Aires","Guayaquil","Rosario","Soledad","Subang Jaya","Valencia","Pasir Gudang","Akhtala"]
    

    
    
    
    func createDataForFirstScreen(_ complition: @escaping ([CurrentWeatherModel]?)->()){
        var arrayForComplition: [CurrentWeatherModel] = []
        
        for city in arrayCities {
            let new = city.replacingOccurrences(of: " ", with: "_")
            searchViewModel.searchWeather(city: new) { [weak self] currentWeather in
                guard self != nil else {return}
                //print(currentWeather.name)
                arrayForComplition.append(currentWeather)
                complition(arrayForComplition)
                
            }
            
        }
    }
    
//    func TEst(_ complition: @escaping ([CurrentWeatherModel]?)->()){
//        var arrayForComplition: [CurrentWeatherModel]?
//        
//        searchViewModel.searchWeather(city: "Santa_Cruz_de_la_Sierra") { data in
//            arrayForComplition?.append(data)
//        }
//        
//        complition(arrayForComplition)
//    }
    
    
    
}
