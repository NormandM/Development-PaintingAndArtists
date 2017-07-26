//
//  HourlyForcastViewController.swift
//  FiveDaysWeatherForeCast
//
//  Created by Normand Martin on 17-07-02.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit

class HourlyForcastViewController: UITableViewController {
    var hourlyWeatherForecast: [ForeCastWeather] = []
    var dailyWeatherForcast: [ForeCastWeather] = []
    var arrayTime: [String] = []
    var arrayIcone: [UIImage] = []
    var hourlyForcast2Days: [[String]] = []
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
        self.title = "Prochaines heures"
            
            for hourlyForcast in hourlyWeatherForecast{
                let viewModel = WeatherViewModel(model: hourlyForcast)
                let summary = viewModel.summary
                let temperature = viewModel.temperature
                let time = viewModel.time
                let humidity = viewModel.humidity
                let cloudCover = viewModel.cloudCover
                let windSpeed = viewModel.windSpeed
                let windGust = viewModel.windGust
                let icone = viewModel.icon
                let precipitationProbability = viewModel.precipitationProbability
                let uvIndex = viewModel.uvIndex
                let precipType = viewModel.precipType
                self.arrayTime.append(time)
                    
                self.arrayIcone.append (icone)
                let arrayDataPoint = ["Sommaire: \(summary)", "température: \(temperature)", "humidité: \(humidity)", "Probabilité de précipitations: \(precipitationProbability)", "Précipitation sous forme de: \(precipType)", "Vitesse du vent: \(windSpeed)", "Rafale de vent: \(windGust)", "Indice UV: \(uvIndex)", "couverture nuageuse: \(cloudCover)"]
                    self.hourlyForcast2Days.append(arrayDataPoint)
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
        return hourlyForcast2Days[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.imageView?.image = arrayIcone[indexPath.section]
        cell.textLabel?.text = hourlyForcast2Days[indexPath.section][indexPath.row]

        return cell
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDailyForeCast"{
            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed

            let controller = segue.destination as! DailyForeCastController
            controller.dailyWeatherForcast = dailyWeatherForcast
        }
    }
  
    @IBAction func showDaily(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "showDailyForeCast", sender: self)
    }


}
