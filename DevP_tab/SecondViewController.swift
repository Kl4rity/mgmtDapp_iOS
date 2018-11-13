//
//  SecondViewController.swift
//  DevP_tab
//
//  Created by Norb on 05.11.18.
//  Copyright © 2018 Norb. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var input: UITextField!
    
    @IBAction func addItem(_ sender: Any) {
       
        //check input field
        if (input.text != ""){
            listGrpName.append(input.text!)
            input.text = ""
            
            input.resignFirstResponder()
            print(listGrpName)
        }else{
            print("empty")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        input.delegate = self

    }

    
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        input.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

