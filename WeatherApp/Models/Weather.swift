//
//  Weather.swift
//  WeatherApp
//
//  Created by Михаил Иванов on 18.02.2022.

struct CurrentConditions: Decodable {
    
    let region: String?
    let dayhour: String?
    let temp: [String: Int]?
    let precip: String?
    let humidity: String?
    let wind: [String: Int]?
    let iconURL: String?
    let comment: String?
}

struct NextDays: Decodable {
    let day : String?
    let comment: String?
    let max_temp: [String: Int]?
    let min_temp: String?
    let iconURL: String?
}
