//
//  WelcomeViewController.swift
//  StudyBuddy
//
//  Created by Manasa Tipparam on 9/26/15.
//  Copyright © 2015 Manasa Tipparam. All rights reserved.
//

import UIKit
import Parse

class WelcomeViewController: UIViewController {

    
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userNameLabel.text = PFUser.currentUser()?.objectForKey("firstName") as! String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
