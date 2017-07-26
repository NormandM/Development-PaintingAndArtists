//
//  DailyForeCastController.swift
//  FiveDaysWeatherForeCast
//
//  Created by Normand Martin on 17-07-04.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit

class DailyForeCastController: UITableViewController {
    var dailyWeatherForcast: [ForeCastWeather] = []
    var arrayTime: [String] = []
    var arrayIcone: [UIImage] = []
    var hourlyForcast5Days: [[String]] = []
    var arrayDataPoint: [String] = []
    let client = DarkSkyApiClient()
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView //recast your view as a UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor(red: 151/255, green: 156/255, blue: 159/255, alpha: 1.0) //make the background color light blue
        header.textLabel!.textColor = UIColor.white //make the text white
        header.alpha = 1.0 //make the header transparent
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Prochains jours"
        for dailyForcast in dailyWeatherForcast{
            let viewModel = WeatherViewModel(model: dailyForcast)
            let summary = viewModel.summary
            let time = viewModel.time
            let humidity = viewModel.humidity
            let cloudCover = viewModel.cloudCover
            let windSpeed = viewModel.windSpeed
            let windGust = viewModel.windGust
            let icone = viewModel.icon
            let precipitationProbability = viewModel.precipitationProbability
            let uvIndex = viewModel.uvIndex
            self.arrayTime.append(time)
            let temperatureMin = viewModel.temperatureMin
            let temperatureMax = viewModel.temperatureMax
            let sunriseTime = viewModel.sunriseTime
            let sunsetTime = viewModel.sunsetTime

            
            self.arrayIcone.append (icone)
            let arrayDataPoint = ["Sommaire: \(summary)", "Temperature Min: \(temperatureMin)", "Temperature Max: \(temperatureMax)","humidité: \(humidity)", "Probabilité de précipitations: \(precipitationProbability)", "Vitesse du vent: \(windSpeed)", "Rafale de vent: \(windGust)", "Indice UV: \(uvIndex)", "couverture nuageuse: \(cloudCover)", "Levée du Soleil: \(sunriseTime)", "Couché du Solei: \(sunsetTime)",]
            self.hourlyForcast5Days.append(arrayDataPoint)
        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return arrayTime.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayTime[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return hourlyForcast5Days[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0 
        cell.imageView?.image = arrayIcone[indexPath.section]
        cell.textLabel?.text = hourlyForcast5Days[indexPath.section][indexPath.row]
        
        return cell
    }


}
