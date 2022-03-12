//
//  NSConstantMethods.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 13/03/22.
//


import UIKit
class NSConstantMethods {
    let helper = UserDefaults.standard
    static let instance = NSConstantMethods()
  
    func putBool(key: String, value: Bool) {
        helper.set(value, forKey: key)
        helper.synchronize()
    }
    func getBool(key: String, withDefaultValue: Bool) -> Bool {
        if helper.object(forKey: key) != nil {
            return helper.bool(forKey: key)
        }
        return withDefaultValue
    }
    func clearAllUserDefaults() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
}
extension NSConstantMethods {
    var currentTempUnitIsCelsuis: Bool {
        get {
            getBool(key: #function, withDefaultValue: true)
        }
        set(value) {
            putBool(key: #function, value: value)
        }
    }
}
