//
//  WeatherMappable.swift
//  WeatherApp-Swift
//
//  Created by Konstantin on 02/10/2018.
//  Copyright © 2018 kostindevelop. All rights reserved.
//

import ObjectMapper

class WeatherMappable: Mappable {
    var city: String?
    var temperature: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        city            <- map["location.name"]
        temperature     <- map["temp_c"]
    }
}
