//
//  Forecast.swift
//  RainyShiny
//
//  Created by Kacy James on 11/18/16.
//  Copyright © 2016 Student Driver. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    private var _date : String!
    private var _weatherType : String!
    private var _highTemp: String!
    private var _lowTemp: String!
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            if let min = temp["min"] as? Double {
                _lowTemp = "\(ConversionHelpers.KelvinToFahrenheit(temperature: min))"
            }
            
            if let max = temp["max"] as? Double {
                _highTemp = "\(ConversionHelpers.KelvinToFahrenheit(temperature: max))"
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                _weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Int {
            let unixConvertedDate = Date(timeIntervalSince1970: TimeInterval(date))
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
        
        print ("\(_date) \(_weatherType) \(_highTemp) \(_lowTemp)")
        // date = weatherDict["date"]
        
        // weatherType = weatherObject[
    }
    
    var date : String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
}
