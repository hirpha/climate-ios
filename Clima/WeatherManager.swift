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
    
    
    func fetchWeather(cityName: String) {
        let urlString = baseURL + "&q=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // 1 create url
        
        if let url = URL(string: urlString) {
            // 2. create a URLSession
            let urlSeession = URLSession(configuration: .default)
            
            // 3. Give the session a task
            
            let task = urlSeession.dataTask(with: url ) {(data: Data?, response: URLResponse?, error: Error?) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(data: safeData)
                    
                }
            }
            // 4 start task
            task.resume()
            
        }
    }
    
    func parseJSON(data: Data)  {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: data)
            let id  = decodedData.weather[0].id
            print(getConditionName(id) )
        } catch {
            print(error)
        }
        
    }
    
    func getConditionName(_ condition: Int) -> String {
        switch condition {
        case 200 ... 232:
            return "cloud.bold"
         case 300 ... 321:
            return "cloud.rain.bolt"
        case 500 ... 531:
            return "cloud.rain"
        case 600 ... 622:
            return "cloud.snow"
        case 700 ... 781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801 ... 804:
            return "cloud.sun.rain"
        default:
            return "cloud"
        }
    }
}
