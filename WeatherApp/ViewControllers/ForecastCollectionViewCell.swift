//
//  ForecastCollectionViewCell.swift
//  WeatherApp
//
//  Created by Михаил Иванов on 19.02.2022.
//

import UIKit

class ForecastCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var forecastDay: UILabel!
    @IBOutlet var forecastComment: UILabel!
    @IBOutlet var forecastMinTemp: UILabel!
    @IBOutlet var forecastMaxTemp: UILabel!
    @IBOutlet var forecastIcon: UIImageView!
}
