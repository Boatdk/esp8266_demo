//
//  ControlVC.swift
//  esp8266Demo
//
//  Created by Supanut Laddayam on 9/12/2562 BE.
//  Copyright © 2562 Supanut Laddayam. All rights reserved.
//

import UIKit

class ControlVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    @IBAction func handleTapON(_ sender: Any) {
        var url = NSURL(string: "https://www.google.com/")
        var urlReq = NSURLRequest(url: url as! URL)
        webView.loadRequest(urlReq as URLRequest)
    }
    
    @IBAction func handleTapOFF(_ sender: Any) {
        print("tap OFF buttn")
    }
    

}
