//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Михаил Иванов on 18.02.2022.

import Foundation

enum Link: String {
    case londonWeather = "https://weatherdbi.herokuapp.com/data/weather/london"
    case moscowWeather = "https://weatherdbi.herokuapp.com/data/weather/moscow"
    case newYorkWeather = "https://weatherdbi.herokuapp.com/data/weather/newYork"
    case yakutskWeather = "https://weatherdbi.herokuapp.com/data/weather/yakutsk"
    case seoulWeather = "https://weatherdbi.herokuapp.com/data/weather/seoul"
}

class NetworkManager {
    
    func fetchWeather(link: Link.RawValue, completion: @escaping (Result<Weather, Error>) -> ()) {
        guard let url = URL(string: link) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let weather = try JSONDecoder().decode(Weather.self, from: data)
                completion(.success(weather))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}



