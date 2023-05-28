//
//  HomeViewController.swift
//  GIT HUB Search
//
//  Created by Adwaith V V on 27/05/23.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    @IBOutlet weak var lblDataShow: UILabel!
    @IBOutlet weak var userListTableView: UITableView!
    @IBOutlet weak var txtUserName: UITextField!
    
    
    var itemModelArray: ItemsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialiseViewController()
    }
    
    @IBAction func didChangeUserName(_ sender: UITextField) {
        
        if sender.text!.count > 2 {
            didSearchUser(by: sender.text ?? "")
        }
        
    }
    
//    didSearchUser(by: "")
//    txtUserName.text = ""
    
    private func initialiseViewController() {
        txtUserName.delegate = self
        self.userListTableView.register(UINib(nibName: "UserListTableViewCell", bundle: nil), forCellReuseIdentifier: "UserListTableViewCell")
    }
    
    @IBAction func didLogOutButtonTapped(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let nextVc = storyBoard.instantiateViewController(withIdentifier: "ViewController")as! ViewController
        self.navigationController?.pushViewController(nextVc, animated: false)
    }
    
    private func didSearchUser(by name: String) {
        itemModelArray = nil
        let url = Common.shared.baseUrl + APIMethods.searchUsers.rawValue
        let params = [
            "q": name
        ]
        APIManager.shared.commonNetworkCall(url, params: params, method: .get) { [self] isSuccess, responseData, message in
            if isSuccess == true {
                if let data = responseData {
                    do {
                        let convertedJson = try JSONDecoder().decode(ItemsModel.self, from: data)
                        itemModelArray = convertedJson
                        if itemModelArray?.items != nil {
                            //hide nodata label
                            print("Data present")
                            self.lblDataShow.isHidden = true
//                            self.userListTableView.reloadData()
                        } else {
                            // show no data label
                            print("No data")
                            self.lblDataShow.isHidden = false
//                            self.userListTableView.reloadData()
                        }
                        userListTableView.delegate = self
                        userListTableView.dataSource = self
                        userListTableView.reloadData()
                    } catch let err {
                        print(err)
                    }
                }
            } else {
                print(message)
            }
        }
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let itemModelArray = itemModelArray {
            if let items = itemModelArray.items {
                return items.count
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath)as! UserListTableViewCell
        let singleUser = itemModelArray?.items![indexPath.row]
//        cell.textLabel!.text = singleUser?.login
        cell.lblName!.text = singleUser?.login
        cell.profileImage.kf.setImage(with: URL(string: singleUser?.avatarURL ?? ""))
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtUserName {
            var query = String()
                query += string
            didSearchUser(by: textField.text ?? "")
//            let currentText = (textField.text as NSString?) ?? ""
//            let updatedText = currentText.replacingCharacters(in: range, with: string)
//            didSearchUser(by: updatedText)
            return true
        }
        return true
    }
}
