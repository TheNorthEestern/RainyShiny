//
//  Constants.swift
//  RainyShiny
//
//  Created by Kacy James on 11/15/16.
//  Copyright © 2016 Student Driver. All rights reserved.
//

import Foundation

let API_KEY = "b38776b82b4f402db470bce5d2e09449"
let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "&lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="

// let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=b38776b82b4f402db470bce5d2e09449"

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&mode=json&appid=b38776b82b4f402db470bce5d2e09449"
