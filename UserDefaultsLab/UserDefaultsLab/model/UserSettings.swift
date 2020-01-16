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
    static let saveTheName = "enteredName"
}

class UserSettings {
    
    // singleton
    private init() {}
    
        static let shared = UserSettings()
    
    func saveHoroscope(with horoscope: EnumHoroscope) {
        
UserDefaults.standard.set(horoscope.rawValue, forKey: userSettingsKey.defaultHoroscope)
    }
     
    // I dont need an enum because I made the variable in the function that should be blank 
    func saveTheName(with name: String){
        UserDefaults.standard.set(name, forKey: userSettingsKey.saveTheName)
    }
    
    func retrieveSelectedHoroscope() ->EnumHoroscope? {
       
        guard let gethoroscope = UserDefaults.standard.object(forKey: userSettingsKey.defaultHoroscope) as? String else {
            return nil
        }
        return EnumHoroscope(rawValue: gethoroscope)
    }
    
    func retrieveSavedName() -> String? {
        
        guard let getName = UserDefaults.standard.object(forKey: userSettingsKey.saveTheName) as? String else {
            return nil
        }
        return getName
    }
    
}
