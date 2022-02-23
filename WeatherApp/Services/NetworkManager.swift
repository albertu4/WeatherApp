//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Михаил Иванов on 18.02.2022.

import Foundation
import UIKit

class NetworkManager {
    
    var image: UIImage?
    var forecastImage: UIImage?
    
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
    
    func fetchtImage(link: String) -> UIImage{
        
        let errorImage = UIImage(systemName: "wifi.slash")
        guard let url = URL(string: link) else { return errorImage!}
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            guard let fetchedImage = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.image = fetchedImage
            }
        }.resume()
        return image ?? errorImage!
    }
    
    func fetchForecastImage(link: String) -> UIImage {
        
        let errorImage = UIImage(systemName: "wifi.slash")
        guard let url = URL(string: link) else { return errorImage!}
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            guard let fetchedImage = UIImage(data: data) else { return }
            
            DispatchQueue.global().async {
                self.forecastImage = fetchedImage
            }
        }.resume()
        return forecastImage ?? errorImage!
    }
}

//MARK: - Enums
enum Link: String {
    case londonWeather = "https://weatherdbi.herokuapp.com/data/weather/london"
    case moscowWeather = "https://weatherdbi.herokuapp.com/data/weather/moscow"
    case newYorkWeather = "https://weatherdbi.herokuapp.com/data/weather/newYork"
    case seoulWeather = "https://weatherdbi.herokuapp.com/data/weather/seoul"
}

enum UnitOfSpeedMeasurement: String {
    case kilometres = "km"
    case miles
}

enum UnitOfTemperatureMeasurement: String {
    case fahrenheit = "f"
    case celsius = "c"
}


