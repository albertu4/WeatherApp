//
//  CurrentCollectionViewCell.swift
//  WeatherApp
//
//  Created by Михаил Иванов on 19.02.2022.
//

import UIKit

class CurrentWeatherCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var weatherTime: UILabel!
    @IBOutlet var currentTemperature: UILabel!
    @IBOutlet var weatherIcon: UIImageView?
    @IBOutlet var weatherComment: UILabel!
    @IBOutlet var precipitation: UILabel!
    @IBOutlet var wind: UILabel!
    @IBOutlet var humidity: UILabel!
    
    func showCurrentWeatherData(currentWeather: CurrentConditions, temperatureMeasurement: String, windSpeedMeasurment: String, networkManager: NetworkManager) {
        self.weatherTime.text = currentWeather.dayhour
        self.currentTemperature.text = "\(currentWeather.temp?[temperatureMeasurement] ?? 0)°C"
        self.weatherComment.text = currentWeather.comment
        self.precipitation.text = "Precipitation \n\(currentWeather.precip ?? "")"
        self.humidity.text = "Humidity \n\(currentWeather.humidity ?? "")"
        self.wind.text = "Wind \n\(currentWeather.wind?[windSpeedMeasurment] ?? 0) km/h"
        self.weatherIcon?.image = networkManager.fetchtImage(link: currentWeather.iconURL ?? "")
    }
}

