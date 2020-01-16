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
    var selectedHoroscopeInt = 5
    var selectedHoroscopeStr = UserHoroscope.aries {
        didSet {
            horoscopeNameLabel.text = selectedHoroscopeStr.rawValue
            UserPreference.shared.updateHoroscope(with: selectedHoroscopeStr)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectHoroscope()
        loadHoroscope()
        horoscopeNameLabel.text = selectedHoroscopeStr.rawValue
        horoscopeMessageText.text = horoscope?.horoscope
    }
    func selectHoroscope() {
        switch selectedHoroscopeInt {
               case 0:
                selectedHoroscopeStr = UserHoroscope.aries
               case 1:
                selectedHoroscopeStr = UserHoroscope.taurus
               case 2:
                selectedHoroscopeStr = UserHoroscope.gemini
               case 3:
                selectedHoroscopeStr = UserHoroscope.cancer
               case 4:
                selectedHoroscopeStr = UserHoroscope.leo
               case 5:
                selectedHoroscopeStr = UserHoroscope.virgo
               case 6:
                selectedHoroscopeStr = UserHoroscope.libra
               case 7:
                selectedHoroscopeStr = UserHoroscope.scorpio
               case 8:
                selectedHoroscopeStr = UserHoroscope.sagittarius
               case 9:
                selectedHoroscopeStr = UserHoroscope.capricorn
               case 10:
                selectedHoroscopeStr = UserHoroscope.aquarius
               case 11:
                selectedHoroscopeStr = UserHoroscope.pisces
               default:
                selectedHoroscopeStr = UserHoroscope.capricorn
               }
    }
    func loadHoroscope() {
        HoroscopeAPI.getHoroscopes(for: selectedHoroscopeStr.rawValue.lowercased()) { [weak self] result in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let horoscope):
                self?.horoscope = horoscope
             
            }
        }
    }
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard let setHoroscopeVC = segue.source as? SetHoroscopeViewController else {
        fatalError("Failed to unwind properly")
    }
        selectedHoroscopeInt = setHoroscopeVC.selectedHoroscope ?? 2
       selectHoroscope()
    }
    
}

