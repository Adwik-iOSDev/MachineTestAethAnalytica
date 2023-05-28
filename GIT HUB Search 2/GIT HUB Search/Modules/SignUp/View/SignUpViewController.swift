//
//  SignUpViewController.swift
//  GIT HUB Search
//
//  Created by Adwaith V V on 27/05/23.
//

import UIKit

class SignUpViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var buttonLoginView: UIView!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassWord: UITextField!
    @IBOutlet weak var txtConfirmPassWord: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialiseViewController()
    }
    
    //MARK: - Initialise View Controller
    

    private func initialiseViewController() {
        
        self.mainView.layer.cornerRadius = 50
        self.buttonLoginView.layer.cornerRadius = 25
        
        let userNamePlaceHolderText = "Enter A Username"
        let passWordPlaceHolderText = "Enter A Password"
        let confirmPassWordPlaceHolderText = "Confirm Your Password"
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.purple
        ]
        let attributedPlaceholderUserName = NSAttributedString(string: userNamePlaceHolderText, attributes: attributes)
        let attributedPlaceholderPassWord = NSAttributedString(string: passWordPlaceHolderText, attributes: attributes)
        let attributedPlaceholderConfirmPassWord = NSAttributedString(string: confirmPassWordPlaceHolderText, attributes: attributes)
        
        
        self.txtUserName.attributedPlaceholder = attributedPlaceholderUserName
        self.txtPassWord.attributedPlaceholder = attributedPlaceholderPassWord
        self.txtConfirmPassWord.attributedPlaceholder = attributedPlaceholderConfirmPassWord
        
        
    }
    
    
    
    
    func validateFields() {
        
        guard self.txtUserName.text != "" else {
            Common.shared.alert(alertTitleParameter: "Alert !", alertMessageParameter: "Username Required")
            return
        }
        
        guard Common.shared.isValidEmail(self.txtUserName.text!)  else {
            Common.shared.alert(alertTitleParameter: "Alert !", alertMessageParameter: "Enter Valid Email : eg: ab@a.com")
            return
        }
        
        guard self.txtPassWord.text != "" else {
            Common.shared.alert(alertTitleParameter: "Alert !", alertMessageParameter: "Password Required")
            return
        }
        
        guard self.txtConfirmPassWord.text != "" else {
            Common.shared.alert(alertTitleParameter: "Alert !", alertMessageParameter: "Confirm Passwod Required")
            return
        }
        
        guard self.txtPassWord.text!.count >= 4 else {
            Common.shared.alert(alertTitleParameter: "Alert", alertMessageParameter: "Atleast 4 Characters")
            return
        }
        
        guard self.txtConfirmPassWord.text == self.txtPassWord.text else {
            Common.shared.alert(alertTitleParameter: "Alert !", alertMessageParameter: "Confirm Passwod And Password Must Be The Same")
            return
        }
        
        
        
        DefaultsSecureBank.shared.usernameSaved = self.txtUserName.text ?? ""
        DefaultsSecureBank.shared.passwordSaved = self.txtPassWord.text ?? ""
        
        
        print(DefaultsSecureBank.shared.usernameSaved)
        print(DefaultsSecureBank.shared.passwordSaved)
        
        let storyBoard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
        let nextVc = storyBoard.instantiateViewController(withIdentifier: "HomeViewController")as! HomeViewController
        self.navigationController?.pushViewController(nextVc, animated: true)
        
    }
    
    //MARK: - Action Methods
    
    @IBAction func didSignUpButtonTapped(_ sender: UIButton) {
        
        self.validateFields()
        
        
    }
    
    @IBAction func alreadyHaveAccountButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }

}
