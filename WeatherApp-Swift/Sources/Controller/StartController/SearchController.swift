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
    var repository = Repository()
    var storeWeather = [Weather]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        loadWeather()
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadWeather()
        tableView.reloadData()
    }
}

extension SearchController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        repository.getCities(city: searchBar.text!) { [weak self] (weather, error) in
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
    
    func loadWeather() {
        repository.getWeather { (weather, error) in
            print(weather as Any)
            guard let weather = weather else { return }
            storeWeather = weather
        }
    }
    
}

extension SearchController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let weather = storeWeather[indexPath.row]
        cell.textLabel?.text = weather.city
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.indexPathForSelectedRow
        presentDetailController(weather: storeWeather[(selectedCell?.row)!])
    }
    
}



