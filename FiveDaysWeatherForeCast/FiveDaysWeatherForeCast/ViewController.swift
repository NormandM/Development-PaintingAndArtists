//
//  ViewController.swift
//  Stormy
//
//  Created by Pasan Premaratne on 2/15/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var precipType: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let client = DarkSkyApiClient()
    var hourlyWeatherForecast: [ForeCastWeather] = []
    var dailyWeatherForcast: [ForeCastWeather] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Météo actuelle"
        getCurrentWeather()

     }

    func displayWeather (using viewModel: WeatherViewModel){
        currentTemperatureLabel.text = viewModel.temperature
        currentHumidityLabel.text = viewModel.humidity
        currentPrecipitationLabel.text = viewModel.precipitationProbability
        currentSummaryLabel.text = viewModel.summary
        precipType.text = viewModel.precipType
        currentWeatherIcon.image = viewModel.icon
    }
    @IBAction func getCurrentWeather() {
        
        toggleRefreshAnimation(on: true)
        
        let coordinate = Coordinate()
        client.getCurrentWeather(at: coordinate){[unowned self] currentWeather, error in
            
            if let currentWeather = currentWeather {
                let viewModel = WeatherViewModel(model: currentWeather)
                self.displayWeather(using: viewModel)
                self.toggleRefreshAnimation(on: false)

            }
        }
       client.getHourlyForecast(at: coordinate){[unowned self] hourlyForecastArray, error in
            if let hourlyForecastArray = hourlyForecastArray{
                self.hourlyWeatherForecast = hourlyForecastArray
            }
        }
        client.getDailyForecast(at: coordinate){[unowned self] dailyForecastArray, error in
            if let dailyForecastArray = dailyForecastArray{
                self.dailyWeatherForcast = dailyForecastArray
            }
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHourlyForcast"{
            let controller = segue.destination as! HourlyForcastViewController
            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
            controller.dailyWeatherForcast = dailyWeatherForcast
            controller.hourlyWeatherForecast = hourlyWeatherForecast
        }
    }
    
    func toggleRefreshAnimation(on: Bool){
        refreshButton.isHidden = on
        if on {
            activityIndicator.startAnimating()
        }else{
            activityIndicator.stopAnimating()
        }
    }
    @IBAction func hourlyButton(_ sender: Any) {
        performSegue(withIdentifier: "showHourlyForcast", sender: AnyObject.self)
        
    }
}
















