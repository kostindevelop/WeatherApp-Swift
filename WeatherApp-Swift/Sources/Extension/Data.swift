//
//  Data.swift
//  WeatherApp-Swift
//
//  Created by UT on 22.08.2018.
//  Copyright © 2018 kostindevelop. All rights reserved.
//

import Foundation

extension Data {
    var json: Any? {
        return try? JSONSerialization.jsonObject(with: self, options: [])
    }
    
    
    
}

