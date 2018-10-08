//
//  DetailsController.swift
//  WeatherApp-Swift
//
//  Created by UT on 22.08.2018.
//  Copyright © 2018 kostindevelop. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {
    
    @IBOutlet weak var labelCountry: UILabel!
    @IBOutlet weak var labelCity: UILabel!
    @IBOutlet weak var labelTemp: UILabel!
    
    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DetailsController")
        labelCountry.text = weather?.country
        labelCity.text = weather?.city
        labelTemp.text = String(weather!.temperature)
        
    }
    
    @IBAction func dismisDetaileController(_ sender: UIButton) {
        dismiss(animated: true, completion: nil )
    }
    
}


