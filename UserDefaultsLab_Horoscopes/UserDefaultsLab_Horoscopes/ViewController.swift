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
    @IBOutlet weak var horoscopeNameLabel: UILabel!
    @IBOutlet weak var horoscopeMessageText: UITextView!
    
    var horoscope: Horoscope?
    var selectedHoroscopeInt = Int()
    var selectedHoroscopeStr = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadHoroscope()
        horoscopeNameLabel.text = horoscope?.sunsign
        horoscopeMessageText.text = horoscope?.horoscope
    }
    func loadHoroscope() {
        switch selectedHoroscopeInt {
        case 0:
            selectedHoroscopeStr = "Aries"
        case 1:
            selectedHoroscopeStr = "Taurus"
        case 2:
            selectedHoroscopeStr = "Gemini"
        case 3:
            selectedHoroscopeStr = "Cancer"
        case 4:
            selectedHoroscopeStr = "Leo"
        case 5:
            selectedHoroscopeStr = "Virgo"
        case 6:
            selectedHoroscopeStr = "Libra"
        case 7:
            selectedHoroscopeStr = "Scorpio"
        case 8:
            selectedHoroscopeStr = "Sagittarius"
        case 9:
            selectedHoroscopeStr = "Capricorn"
        case 10:
            selectedHoroscopeStr = "Aquarius"
        case 11:
            selectedHoroscopeStr = "Pisces"
        default:
            selectedHoroscopeStr = "Capricorn"
        }
        HoroscopeAPI.getHoroscopes(for: selectedHoroscopeStr.lowercased()) { [weak self] result in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let horoscope):
                self?.horoscope = horoscope
            }
        }
    }
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard let setHoroscopeVC = segue.source as? DetailViewController else {
        fatalError("Failed to unwind properly")
    }
        selectedHoroscopeInt = setHoroscopeVC.selectedHoroscope ?? 2
    }
    
}

