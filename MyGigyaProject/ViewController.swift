//
//  ViewController.swift
//  MyGigyaProject
//
//  Created by Amani Soysa on 14/3/20.
//  Copyright © 2020 poohdedoo. All rights reserved.
//

import UIKit
import Gigya

class ViewController: UIViewController {

    @IBOutlet weak var userNameTxtField: UITextField!
    
    @IBOutlet weak var passwordTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func loginPressed(_ sender: Any) {
        let userName = userNameTxtField.text!
        let password = passwordTxtField.text!
        
        let gigya = Gigya.sharedInstance()
        gigya.showScreenSet(with: "Default-RegistrationLogin", viewController: self) { result in
            switch result {
                case .onLogin(let account):
                    print(account)
                    break
                case .error(let event):
                    print(event)
                    break
                default:
                    break
            }
        }
        
        print ("User Name " + userName)
         print ("Password" + password)
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        let gigya = Gigya.sharedInstance()
        gigya.socialLoginWith(providers: [.facebook, .google, .line], viewController: self, params: [:]) { (result) in
            switch result {
                case .success(let data):
                    print(data)
                case .failure(let error):
                    print(error)
                default:
                    print("default")
            }
        }
    }
    
    

}

