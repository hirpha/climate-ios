//
//  WeatherManagerDelegate.swift
//  Clima
//
//  Created by mac on 11/14/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation


protocol WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, _ weather: WeatherModel)
    func didFailWithError ( error: Error)
}
