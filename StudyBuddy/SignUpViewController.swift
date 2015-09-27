//
//  SignUpViewController.swift
//  StudyBuddy
//
//  Created by Manasa Tipparam on 9/26/15.
//  Copyright © 2015 Manasa Tipparam. All rights reserved.
//

import UIKit
import Parse

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
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func signUpButtonPressed(sender: AnyObject) {
        
        //if any fields are empty
        if (firstNameTF.text!.isEmpty || lastNameTF.text!.isEmpty || emailTF.text!.isEmpty || passwordTF.text!.isEmpty || confirmPassTF.text!.isEmpty)
        {
            let alert = UIAlertController(title: "All Fields Are Required", message: "Check that all the fields are filled in.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        //if passwords don't match
        else if(passwordTF.text != confirmPassTF.text)
        {
            let alert = UIAlertController(title: "Passwords Don't Match", message: "Try Again", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        
        //Sign up-parse
        let user = PFUser()
        user.setObject(firstNameTF.text!, forKey: "firstName")
        user.setObject(lastNameTF.text!, forKey: "lastName")
        user.username = emailTF.text
        user.email = emailTF.text
        user.password = passwordTF.text
        
        user.signUpInBackgroundWithBlock({
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                _ = error.userInfo["error"] as? NSString
            } else {
            
            }
            dispatch_async(dispatch_get_main_queue(), {
                self.firstNameTF.text = ""
                self.lastNameTF.text = ""
                self.emailTF.text = ""
                self.passwordTF.text = ""
                self.confirmPassTF.text = ""
                
                let next = self.storyboard?.instantiateViewControllerWithIdentifier("welcomeVC") as! WelcomeViewController
                self.presentViewController(next, animated: true, completion: nil)
            })
        })

        
        
        //Send data to server
//        let myUrl = NSURL(string: "http://ericyeh.me/studybuddy/mobile/register.php")
//        let request = NSMutableURLRequest(URL: myUrl!)
//        request.HTTPMethod = "POST"
//        
//        let postString = "firstName=" + firstNameTF.text! + "&lastName=" + lastNameTF.text! + "&email=" + emailTF.text! + "&password=" + passwordTF.text!
//        
//        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
//        
//        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
//            data, response, error in
//            
//            if error != nil {
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
//            
//            var json: AnyObject?
//            
//            do {
//                 json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
//                print(json)
//            } catch let err as NSError {
//                print(err)
//            }
//        
//            
//        }
//        
//        task.resume()
        
        
//        let next = self.storyboard?.instantiateViewControllerWithIdentifier("welcomeVC") as! WelcomeViewController
//        self.presentViewController(next, animated: true, completion: nil)

    }
    
    
    

}
