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
    let baseURL = "https://api.openweathermap.org/data/2.5/weather?appid=79a00bc725c0975071f6074f3a341ef0"
    
    
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
            
            let task = urlSeession.dataTask(with: url, completionHandler: handler)
            
            // 4 start task
            task.resume()
            
            
        }
        
        func handler(data: Data?, response: URLResponse?, error: Error?) {
            if error != nil {
                print(error!)
                return
            }
            
            if let safeData = data {
                let dataString = String(data: safeData, encoding: .utf8)
                print(dataString!)
                
                
            }
            
        }
        
        
    }
}
