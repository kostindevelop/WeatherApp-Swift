//
//  StoreManager.swift
//  WeatherApp-Swift
//
//  Created by Konstantin on 03/10/2018.
//  Copyright © 2018 kostindevelop. All rights reserved.
//

import RealmSwift

class StoreManager: NSObject {
    
    func getCities(search: String, callback: () -> ()){
        
    }
    
    func save(weather: Weather){
        // save weather to store
        let weatherRealm = WeatherRealm()
        weatherRealm.country = weather.country
        weatherRealm.city = weather.city
        weatherRealm.temperature = weather.temperature
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(weatherRealm)
        }
    }
    
    func getWeather(callback: (_ weather: [WeatherRealm], _ error: Error?) -> ()){
        // load from store and return
        let realm = try! Realm()
        let cities = Array(realm.objects(WeatherRealm.self))
        callback(cities, nil)
    }
    
}
