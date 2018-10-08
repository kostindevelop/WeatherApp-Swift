//
//  WeatherMappable.swift
//  WeatherApp-Swift
//
//  Created by Konstantin on 02/10/2018.
//  Copyright © 2018 kostindevelop. All rights reserved.
//

import ObjectMapper

class WeatherMappable: Mappable {
    var country: String?
    var city: String?
    var temperature: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        country         <- map["location.country"]
        city            <- map["location.name"]
        temperature     <- map["current.temp_c"]
    }
}
