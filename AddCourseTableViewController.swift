//
//  AddCourseTableViewController.swift
//  StudyBuddy
//
//  Created by Manasa Tipparam on 9/26/15.
//  Copyright © 2015 Manasa Tipparam. All rights reserved.
//

import UIKit
import Parse

class AddCourseTableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet weak var departmentPicker: UIPickerView!
    @IBOutlet weak var coursePicker: UIPickerView!
    
    
    var departmentVisible: Bool = false
    var courseVisible: Bool = false
    var currentRow = 0
    
    //let departments = getDepartments((PFUser.currentUser()?.objectForKey("college"))!)
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func getDepartments(collegeID: Int) -> [PFObject]
    {
        let query: PFQuery = PFQuery(className: "Courses")
        query.whereKey("college", equalTo: collegeID)
        var arr: [PFObject] = []
        do {
            arr = try query.findObjects()
        } catch {
            
        }
        return arr;
    }
    
    func getCourses(dept: String) -> [PFObject]
    {
        let query: PFQuery = PFQuery(className: "Courses")
        query.whereKey("department", equalTo: dept)
        var arr: [PFObject] = []
        do {
            arr = try query.findObjects()
        } catch {
            
        }
        return arr;

    }
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        
        let back = self.storyboard?.instantiateViewControllerWithIdentifier("manageCoursesVC") as! ManageCoursesViewController
        self.presentViewController(back, animated: true, completion: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showDepartmentPickerCell() {
        self.departmentVisible = true
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        self.departmentPicker.hidden = false
        self.departmentPicker.alpha = 0.0;
        UIView.animateWithDuration(0.25, animations: {self.departmentPicker.alpha = 1.0; })
    }
    
    func hideDepartmentPickerCell() {
        self.departmentVisible = false
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        UIView.animateWithDuration(0.25,
            animations: { self.departmentPicker.alpha = 0.0;
            })
        self.departmentPicker.hidden = true
    }
    
    func showCoursePickerCell() {
        self.courseVisible = true
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        self.coursePicker.hidden = false
        self.coursePicker.alpha = 0.0;
        UIView.animateWithDuration(0.25, animations: {self.coursePicker.alpha = 1.0; })

    }
    
    func hideCoursePickerCell() {
        self.courseVisible = false
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        UIView.animateWithDuration(0.25,
            animations: { self.coursePicker.alpha = 0.0;
        })
        self.coursePicker.hidden = true

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

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var height: CGFloat = self.tableView.rowHeight;
        if (indexPath.row == 1)
        {
            height = departmentVisible ? 200.0 : 0.0
        }
        else if (indexPath.row == 3)
        {
            height = courseVisible ? 200 : 0
        }
        return height;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row == 1)
        {
            if(self.departmentVisible)
            {
                self.hideDepartmentPickerCell()
            }
            else
            {
                self.showDepartmentPickerCell()
            }
        }
        else if(indexPath.row == 3)
        {
            if(self.courseVisible)
            {
                self.hideCoursePickerCell()
            }
            else
            {
                self.showCoursePickerCell()
            }

        }
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //MARK: - Picker Data Source & Delegate Methods
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }

}
