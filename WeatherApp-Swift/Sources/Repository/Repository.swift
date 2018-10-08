//
//  Repository.swift
//  WeatherApp-Swift
//
//  Created by Konstantin on 03/10/2018.
//  Copyright © 2018 kostindevelop. All rights reserved.
//
import Foundation

class Repository: NSObject {
    
    private let networkManager = NetworkManager()
    private let storeManager = StoreManager()
    
    func getWeather(city: String,_ callback: @escaping (_ weather: Weather?, _ error: Error?) -> ()){
        storeManager.getWeather(search: city) {
            // get object from store
        }
        
        networkManager.requestInWeather(search: city) { [weak self] (result, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let result = result {
                let weather = Weather(country: result.country ?? "", city: result.city ?? "", temperature: result.temperature!)
                callback(weather, nil)
                
                self?.storeManager.save(weather: weather)
            }
        }
        
    }
    
    func getCities(callback: (_ cities: [Weather]?, _ error: Error?) -> ()) {
        storeManager.getCities { (result, error) in
            // convert result to weather and return
            print("e")
            var cities: [Weather] = []
            for element in result {
                cities.append(Weather(country: element.country, city: element.city, temperature: element.temperature))
            }
//            let cities = result.map({ Weather(city: $0.first.city, temperature: $0.f.temperature) })
            callback(cities, nil)
        }
    }
    
}
