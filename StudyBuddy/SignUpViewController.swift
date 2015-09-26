//
//  SignUpViewController.swift
//  StudyBuddy
//
//  Created by Manasa Tipparam on 9/26/15.
//  Copyright © 2015 Manasa Tipparam. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPassTF: UITextField!
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func signUpButtonPressed(sender: AnyObject) {
        
        if (firstNameTF.text!.isEmpty || lastNameTF.text!.isEmpty || emailTF.text!.isEmpty || passwordTF.text!.isEmpty || confirmPassTF.text!.isEmpty)
        {
            let alert = UIAlertController(title: "All Fields Are Required", message: "Check that all the fields are filled in.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        if(passwordTF.text != confirmPassTF.text)
        {
            let alert = UIAlertController(title: "Passwords Don't Match", message: "Try Again", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("homePage") as! UINavigationController
        self.presentViewController(next, animated: true, completion: nil)

    }
    
    
    

}
