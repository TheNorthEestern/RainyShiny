//
//  Location.swift
//  RainyShiny
//
//  Created by Kacy James on 11/20/16.
//  Copyright © 2016 Student Driver. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {
        
    }
    
    var latitude : Double!
    var longitude : Double!
}
