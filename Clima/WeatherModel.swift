//
//  WeatherModel.swift
//  Clima
//
//  Created by mac on 11/14/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation


struct WeatherModel {
    
    let conditionId: Int
    let temperature : Double
    let cityName: String
     
    var tempratureString: String{
        return  String(format: "%.1f", temperature)
    }
    var contionName: String{
        switch conditionId {
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
