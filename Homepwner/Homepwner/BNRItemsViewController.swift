//
//  BNRItemsViewController.swift
//  Homepwner
//
//  Created by Han Kang on 6/10/14.
//  Copyright (c) 2014 LinkedIn. All rights reserved.
//

import UIKit
@IBDesignable
class BNRItemsViewController: UITableViewController {
    @IBOutlet var _headerView:UIView?
    @IBInspectable var headerView:UIView {
        get {
            if _headerView? {
                return _headerView!
            }
            NSBundle.mainBundle().loadNibNamed("HeaderView", owner: self, options: nil)
            return _headerView!
        }
    }
    init() {
        super.init(style:UITableViewStyle.Plain)
        for i in 0...5 {
            BNRItemStore.sharedStore.createItem()
        }
    }
    init(coder aDecoder: NSCoder!)
    {
        super.init(coder: aDecoder)
    }
    init(style:UITableViewStyle) {
        super.init(style:style)
    }
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "blah")
        var header = self.headerView
        self.tableView.tableHeaderView = header
    
//        self.tableView.tableHeaderView = self.headerView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // #pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return BNRItemStore.count
    }

    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
        var cell = tableView!.dequeueReusableCellWithIdentifier("blah", forIndexPath: indexPath) as UITableViewCell
        if indexPath!.row % 2 == 0 {
            cell.backgroundColor = UIColor.blueColor()
            cell.textColor = UIColor.whiteColor()
        }
        var items = BNRItemStore.items
        var item = items[indexPath!.row] as BNRItem
        cell.textLabel.text = item.description

        return cell
    }
    @IBAction func addNewItem(sender:AnyObject) {
        
    }
    
    @IBAction func toggleEditingMode(sender:AnyObject) {
        
//        if self.isEditing {
//            
//        }
    }
    override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        return true
    }



    override func tableView(tableView: UITableView?, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            // Delete the row from the data source
//            tableView!.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        } else if editingStyle == UITableViewCellEditingStyle.Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView?, moveRowAtIndexPath fromIndexPath: NSIndexPath?, toIndexPath: NSIndexPath?) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView?, canMoveRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}