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
        networker.requestInWeather(url: requestString)
    }
}

