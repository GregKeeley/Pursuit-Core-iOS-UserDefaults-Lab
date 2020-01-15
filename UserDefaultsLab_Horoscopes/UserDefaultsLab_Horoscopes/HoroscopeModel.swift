//
//  HoroscopeModel.swift
//  UserDefaultsLab_Horoscopes
//
//  Created by Gregory Keeley on 1/14/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import Foundation

struct Horoscope: Decodable {
    let sunsign: String
    let date: String
    let horoscope: String
    let mood: String
    let keywords: String
    let intensity: String
}
