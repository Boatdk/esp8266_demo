//
//  ViewController.swift
//  esp8266Demo
//
//  Created by Supanut Laddayam on 9/12/2562 BE.
//  Copyright © 2562 Supanut Laddayam. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var responseLabel1: UILabel!
    @IBOutlet weak var responseLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func postMethod(endPoint: String,switchValue: String, pageValue: String, responseLabel: UILabel ) {
        let parameter = ["switch": switchValue, "page": pageValue]
        guard let url = URL(string: endPoint) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: []) else {return}
        request.httpBody = httpBody
        
        let session =  URLSession.shared
        session.dataTask(with: request) { (data, response, error) in

            if let data = data {
                do {
                    let res = try JSONDecoder().decode(passingVariable.self, from: data)
                    print(res.page)
                    DispatchQueue.main.async {
                        responseLabel.text = res.page
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
        //"switchs": "1","page": "1"
    //"http://192.168.4.1/wifiinfo"
    
    @IBAction func handleTapPost(_ sender: Any) {
        postMethod(endPoint: "http://192.168.4.1/wifiinfo", switchValue: "1", pageValue: "2", responseLabel: responseLabel1)
    }

    
    @IBAction func handleTapPost2(_ sender: Any) {
        postMethod(endPoint: "http://192.168.4.1/wifiinfo", switchValue: "1", pageValue: "2", responseLabel: responseLabel2)
    }
}
