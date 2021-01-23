//
//  WeatherData.swift
//  Clima
//
//  Created by Hanna Putiprawan on 1/23/21.
//

import Foundation

// Weather Object that come back from the API called
// conform to Decodable protocol: a type that can decode itself from an external representation
struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
    let description: String
}
