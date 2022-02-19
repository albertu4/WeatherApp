//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Михаил Иванов on 18.02.2022.
//import Foundation

import Foundation

enum Link: String {
    case londonWeather = "https://weatherdbi.herokuapp.com/data/weather/london"
    case moscowWeather = "https://weatherdbi.herokuapp.com/data/weather/moscow"
    case newYorkWeather = "https://weatherdbi.herokuapp.com/data/weather/newYork"
    case yakutskWeather = "https://weatherdbi.herokuapp.com/data/weather/yakutsk"
    case seoulWeather = "https://weatherdbi.herokuapp.com/data/weather/seoul"
}

func fetchCurrentWeather(link: Link.RawValue) {
    guard let url = URL(string: link) else { return }
    URLSession.shared.dataTask(with: url) { data, _, error in
        guard let data = data else { return }
        
        do {
            let currentConditions = try JSONDecoder().decode(CurrentConditions.self, from: data)
        } catch let error {
            print(error.localizedDescription)
        }

    }.resume()
}

func fetchForecast(link: Link.RawValue) {
    guard let url = URL(string: link) else { return }
    URLSession.shared.dataTask(with: url) { data, _, error in
        guard let data = data else { return }
        
        do {
            let nextDays = try JSONDecoder().decode([NextDays].self, from: data)
            DispatchQueue.main.async {
                print(nextDays)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }.resume()
}
