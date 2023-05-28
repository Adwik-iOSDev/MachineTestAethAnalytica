//
//  ViewController.swift
//  GIT HUB Search
//
//  Created by Adwaith V V on 27/05/23.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - OUTLETS
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var buttonLoginView: UIView!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassWord: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialiseViewController()
    }

    //MARK: - Initialisng View Controller
    
    private func initialiseViewController() {
        
        self.mainView.layer.cornerRadius = 50
        self.buttonLoginView.layer.cornerRadius = 25
        
        let userNamePlaceHolderText = "Username"
        let passWordPlaceHolderText = "Password"
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.purple
        ]
        let attributedPlaceholderUserName = NSAttributedString(string: userNamePlaceHolderText, attributes: attributes)
        let attributedPlaceholderPassWord = NSAttributedString(string: passWordPlaceHolderText, attributes: attributes)
        
        
        self.txtUserName.attributedPlaceholder = attributedPlaceholderUserName
        self.txtPassWord.attributedPlaceholder = attributedPlaceholderPassWord
        self.txtPassWord.isSecureTextEntry = true
        
    }
    
    func validateFields() {
        
        guard self.txtUserName.text != "" else {
            Common.shared.alert(alertTitleParameter: "Alert !", alertMessageParameter: "Username Required !")
            return
        }
        
        guard Common.shared.isValidEmail(self.txtUserName.text!)  else {
            Common.shared.alert(alertTitleParameter: "Alert !", alertMessageParameter: "Enter Valid Email : eg: ab@a.com")
            return
        }
        
        guard self.txtPassWord.text != "" else {
            Common.shared.alert(alertTitleParameter: "Alert !", alertMessageParameter: "Password Required !")
            return
        }
        
        guard self.txtUserName.text == DefaultsSecureBank.shared.usernameSaved else {
            Common.shared.alert(alertTitleParameter: "Alert", alertMessageParameter: "Username Is Invalid")
            return
        }
        
        guard self.txtPassWord.text == DefaultsSecureBank.shared.passwordSaved else {
            Common.shared.alert(alertTitleParameter: "Alert", alertMessageParameter: "Password Is Invalid")
            return
        }
        
        let storyBoard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
        let nextVc = storyBoard.instantiateViewController(withIdentifier: "HomeViewController")as! HomeViewController
        self.navigationController?.pushViewController(nextVc, animated: true)
        
    }
    
    //MARK: - BUTTON ACTION METHODS
    
    @IBAction func didLoginButtonTapped(_ sender: UIButton) {
        
        self.validateFields()
        
    }
    
    @IBAction func didSignUpButtonTapped(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "SignUpStoryboard", bundle: nil)
        let nextVc = storyBoard.instantiateViewController(withIdentifier: "SignUpViewController")as! SignUpViewController
        self.navigationController?.pushViewController(nextVc, animated: true)
        
        
    }

}



