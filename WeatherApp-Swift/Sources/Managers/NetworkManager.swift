//
//  NetworkManager.swift
//  WeatherApp-Swift
//
//  Created by UT on 22.08.2018.
//  Copyright © 2018 kostindevelop. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class NetworkManager {
    
    func requestInWeather(search: String, callback: @escaping (_ weather: WeatherMappable?, _ error: Error?) -> ()) {
        let urlRequest = URL(string: Config.baseUrl +  search)
        var request = URLRequest(url: urlRequest!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            print(data)
            guard
                let json = data.json,
                let weather = Mapper<WeatherMappable>().map(JSONObject: json)
                else {
                    callback(nil, error)
                    return
                        print("DATA RETURN NIL")
            }
            DispatchQueue.main.async {
                callback(weather, nil)
            }
            print(weather)
        }
        task.resume()
    }
}


