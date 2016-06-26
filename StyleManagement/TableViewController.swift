//
//  TableViewController.swift
//  StyleManagement
//
//  Created by Nicholas Sakaimbo on 1/10/16.
//  Copyright © 2016 nick_skmbo. All rights reserved.
//

import UIKit

private class DataFetchController {
    
    enum DataError: ErrorType {
        case Initialize
    }
    
    class func getSampleData () throws -> NSDictionary {
        guard let path = NSBundle.mainBundle().pathForResource("sample", ofType: "plist"), let _places = NSDictionary(contentsOfFile: path) else {
            print("Error initializing sample data from app bundle.")
            throw DataError.Initialize
        }
        return _places
    }
}

class TableViewController: UITableViewController {

    // MARK: - Properties
    
    let kTableViewRowHeight: CGFloat = 150.0
    let kTableViewNumberOfSections: Int = 1
    let kTableViewNumberOfRows: Int = 5
    let places: NSDictionary
 
    // segues
    let segueToViewController = "segueToViewController"
    
    // MARK: - UIViewController Life Cycle
    
    // **Side note: Pretty neat way of creating a custom designated initializer.
    // This helps avoid having to explicitly repeat custom initialization logic in multiple initializers
    // Thanks to Yusef Napora for this handy post! http://napora.org/nscoder-and-swift-initialization/
    init(_ coder: NSCoder? = nil) {
        self.places = try! DataFetchController.getSampleData()
        
        if let coder = coder {
            super.init(coder: coder)!
        } else {
            super.init(nibName: nil, bundle: nil)
        }
    }
   
    required convenience init(coder: NSCoder) {
        self.init(coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let insets = UIEdgeInsetsMake(Device.statusBarHeight, 0, 0, 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        tableView.separatorStyle = .None
        tableView.dataSource = self
        tableView.delegate = self
        tableView.bounces = true
        tableView.rowHeight = kTableViewRowHeight
        tableView.tableFooterView = UIView()
        
        let statusBarView = UIView(frame: CGRect(x: 0, y: 0, width: Device.screenWidth, height: Device.statusBarHeight))
        statusBarView.backgroundColor = self.view.backgroundColor
        navigationController?.view.addSubview(statusBarView)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
   
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
       
        // Use the default title of "Back" for the back button item
        self.navigationItem.title = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation and Status Bar Style
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .Default
    }
    
    // MARK: - UITableViewDataSource

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return kTableViewNumberOfSections
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.places.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableViewCell.reuseIdentifer, forIndexPath: indexPath) as! TableViewCell
        let location = places.allKeys[indexPath.row] as! String
        let dateTaken = places[location]!["Date"] as! NSDate
        cell.updateCellLabels(withDate: dateTaken, andLocation: location)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let location = places.allKeys[indexPath.row] as! String
        self.performSegueWithIdentifier(self.segueToViewController, sender: location)
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let location = sender as! String
        let vc = segue.destinationViewController as! ViewController
        vc.location = location
        vc.edgesForExtendedLayout = .None
        vc.locationDescription = places[location]!["Description"] as! String
        vc.imageIdentifer = location + "-portrait.jpg"
    }
}
