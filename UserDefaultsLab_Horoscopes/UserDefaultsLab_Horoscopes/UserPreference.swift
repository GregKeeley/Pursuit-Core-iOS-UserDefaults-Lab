//
//  UserPreference.swift
//  UserDefaultsLab_Horoscopes
//
//  Created by Gregory Keeley on 1/15/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import Foundation

enum UserHoroscope: String {
    case aries = "Aries"
    case taurus = "Taurus"
    case gemini = "Gemini"
    case cancer = "Cancer"
    case leo = "Leo"
    case virgo = "Virgo"
    case libra = "Libra"
    case scorpio = "Scorpio"
    case sagittarius = "Sagittarius"
    case capricorn = "Capricorn"
    case aquarius = "Aquarius"
    case pisces = "Pisces"
}
enum horoscopeNum {

}

struct UserPreferenceKey {
    static let horoscope = "Horoscope"
}

class UserPreference {
    private init() {}
    private let standard = UserDefaults.standard
    static let shared = UserPreference()
    
    func updateHoroscope(with horoscope: UserHoroscope) {
        standard.set(horoscope.rawValue, forKey: UserPreferenceKey.horoscope)
    }
    func getHoroscope() -> UserHoroscope? {
        guard let horoscopeName = standard.object(forKey: UserPreferenceKey.horoscope) as? String else {
                return nil
        }
        return UserHoroscope(rawValue: horoscopeName)
    }
    func updateHoroscopeNum(with horoscopeNum: )
}
