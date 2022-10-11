//
//  NetworkWeatherManager.swift
//  Sunny
//
//  Created by Сергей Иванов on 11.10.2022.
//  Copyright © 2022 Ivan Akulov. All rights reserved.
//

import Foundation

struct NetworkWeatherManager {
    func fetchCurrentWeather(forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
           let currentWeather = parseJSON(withDate: data)
            }
        }
        task.resume()
    }
    
    
    func parseJSON(withDate data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do {
             let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else { return nil }
            return currentWeather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
