//
//  PresentedViewController.swift
//  touchExample
//
//  Created by KimYoonBong on 2015. 10. 23..
//  Copyright © 2015년 y8k. All rights reserved.
//

import UIKit

class PresentedViewController: UIViewController {
    
    enum ShortCutIdentifier: String {
        case Function01
        case Function02
        case Function03
        
        var type: String    {
            return NSBundle.mainBundle().bundleIdentifier! + ".\(self.rawValue.lowercaseString)"
        }
    }
    
    
    var shortCutItem: UIApplicationShortcutItem?    {
        
        didSet  {
            self.title = shortCutItem!.localizedTitle
            self.handleShortCutItem(shortCutItem!.type)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
}
