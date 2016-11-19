//
//  Extensions.swift
//  RainyShiny
//
//  Created by Kacy James on 11/18/16.
//  Copyright © 2016 Student Driver. All rights reserved.
//

import Foundation

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
