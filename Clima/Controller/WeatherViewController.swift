//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    let weatherManager = WeatherManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func searchButtonClicked(_ sender: UIButton) {
        weatherManager.fetchWeather(cityName: searchTextField.text!)
        print(searchTextField.text ?? "")
        searchTextField.text = ""
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            textField.placeholder = "Enter a city name"
            let alert = UIAlertController(title: "Error", message: "Please enter a city name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return false
        } else {
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        weatherManager.fetchWeather(cityName: textField.text!)
        searchTextField.text = ""
    }
    
    
    
}

