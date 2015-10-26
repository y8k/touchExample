//
//  DetailWebViewController.swift
//  touchExample
//
//  Created by KimYoonBong on 2015. 10. 26..
//  Copyright © 2015년 y8k. All rights reserved.
//

import UIKit

class DetailWebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loadingActivityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let URL = NSURL(string: "http://y8k.me")
        let request = NSURLRequest(URL: URL!)
        
        self.webView.loadRequest(request)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func webViewDidStartLoad(webView: UIWebView) {
        self.loadingActivityIndicatorView.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.loadingActivityIndicatorView.stopAnimating()
    }
    
    
    override func previewActionItems() -> [UIPreviewActionItem] {
        
        let safariAction = UIPreviewAction(title: "Open with Safari", style: UIPreviewActionStyle.Default) { (action, viewCntrlr) -> Void in
            UIApplication.sharedApplication().openURL(NSURL(string: "http://y8k.me")!)
        }
        
        let closeAction = UIPreviewAction(title: "Copy URL", style: .Default) { (action, viewCntrlr) -> Void in
            UIPasteboard.generalPasteboard().string = "http://y8k.me"
        }
        
        return [safariAction, closeAction]
    }
}
