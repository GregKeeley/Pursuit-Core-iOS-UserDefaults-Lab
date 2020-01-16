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
    var selectedHoroscopeInt = HoroscopeNum.aries {
        didSet {
            UserPreference.shared.updateHoroscopeNum(with: selectedHoroscopeInt)
            print(selectedHoroscopeInt.rawValue)
        }
    }
    var selectedHoroscopeStr = UserHoroscope.aries {
        didSet {
            horoscopeNameLabel.text = selectedHoroscopeStr.rawValue
            UserPreference.shared.updateHoroscope(with: selectedHoroscopeStr)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        selectHoroscope()
        loadHoroscope()
        horoscopeNameLabel.text = selectedHoroscopeStr.rawValue
        horoscopeMessageText.text = horoscope?.horoscope
        print(selectedHoroscopeInt.rawValue)

    }
    func updateUI() {
        if let horoscopeInt = UserPreference.shared.getHoroscopeNum() {
            selectedHoroscopeInt = horoscopeInt
        }
        if let horoscopeStr = UserPreference.shared.getHoroscope() {
            selectedHoroscopeStr = horoscopeStr
        }
    }
    func selectHoroscope() {
        switch selectedHoroscopeInt {
        case HoroscopeNum.aries:
            
                selectedHoroscopeStr = UserHoroscope.aries
        case HoroscopeNum.taurus:
            
                selectedHoroscopeStr = UserHoroscope.taurus
        case HoroscopeNum.gemini:
            
                selectedHoroscopeStr = UserHoroscope.gemini
        case HoroscopeNum.cancer:
            
                selectedHoroscopeStr = UserHoroscope.cancer
        case HoroscopeNum.leo:
            
                selectedHoroscopeStr = UserHoroscope.leo
        case HoroscopeNum.virgo:
           
                selectedHoroscopeStr = UserHoroscope.virgo
        case HoroscopeNum.libra:
            
                selectedHoroscopeStr = UserHoroscope.libra
        case HoroscopeNum.scorpio:
            
                selectedHoroscopeStr = UserHoroscope.scorpio
        case HoroscopeNum.sagittarius:
            
                selectedHoroscopeStr = UserHoroscope.sagittarius
        case HoroscopeNum.capricorn:
            
                selectedHoroscopeStr = UserHoroscope.capricorn
        case HoroscopeNum.aquarius:
            
                selectedHoroscopeStr = UserHoroscope.aquarius
        case HoroscopeNum.pisces:
            
                selectedHoroscopeStr = UserHoroscope.pisces
        default:
            selectedHoroscopeStr = UserHoroscope.capricorn
        }
        
    }
    func loadHoroscope() {
        print("")
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
        selectedHoroscopeInt = setHoroscopeVC.selectedHoroscope ?? HoroscopeNum.aries
       selectHoroscope()
    }
    
}

