//
//  AddCourseTableViewController.swift
//  StudyBuddy
//
//  Created by Manasa Tipparam on 9/26/15.
//  Copyright © 2015 Manasa Tipparam. All rights reserved.
//

import UIKit

class AddCourseTableViewController: UITableViewController {

    
    @IBOutlet weak var departmentPicker: UIPickerView!
    @IBOutlet weak var coursePicker: UIPickerView!
    
    var departmentTapped: Bool = false
    var courseTapped: Bool = false
    var currentRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    @IBAction func backButtonPressed(sender: AnyObject) {
        
        let back = self.storyboard?.instantiateViewControllerWithIdentifier("manageCoursesVC") as! ManageCoursesViewController
        self.presentViewController(back, animated: true, completion: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        currentRow = indexPath.row
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
//    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        if indexPath.row == 0
//        {
//            return 98
//        }
//        if (currentRow == 1 && 1 == indexPath.row)
//        {
//            if departmentTapped == false
//            {
//                departmentTapped == true
//                print("Open department picker")
//                return 141
//            }
//            else
//            {
//                departmentTapped = false
//                print("Close department picker")
//
//                return 45
//            }
//        }
//        else if (currentRow == 3 && 3 == indexPath.row)
//        {
//            if courseTapped == false
//            {
//                courseTapped == true
//                print("Open course picker")
//
//                return 141
//            }
//            else
//            {
//                courseTapped = false
//                print("Close course picker")
//
//                return 45
//            }
//        }
//        else if indexPath.row == 5
//        {
//            return 400
//        }
//        return 45
//    }
    
    
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
