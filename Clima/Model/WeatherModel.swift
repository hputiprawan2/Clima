//
//  WeatherModel.swift
//  Clima
//
//  Created by Hanna Putiprawan on 1/23/21.
//

import Foundation

struct WeatherModel {
    let conditionID: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    
    // Computed property
    var conditionName: String {
        switch conditionID {
        case 200...232: return "cloud.bolt.rain"
        case 300...321: return "cloud.drizzle"
        case 500...501: return "cloud.rain"
        case 502...504: return "cloud.heavyrain"
        case 511:       return "cloud.hail"
        case 520...522: return "cloud.rain"
        case 531:       return "cloud.rain"
        case 600...602: return "cloud.snow"
        case 611...616: return "cloud.sleet"
        case 620...622: return "cloud.sleet"
        case 800:       return "sun.max"
        case 801...804: return "smoke"
        default:
            return "questionmark"
        }
    }
    
}
