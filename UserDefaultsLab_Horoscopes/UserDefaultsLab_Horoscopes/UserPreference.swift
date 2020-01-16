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
enum HoroscopeNum: Int {
     case aries = 0
     case taurus = 1
     case gemini = 2
     case cancer = 3
     case leo = 4
     case virgo = 5
     case libra = 6
     case scorpio = 7
     case sagittarius = 8
     case capricorn = 9
     case aquarius = 10
     case pisces = 11
}

struct UserPreferenceKey {
    static let horoscope = "Horoscope"
    static let horoscopeNum = "HoroscopeNum"
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
    func updateHoroscopeNum(with horoscopeNum: HoroscopeNum) {
        standard.set(horoscopeNum.rawValue, forKey: UserPreferenceKey.horoscopeNum)
    }
    func getHoroscopeNum() -> HoroscopeNum? {
        guard let horoscopeNum = standard.object(forKey: UserPreferenceKey.horoscopeNum) as? Int else {
            return nil
        }
        return HoroscopeNum(rawValue: horoscopeNum)
    }
}
