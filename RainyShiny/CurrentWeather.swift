//
//  CurrentWeather.swift
//  RainyShiny
//
//  Created by Kacy James on 11/16/16.
//  Copyright © 2016 Student Driver. All rights reserved.
//

// import Foundation
import UIKit
import Alamofire

class CurrentWeather {
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String {
        get {
            if _cityName == nil {
                _cityName = ""
            }
            return _cityName
        }
        set {
            _cityName = newValue
        }
    }
    
    var date: String {
        get {
            if _date == nil {
                _date = ""
            }
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.long
            dateFormatter.timeStyle = DateFormatter.Style.none
            let currentDate = dateFormatter.string(from: Date())
            self._date = "Today \(currentDate)"
            return _date
        }
    }
    
    var weatherType : String {
        get {
            if _weatherType == nil {
                _weatherType = ""
            }
            return _weatherType
        }
        set {
            _weatherType = newValue
        }
    }
    
    var currentTemp: Double {
        get {
            if _currentTemp == nil {
                _currentTemp = 0.0
            }
            return _currentTemp
        }
        set {
            _currentTemp = newValue
        }
    }
}
