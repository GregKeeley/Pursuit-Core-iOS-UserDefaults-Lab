//
//  DetailViewController.swift
//  UserDefaultsLab_Horoscopes
//
//  Created by Gregory Keeley on 1/14/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var horoscopePicker: UIPickerView!
    @IBOutlet weak var currentSignLabel: UILabel!
    
    var horoscope: Horoscope?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentSignLabel.text = horoscope?.horoscope
    }

}
