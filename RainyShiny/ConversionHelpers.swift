//
//  ConversionHelpers.swift
//  RainyShiny
//
//  Created by Kacy James on 11/18/16.
//  Copyright © 2016 Student Driver. All rights reserved.
//

import UIKit

class ConversionHelpers {
    static func KelvinToFahrenheit (temperature: Double) -> Double {
        let kelvinToFahrenheitPredivision = (temperature * (9/5) - 459.67)
        let kelvinToFahrenheit = Double(round(10 * kelvinToFahrenheitPredivision/10))
        
        return kelvinToFahrenheit
    }
}
