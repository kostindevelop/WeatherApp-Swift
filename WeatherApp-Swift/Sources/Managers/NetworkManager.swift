//
//  NetworkManager.swift
//  WeatherApp-Swift
//
//  Created by UT on 22.08.2018.
//  Copyright © 2018 kostindevelop. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    func requestInWeather(url: String) {
        let urlRequest = URL(string: url)
        var request = URLRequest(url: urlRequest!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if error != nil {
                print(error!.localizedDescription)
                DispatchQueue.main.async {
                    print("DispatchQueue.main.async")
                }
            }
            
            guard let data = data else { return }
            print(data)
            guard
                let json = data.json,
                let dict = json as? [String: Any]
                else {
                    return
                        print("DATA RETURN NIL")
            }
            print(dict)
        }
        task.resume()
    }
}


