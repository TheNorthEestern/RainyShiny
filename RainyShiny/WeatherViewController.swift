//
//  ViewController.swift
//  RainyShiny
//
//  Created by Kacy James on 11/14/16.
//  Copyright © 2016 Student Driver. All rights reserved.
//

import UIKit
import Alamofire

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self.forecasts as? UITableViewDataSource
        tableView.delegate = self
        
        currentWeather = CurrentWeather()
        // forecast = Forecast()
        
        
        currentWeather.downloadWeatherDetails {
            self.downloadForecastData {
                self.updateMainUI()
            }
        }
        
        print(CURRENT_WEATHER_URL)
    }
    
    func downloadForecastData(completed: DownloadComplete) {
        // Will download forecast weather data for table view
        Alamofire.request(FORECAST_URL).responseJSON {
            response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    for item in list {
                        let forecast = Forecast(weatherDict: item)
                        self.forecasts.append(forecast)
                    }
                }
            }
        }
        completed()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherViewCell", for: indexPath)
        return cell
    }
    
    func updateMainUI() {
        dateLabel.text = currentWeather.date
        temperatureLabel.text = "\(currentWeather.currentTemp)"
        currentWeatherLabel.text = currentWeather.weatherType
        print ("KACY \(currentWeather.cityName)")
        locationLabel.text = currentWeather.cityName
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }
    
}

