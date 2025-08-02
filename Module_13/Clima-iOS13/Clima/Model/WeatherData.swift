
//
//  WeatherData.swift
//  Clima
//
//  Created by Никита Грицунов on 30.07.2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}


struct Main: Decodable {
    let temp: Double
}


struct Weather: Decodable {
    let id: Int
}
