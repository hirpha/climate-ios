//
//  WeatherManager.swift
//  Clima
//
//  Created by mac on 11/13/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation


struct WeatherManager {
   
    let apiKey = "79a00bc725c0975071f6074f3a341ef0"
    let baseURL = "https://api.openweathermap.org/data/2.5/weather?appid=79a00bc725c0975071f6074f3a341ef0&units=metric"
    
    var delegate: WeatherManagerDelegate?
    func fetchWeather(cityName: String) {
        let urlString = baseURL + "&q=\(cityName)"
        print(urlString)
        performRequest(with: urlString)
    }
    
    func performRequest (with urlString: String) {
        // 1 create url
        
        if let url = URL(string: urlString) {
            // 2. create a URLSession
            let urlSeession = URLSession(configuration: .default)
            
            // 3. Give the session a task
            
            let task = urlSeession.dataTask(with: url ) {(data: Data?, response: URLResponse?, error: Error?) in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weatherModel = self.parseJSON(safeData){
                     
                        delegate?.didUpdateWeather(self, weatherModel)
                    }
                    
                }
            }
            // 4 start task
            task.resume()
            
        }
    }
    
    func parseJSON(_ data: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: data)
            let id  = decodedData.weather[0].id
            let temperature = decodedData.main.temp
            let cityName = decodedData.name
            
            let weatherModel = WeatherModel(conditionId: id, temperature: temperature, cityName:  cityName)
            return weatherModel
      
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    
   
}
