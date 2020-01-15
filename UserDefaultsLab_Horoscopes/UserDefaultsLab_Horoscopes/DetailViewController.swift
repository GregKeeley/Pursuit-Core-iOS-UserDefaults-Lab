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
    @IBOutlet weak var setHoroscopeButton: UIButton!
    
    
    var horoscope: Horoscope?
    var selectedHoroscope: Int?
    
    let horoscopeSelection = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
    override func viewDidLoad() {
        super.viewDidLoad()
        currentSignLabel.text = horoscope?.horoscope
        horoscopePicker.delegate = self
        horoscopePicker.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let aComponent = horoscopePicker?.selectedRow(inComponent: 0) {
          selectedHoroscope = aComponent
        }
        
    }
}

extension DetailViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return horoscopeSelection[row]
    }
}

extension DetailViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return horoscopeSelection.count
    }
    
    
}
