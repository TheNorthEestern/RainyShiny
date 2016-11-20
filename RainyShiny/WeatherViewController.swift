//
//  ViewController.swift
//  RainyShiny
//
//  Created by Kacy James on 11/14/16.
//  Copyright © 2016 Student Driver. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
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
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
                }
            }
        }
        completed()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherViewCell", for: indexPath) as? WeatherViewCell {
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        } else {
            return WeatherViewCell()
        }
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

