//
//  LoginViewController.swift
//  StudyBuddy
//
//  Created by Manasa Tipparam on 9/26/15.
//  Copyright © 2015 Manasa Tipparam. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!

    var success: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
        override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(emailTF.text!, password: passwordTF.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                
                
                self.performSegueWithIdentifier("LoginSegue", sender: nil)
            } else {
                let alert = UIAlertView(title: "Try Again", message: "Please check your login credentials and try again", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            }
        }
        
        
//        let request = NSMutableURLRequest(URL: NSURL(string: "http://ericyeh.me/studybuddy/mobile/login.php")!)
//        
//        request.HTTPMethod = "POST"
//        
//        let postString = "email=" + emailTF.text! + "&password=" + passwordTF.text!
//        
//        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
//        
//        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
//            data, response, error in
//            
//            if error != nil
//            {
//                print("error=\(error)")
//                return
//            }
//            
//            // You can print out response object
//            print("response = \(response)")
//            
//            // Print out response body
//            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            print("responseString = \(responseString)")
//            
//            //----------------------------------------------------------------------------------------------
//            
//            //let res:NSInteger = jsonData.valueForKey("success") as NSInteger
//            
//            
//            
//            if(responseString?.length == 14)
//            {
//                print("SUCCESS")
//                self.success = true
//            }
//        }
//        
//        task.resume()
//        
//        if(self.success == true)
//        {
//            let next = self.storyboard?.instantiateViewControllerWithIdentifier("welcomeVC") as! WelcomeViewController
//            self.presentViewController(next, animated: true, completion: nil)
//        }
//        else
//        {
//            let alert = UIAlertController(title: "Incorrect Login Information", message: "Please check your login credentials and try again", preferredStyle: UIAlertControllerStyle.Alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
//            self.presentViewController(alert, animated: true, completion: nil)
//            
//        }

    }
    

}
