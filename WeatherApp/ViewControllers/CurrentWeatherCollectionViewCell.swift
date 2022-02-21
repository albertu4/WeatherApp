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
    
}

