//
//  DetailListViewController.swift
//  touchExample
//
//  Created by KimYoonBong on 2015. 10. 26..
//  Copyright © 2015년 y8k. All rights reserved.
//

import UIKit

class DetailListViewController: UITableViewController {

    var invert: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("DETAIL_LIST_CELL", forIndexPath: indexPath)
        
        cell.textLabel!.text = invert ? "\(20 - indexPath.row) rows" : "\(indexPath.row) rows"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }   
}
