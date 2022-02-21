//
//  WeatherCollectionViewController.swift
//  WeatherApp
//
//  Created by Михаил Иванов on 19.02.2022.
//

import UIKit

class WeatherCollectionViewController: UICollectionViewController {
    
    private var weather: Weather?
    private let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.fetchWeather(link: Link.newYorkWeather.rawValue) { result in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    self.weather = weather
                    self.title = weather.region
                    self.collectionView.reloadData()
                    print(weather)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 7
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "currentDay", for: indexPath) as! CurrentWeatherCollectionViewCell
            cell.weatherTime.text = weather?.currentConditions?.dayhour
            cell.currentTemperature.text = String(weather?.currentConditions?.temp?["c"] ?? 0)
            cell.weatherComment.text = weather?.currentConditions?.comment
            cell.precipitation.text = weather?.currentConditions?.precip
            cell.humidity.text = weather?.currentConditions?.humidity
            cell.wind.text = String(weather?.currentConditions?.wind?["km"] ?? 0)
//            cell.weatherIcon.image = UIImage(contentsOfFile: (weather?.currentConditions?.iconURL))
            
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "forecast", for: indexPath) as! ForecastCollectionViewCell
            cell.forecastDay.text = weather?.next_days?[indexPath.row].day
            cell.forecastComment.text = weather?.next_days?[indexPath.row].comment
            cell.forecastMinTemp.text = String(weather?.next_days?[indexPath.row].min_temp["c"] ?? 0)
            cell.forecastMaxTemp.text = String(weather?.next_days?[indexPath.row].max_temp?["c"] ?? 0)
            return cell
        }
    }

}

extension WeatherCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0:
            return CGSize(width: UIScreen.main.bounds.width - 48, height: 300)
        default:
            return CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
        }
    }
}
