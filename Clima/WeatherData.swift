//
//  WeatherData.swift
//  Clima
//
//  Created by mac on 11/14/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation


struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    
}


struct Main: Decodable {
    let temp: Double
    
}

struct Weather: Decodable {
    let description: String
    let main: String
    let icon: String
    let id: Int
    
}
