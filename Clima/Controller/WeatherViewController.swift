//
//  ViewController.swift
//  Clima
//
//  Created by Hanna Putiprawan on 1/21/21.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        searchTextField.delegate = self // searchTextField should report back to this self view
    }
}

// MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchBtPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    // What to do when user hit return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    // Validate what user types
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // Note: use textField when we want to generalize the method to be used in any textField
        // Check if user something in the textField before hit return
        if textField.text != "" {
            return true
        } else {
            // Remind user to enter a city
            textField.placeholder = "Enter city"
            return false // let the user keep typing
        }
    }
    
    // Clear text in the textField after hit return
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Use input from the textField before reset the textField
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
}

// MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
