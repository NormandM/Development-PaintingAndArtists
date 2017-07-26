//
//  ForecastWeather.swift
//  FiveDaysWeatherForeCast
//
//  Created by Normand Martin on 17-06-23.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import Foundation
struct ForeCastWeather{
    let temperature: Double
    let humidity: Double
    let precipitationProbability: Double
    let summary: String
    let icone: String
    let time: Double
    let windSpeed: Double
    let windGust: Double
    let cloudCover: Double
    let uvIndex: Double
    let precipType: String
    let temperatureMin: Double
    let temperatureMax: Double
    let sunriseTime: Double
    let sunsetTime: Double
    
}

extension ForeCastWeather {
    
    struct Key {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipitationProbability  = "precipProbability"
        static let summary = "summary"
        static let icon = "icon"
        static let time = "time"
        static let windSpeed = "windSpeed"
        static let windGust = "windGust"
        static let cloudCover = "cloudCover"
        static let uvIndex = "uvIndex"
        static let precipType = "precipType"
        static let temperatureMin = "temperatureMin"
        static let temperatureMax = "temperatureMax"
        static let sunriseTime = "sunriseTime"
        static let sunsetTime = "sunsetTime"


    }
    init?(json: [String: AnyObject]){

        if let tempValue = json[Key.temperature] as? Double {
            self.temperature = tempValue
        }else{
            self.temperature = 1000
        }
        if let humidityValue = json[Key.humidity] as? Double{
            self.humidity = humidityValue
        }else{
            self.humidity = 1000
        }

        if let precipitationProbabilityValue = json[Key.precipitationProbability] as? Double{
            self .precipitationProbability = precipitationProbabilityValue
        }else{
            self.precipitationProbability = 1000
        }

        if let summaryString = json[Key.summary] as? String{
            self.summary = summaryString
        }else{
            self.summary = "N/A"
        }

        if let iconString = json[Key.icon] as? String{
            self.icone = iconString
        }else{
            self.icone = "N/A"
        }

        if let timeValue = json[Key.time] as? Double{
            self.time = timeValue
        }else{
            self.time = 1000
        }

        if let windSpeedValue = json[Key.windSpeed] as? Double {
            self.windSpeed = windSpeedValue
        }else{
            self.windSpeed = 1000
        }

        if let windGustValue = json[Key.windGust] as? Double {
            self.windGust = windGustValue
        }else{
            self.windGust = 1000
        }

        if let cloudCoverValue = json[Key.cloudCover] as? Double {
            self.cloudCover = cloudCoverValue
        }else{
            self.cloudCover = 1000
        }

        if let uvIndexValue = json[Key.uvIndex] as? Double {
            self.uvIndex = uvIndexValue
        }else{
            self.uvIndex = 1000
        }

        if let precipTypValue = json[Key.precipType] as? String {
            self.precipType = precipTypValue
        }else{
            self.precipType = "N/A"
        }
        if let temperatureMinValue = json[Key.temperatureMin] as? Double{
            self .temperatureMin = temperatureMinValue
        }else{
            self.temperatureMin = 1000
        }
        if let temperatureMaxValue = json[Key.temperatureMax] as? Double{
            self .temperatureMax = temperatureMaxValue
        }else{
            self.temperatureMax = 1000
        }
        if let sunriseTimeValue = json[Key.sunriseTime] as? Double{
            self .sunriseTime = sunriseTimeValue
        }else{
            self.sunriseTime = 1000
        }
        if let sunsetTimeValue = json[Key.sunsetTime] as? Double{
            self .sunsetTime = sunsetTimeValue
        }else{
            self.sunsetTime = 1000
        }

    }
}


