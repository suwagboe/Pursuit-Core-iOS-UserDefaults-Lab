//
//  UserSettings.swift
//  UserDefaultsLab
//
//  Created by Pursuit on 1/13/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import Foundation

enum EnumHoroscope: String {
    case aries = "aries"
    case taurus = "taurus"
    case gemini = "gemini"
    case cancer = "cancer"
    case leo = "leo"
    case virgo = "virgo"
    case libra = "libra"
    case scorpio = "scorpio"
    case sagittarius = "sagittarius"
    case capricorn = "capricorn"
    case aquarius = "aquarius"
    case pisces = "pisces"
}

enum userSettingsKey {
    static let defaultHoroscope = "horoscope"
}

class UserSettings {
    
    // singleton
    private init() {}
    
        static let shared = UserSettings()
    
    func saveHoroscope(with horoscope: EnumHoroscope) {
        
UserDefaults.standard.set(horoscope.rawValue, forKey: userSettingsKey.defaultHoroscope)
    }
    
    func whichHoroscope() ->EnumHoroscope? {
       
        guard let gethoroscope = UserDefaults.standard.object(forKey: userSettingsKey.defaultHoroscope) as? String else {
            return nil
        }
        return EnumHoroscope(rawValue: gethoroscope)
    }
    
}
