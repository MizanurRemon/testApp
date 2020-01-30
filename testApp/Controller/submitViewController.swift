//
//  submitViewController.swift
//  testApp
//
//  Created by Mizanur Remon on 8/1/20.
//  Copyright © 2020 Mizanur Remon. All rights reserved.
//

import UIKit

class submitViewController: UIViewController {

    @IBOutlet weak var otpText: UILabel!
    @IBOutlet weak var otpmatchText: UITextField!
    @IBOutlet weak var roundSubmit: UIButton!
    
        var code: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        otpText.text = String(code)
        //print(otpText.text!)
        roundSubmit.layer.cornerRadius = 6
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func submitButton(_ sender: Any) {
        
        if (otpmatchText.text) != (otpmatchText.text) || otpmatchText.text == ""{
            let otpalert = UIAlertController(title: "Warning", message: "OTP code not match", preferredStyle: .alert)
            otpalert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                
            }))
            self.present(otpalert, animated: true, completion: nil)
        }
        else if otpmatchText.text == otpmatchText.text {
            performSegue(withIdentifier: "afterVerification", sender: self)
        }
        
        
    }
    
}
