//
//  WeatherRealm.swift
//  WeatherApp-Swift
//
//  Created by Konstantin on 03/10/2018.
//  Copyright © 2018 kostindevelop. All rights reserved.
//

import RealmSwift

class WeatherRealm: Object {
    @objc var country = ""
    @objc var city = ""
    @objc var temperature = 0
}
