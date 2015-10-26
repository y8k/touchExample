//
//  PresentedViewController.swift
//  touchExample
//
//  Created by KimYoonBong on 2015. 10. 23..
//  Copyright © 2015년 y8k. All rights reserved.
//

import UIKit

class PresentedViewController: UITableViewController, UIViewControllerPreviewingDelegate {
    
    enum ShortCutIdentifier: String {
        case Function01
        case Function02
        case Function03
        
        var type: String    {
            return NSBundle.mainBundle().bundleIdentifier! + ".\(self.rawValue.lowercaseString)"
        }
    }
    
    enum DetailType: UInt   {
        case List
        case Web
        case Content
    }
    
    let data = [
        dataStruct(title: "Content - One", type: .List),
        dataStruct(title: "Content - Two", type: .Web),
        dataStruct(title: "Content - Three", type: .Content)
    ]
    
    struct dataStruct {
        let title: String
        let type: DetailType
    }
    
    
    var shortCutItem: UIApplicationShortcutItem?    {
        
        didSet  {
            self.title = shortCutItem!.localizedTitle
            self.handleShortCutItem(shortCutItem!.type)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerForPreviewingWithDelegate(self, sourceView: view)
        
    }
    
    func handleShortCutItem(type: String) -> Void   {
        
        switch type {
        case ShortCutIdentifier.Function01.type:
            self.view.backgroundColor = UIColor.redColor()
            break
        case ShortCutIdentifier.Function02.type:
            self.view.backgroundColor = UIColor.greenColor()
            break
        case ShortCutIdentifier.Function03.type:
            self.view.backgroundColor = UIColor.yellowColor()
            break
        default:
            self.view.backgroundColor = UIColor.whiteColor()
            break
        }
    }
    
    @IBAction func doDismiss(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: UITableView dataSource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PEEK_POP_TABLEVIEW_CELL", forIndexPath: indexPath)
        
        let data = self.data[indexPath.row]

        cell.textLabel!.text = data.title
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let indexPath = self.tableView.indexPathForSelectedRow else { return }
        let selectedData = data[indexPath.row]
        
        switch selectedData.type    {
        case .List:
            self.performSegueWithIdentifier("SHOW_LIST_SCREEN", sender: nil)
            break
        case .Web:
            self.performSegueWithIdentifier("SHOW_WEB_SCREEN", sender: nil)
            break
        case .Content:
            self.performSegueWithIdentifier("SHOW_CONTENT_SCREEN", sender: nil)
            break
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    // MARK: UIViewControllerPreviewing delegate
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        guard let indexPath = self.tableView.indexPathForRowAtPoint(location), cell = self.tableView.cellForRowAtIndexPath(indexPath) else { return nil }
        
        let selectedData = self.data[indexPath.row]
        var detailViewCntrlr: UIViewController?
        
        switch selectedData.type    {
        case .List:
            detailViewCntrlr = self.storyboard?.instantiateViewControllerWithIdentifier("DETAIL_LIST_SCREEN")
            break;
        case .Web:
            detailViewCntrlr = self.storyboard?.instantiateViewControllerWithIdentifier("DETAIL_WEB_SCREEN")
            break;
        case .Content:
            detailViewCntrlr = self.storyboard?.instantiateViewControllerWithIdentifier("DETAIL_CONTENT_SCREEN")
            break;
        }
        
        guard detailViewCntrlr != nil else { return nil }
        
        detailViewCntrlr!.preferredContentSize = CGSizeMake(0.0, 0.0)
        previewingContext.sourceRect = cell.frame
        
        return detailViewCntrlr
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        showViewController(viewControllerToCommit, sender: self)
    }
    
}
