//
//  HoroscopeModel.swift
//  UserDefaultsLab_Horoscopes
//
//  Created by Gregory Keeley on 1/14/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import Foundation

// MARK: - Horoscope
struct Horoscope: Codable {
    let sunsign: String
    let credit: String
    let date: String
    let horoscope: String
    let meta: Meta
}

// MARK: - Meta
struct Meta: Codable {
    let mood, keywords, intensity: String
}
