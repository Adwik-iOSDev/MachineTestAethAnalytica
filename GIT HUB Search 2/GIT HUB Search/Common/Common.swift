//
//  Common.swift
//  GIT HUB Search
//
//  Created by Adwaith V V on 27/05/23.
//

import Foundation
import UIKit

class Common {
    
    static let shared = Common()
    
    
    var baseUrl = "https://api.github.com/"
    
    private init() { }
    
    func alert(alertTitleParameter: String, alertMessageParameter: String) {
        
        let storyBoard = UIStoryboard(name: "AlertStoryboard", bundle: nil)
        let nextVc = storyBoard.instantiateViewController(withIdentifier: "AlertViewController")as! AlertViewController
        nextVc.modalTransitionStyle = .crossDissolve
        nextVc.modalPresentationStyle = .overFullScreen
        nextVc.alertTitle = alertTitleParameter
        nextVc.alertMessage = alertMessageParameter
        
        if #available(iOS 13.0, *) {
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .filter({$0.isKeyWindow}).first
            
            keyWindow?.rootViewController?.present(nextVc, animated: true)
        }else{
            UIApplication.shared.keyWindow?.rootViewController?.present(nextVc, animated: true)
            
        }

        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
}
