//
//  DarkSkyApiClient.swift
//  FiveDaysWeatherForeCast
//
//  Created by Normand Martin on 17-06-24.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import Foundation

class DarkSkyApiClient {
   fileprivate let apiKey = "31c118f28ce26d3d6c17d5296b60141c"
    lazy var baseUrl: URL = {
        return URL(string: "https://api.darksky.net/forecast/\(self.apiKey)/")!
    }()
    
    let downloader = JSONDownloader()
    
    typealias CurrentWeatherCompletionHandler = (ForeCastWeather?, DarkSkyError?)  -> Void
    typealias ForecastWeatherCompletionHandler = ([ForeCastWeather]?, DarkSkyError?) -> Void
    
    var dailyForecastArray = [ForeCastWeather]()

    func getCurrentWeather(at coordinate: Coordinate, completionHandler completion: @escaping CurrentWeatherCompletionHandler) {
        let coordinateString = coordinate.findUserLocation()
        guard let url = URL(string: coordinateString, relativeTo: baseUrl) else {
            completion(nil, .invalidUrl)
            return
        }
        let request = URLRequest(url: url)
        let task = downloader.jsonTask(with: request) {json, error in
            
            DispatchQueue.main.async {
                guard let json = json else {
                    
                    completion(nil, error)
                    return
                }
                guard let currentWeatherJson = json["currently"] as? [String: AnyObject], let currentWeather = ForeCastWeather(json: currentWeatherJson) else {
                    completion(nil, .jsonParsingFailure)
                    return
                }
                completion(currentWeather, nil)
            }
        }
        task.resume()
    }
    func getDailyForecast(at coordinate: Coordinate, completionHandler completion: @escaping ForecastWeatherCompletionHandler) {
        let coordinateString = coordinate.findUserLocation()
        guard let url = URL(string: coordinateString, relativeTo: baseUrl) else {
            completion(nil, .invalidUrl)
            return
        }
        let request = URLRequest(url: url)
        let task = downloader.jsonTask(with: request) {json, error in
            
            DispatchQueue.main.async {
                guard let json = json else {
                    completion(nil, error)
                    return
                }
                guard let dailyWeatherJson = json["daily"]?["data"] as? [[String: AnyObject]]  else {
                    completion(nil, .jsonParsingFailure)
                    return
                }
                

                for dailyArray in dailyWeatherJson {
                    guard let dailyWeatherResult = ForeCastWeather(json: dailyArray) else {
                        completion(nil, .jsonParsingFailure)
                        return
                    }
                    self.dailyForecastArray.append(dailyWeatherResult)
                }
            completion(self.dailyForecastArray, nil)
            }
        }
        task.resume()
    }
    func getHourlyForecast(at coordinate: Coordinate, completionHandler completion: @escaping ForecastWeatherCompletionHandler) {
        var hourlyForecastArray = [ForeCastWeather]()
        let coordinateString = coordinate.findUserLocation()
        guard let url = URL(string: coordinateString, relativeTo: baseUrl) else {
            completion(nil, .invalidUrl)
            return
        }
        let request = URLRequest(url: url)
        let task = downloader.jsonTask(with: request) {json, error in
            
            DispatchQueue.main.async {
                guard let json = json else {
                    completion(nil, error)
                    return
                }
                guard let hourlyWeatherJson = json["hourly"]?["data"] as? [[String: AnyObject]]  else {
                    completion(nil, .jsonParsingFailure)
                    return
                }
                for hourlyArray in hourlyWeatherJson {
                    guard let hourlyWeatherResult = ForeCastWeather(json: hourlyArray) else {
                        completion(nil, .jsonParsingFailure)
                        return
                    }
                    hourlyForecastArray.append(hourlyWeatherResult)
                }
                
                completion(hourlyForecastArray, nil)
            }
        }
        task.resume()
    }

}
