//
//  ViewController.swift
//  UserDefaultsLab_Horoscopes
//
//  Created by Gregory Keeley on 1/14/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var changeHoroscope: UIBarButtonItem!
    
    var horoscope: Horoscope?
    var selectedHoroscope = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    func loadHoroscope() {
        HoroscopeAPI.getHoroscopes(for: selectedHoroscope) { [weak self] result in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let horoscope):
                self?.horoscope = horoscope
            }
        }
    }
    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
    }
    
}

