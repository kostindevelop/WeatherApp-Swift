//
//  SearchController.swift
//  WeatherApp-Swift
//
//  Created by UT on 21.08.2018.
//  Copyright © 2018 kostindevelop. All rights reserved.
//

import UIKit
import Foundation

class SearchController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var networker = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
}

extension SearchController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let requestString = Config.baseUrl + searchBar.text!
        networker.requestInWeather(url: requestString) { [weak self] (weather, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let weather = weather {
                self?.presentDetailController(weather: weather)
            }
        }
    }
    
    func presentDetailController(weather: Weather) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "detailController") as? DetailsController
            else { return }
        vc.weather = weather
        present(vc, animated: true)
    }
    
}

