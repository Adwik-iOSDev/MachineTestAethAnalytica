//
//  AlertViewController.swift
//  GIT HUB Search
//
//  Created by Adwaith V V on 27/05/23.
//

import UIKit

class AlertViewController: UIViewController {

    //MARK: - Variables
    
    var alertTitle: String?
    var alertMessage: String?
    
    @IBOutlet weak var lblAlertTitle: UILabel!
    @IBOutlet weak var lblAlertMessage: UILabel!
    @IBOutlet weak var imageBackGroundView: UIView!
    @IBOutlet weak var alertMainView: UIView!
    @IBOutlet weak var alertImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialiseViewController()

        
    }
    
    private func initialiseViewController() {
        self.lblAlertTitle.text = alertTitle
        self.lblAlertMessage.text = alertMessage
        self.imageBackGroundView.layer.cornerRadius = 59.5
        self.alertImageView.layer.cornerRadius = 57.5
        self.alertMainView.layer.cornerRadius = 20
    }
    

    //MARK: - Action Methods
    
    @IBAction func didBackGroundViewTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true)
        
    }
    
    @IBAction func didOkButtonTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true)
        
    }

}
