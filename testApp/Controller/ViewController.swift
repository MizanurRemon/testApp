//
//  ViewController.swift
//  testApp
//
//  Created by Mizanur Remon on 8/1/20.
//  Copyright © 2020 Mizanur Remon. All rights reserved.
//

import UIKit

import FirebaseCore
import FirebaseAuth


class ViewController: UIViewController {

    
    var ran: Int = 0
    
    //var otp: String
    
   
    
   
    
    
    @IBOutlet weak var contactText: UITextField!
    @IBOutlet weak var codeText: UITextField!
    @IBOutlet weak var roundSubmit: UIButton!
    var num: String = ""
        
        

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Datbase
        
       FirebaseApp.configure()
        
        
        
        roundSubmit.layer.cornerRadius = 6
        
         UserDefaults.standard.set("+8801235166352", forKey: "Number")
        
        num = UserDefaults.standard.string(forKey: "Number")!
        //print(num)
        
        
        
         
    }
    
    
    
        
    @IBAction func submitButton(_ sender: Any) {
        
        
        


        
        if contactText.text == "" || codeText.text == ""{
            
            if contactText.text == ""{
                let contactalert = UIAlertController(title: "Warning", message: "Phone Number Missing", preferredStyle: UIAlertController.Style.alert)
                
                contactalert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {  _ in
                    
                }))
                
                present(contactalert, animated: true, completion: nil)
                
            }
            else if codeText.text == ""{
                let codealert = UIAlertController(title: "Warning", message: "Phone Number Missing", preferredStyle: UIAlertController.Style.alert)
                
                codealert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {  _ in
                    
                }))
                
                present(codealert, animated: true, completion: nil)
            }
        }
            
        else if (contactText.text) != "" && (codeText.text) != ""{
            
            ran = Int.random(in: 100000...999999)
            print(ran)
            
            let phoneNumber: String = codeText.text! + contactText.text!
            
            if phoneNumber == num {
                self.performSegue(withIdentifier: "performSubmit", sender: self)
                
            }
            else{
                let unmatchAlert = UIAlertController(title: "Warning", message: "Match not found", preferredStyle: .alert)
                unmatchAlert.addAction(UIAlertAction(title: "ok", style: .default, handler: { _ in
                    //
                }))
                
                self.present(unmatchAlert, animated: true, completion: nil)
            }
            

            /*let testVerificationCode = "123456"
            
            print(phoneNumber)
            
            Auth.auth().settings?.isAppVerificationDisabledForTesting = true
            PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
                
                if error != nil{
                    print("Error")
                }
                
                let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID ?? "", verificationCode: testVerificationCode)
                
                    Auth.auth().signInAndRetrieveData(with: credential) { authData, error in
                      if error != nil{
                          print("Error")
                      }
                      else{
                        self.performSegue(withIdentifier: "performSubmit", sender: self)
                    }
                }
                
            }*/
             
        }
    }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            let nextview = segue.destination as! submitViewController
            nextview.code = self.ran
        }

}
