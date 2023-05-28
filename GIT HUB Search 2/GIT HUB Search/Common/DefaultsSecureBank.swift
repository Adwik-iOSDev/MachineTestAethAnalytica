//
//  DefaultsSecureBank.swift
//  GIT HUB Search
//
//  Created by Adwaith V V on 27/05/23.
//

import Foundation


class DefaultsConstants {
    
    static let userName = "userName"
    static let passWord = "passWord"
    
    
}

class DefaultsSecureBank {
    
    let defaults = UserDefaults.standard
    
    static let shared = DefaultsSecureBank()
    
    var usernameSaved: String {
        
        set{
            defaults.set(newValue, forKey: DefaultsConstants.userName)
        }
        get{
            return defaults.string(forKey: DefaultsConstants.userName) ?? ""
        }
        
    }
    
    var passwordSaved: String {
        
        set{
            defaults.set(newValue, forKey: DefaultsConstants.passWord)
        }
        get{
            return defaults.string(forKey: DefaultsConstants.passWord) ?? ""
        }
        
    }
    
}
