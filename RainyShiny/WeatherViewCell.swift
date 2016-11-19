//
//  WeatherViewCell.swift
//  RainyShiny
//
//  Created by Kacy James on 11/18/16.
//  Copyright © 2016 Student Driver. All rights reserved.
//

import UIKit

class WeatherViewCell: UITableViewCell {

    @IBOutlet weak var weekdayLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var weatherTypeImageView: UIImageView!
    
    func configureCell(forecast: Forecast) {
        lowTempLabel.text = forecast.lowTemp
        highTempLabel.text = forecast.highTemp
        weatherTypeLabel.text = forecast.weatherType
        weekdayLabel.text = forecast.date
        weatherTypeImageView.image = UIImage(named: forecast.weatherType)
    }
    
}
