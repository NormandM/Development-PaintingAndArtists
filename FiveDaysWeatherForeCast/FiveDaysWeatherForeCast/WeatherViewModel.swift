//
//  WeatherViewModel.swift
//  FiveDaysWeatherForeCast
//
//  Created by Normand Martin on 17-06-23.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import Foundation
import UIKit

struct WeatherViewModel {
    let temperature: String
    let humidity: String
    let precipitationProbability: String
    let summary: String
    let icon: UIImage
    let time: String
    let windSpeed: String
    let windGust: String
    let cloudCover: String
    let uvIndex: String
    let precipType: String
    let temperatureMin: String
    let temperatureMax: String
    let sunriseTime: String
    let sunsetTime: String

    
    init(model: ForeCastWeather){
        if model.temperature == 1000 {
            self.temperature = "N/A"
        }else{
            let roundedTemperature = Int(model.temperature)
            self.temperature = "\(roundedTemperature)°C"
        }
        if model.humidity == 1000 {
            self.humidity = "N/A"
        }else{
            let humidityPercentValue = Int(model.humidity * 100)
            self.humidity = "\(humidityPercentValue)%"
        }
        if model.precipitationProbability == 1000 {
            self.precipitationProbability = "N/A"
        }else{
            let precipitationValue = Int(model.precipitationProbability * 100)
            self.precipitationProbability = "\(precipitationValue)%"
        }

        self.summary = model.summary
        
        self.precipType = model.precipType
        
        let weatherIcon = WeatherIcon(iconString: model.icone)
        self.icon = weatherIcon.image
        
        if model.time == 1000 {
            self.time = "N/A"
        }else{
            let date = NSDate(timeIntervalSince1970: model.time)
            let formatter = DateFormatter()
            formatter.dateStyle = DateFormatter.Style.full
            
            formatter.timeStyle = .short
            formatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
            let dateString = formatter.string(from: date as Date)
            
            self.time = "\(dateString)"
        }
        if model.windSpeed == 1000 {
            self.windSpeed = "N/A"
        }else{
            let windSpeedValue = Int((model.windSpeed * 3600)/1000)
            self.windSpeed = "\(windSpeedValue) km/heure"
        }
        if model.windGust == 1000 {
            self.windGust = "N/A"
        }else{
            let windGustValue = Int((model.windGust * 3600)/1000)
            self.windGust = "\(windGustValue) km/heure"
        }
        if model.cloudCover == 1000 {
            self.cloudCover = "N/A"
        }else{
            let cloudCoverValue = Int(model.cloudCover * 100)
            self.cloudCover = "\(cloudCoverValue)%"
        }
        if model.uvIndex == 1000 {
            self.uvIndex = "N/A"
        }else{
            let uvIndexValue = Int(model.uvIndex )
            self.uvIndex = "\(uvIndexValue)"
        }
        if model.sunriseTime == 1000 {
            self.sunriseTime = "N/A"
        }else{
            let date = NSDate(timeIntervalSince1970: model.sunriseTime)
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "fr_CA")
            
            dateFormatter.setLocalizedDateFormatFromTemplate("HH:mm")
            let dateString = dateFormatter.string(from: date as Date)
            
            self.sunriseTime = "\(dateString)"
        }
        if model.sunsetTime == 1000 {
            self.sunsetTime = "N/A"
        }else{
            let date = NSDate(timeIntervalSince1970: model.sunsetTime)
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "fr_CA")
            
            dateFormatter.setLocalizedDateFormatFromTemplate("HH:mm")
            let dateString = dateFormatter.string(from: date as Date)

            self.sunsetTime = "\(dateString)"
        }
        if model.temperatureMin == 1000 {
            self.temperatureMin = "N/A"
        }else{
            let roundedTemperature = Int(model.temperatureMin)
            self.temperatureMin = "\(roundedTemperature)°C"
        }
        if model.temperatureMax == 1000 {
            self.temperatureMax = "N/A"
        }else{
            let roundedTemperature = Int(model.temperatureMax)
            self.temperatureMax = "\(roundedTemperature)°C"
        }


    }
}
