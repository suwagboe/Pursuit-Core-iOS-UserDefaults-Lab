//
//  UserSettings.swift
//  UserDefaultsLab
//
//  Created by Pursuit on 1/13/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import Foundation

enum Horoscope: String {
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

enum userSettingsKey {
    static let defaultHoroscope = "horoscope"
}

class UserSettings {
    
    // singleton
    private init() {}
    
        static let shared = UserSettings()
    
    func updateHoroscope(with horoscope: Horoscope) {
        
        UserDefaults.standard.set(horoscope.rawValue, forKey: userSettingsKey.defaultHoroscope)
        
    }
    
    func whichHoroscope() ->Horoscope? {
       
        guard let gethoroscope = UserDefaults.standard.object(forKey: userSettingsKey.defaultHoroscope) as? String else {
            return nil
        }
        return Horoscope(rawValue: gethoroscope
        )
        
    }
    
}
