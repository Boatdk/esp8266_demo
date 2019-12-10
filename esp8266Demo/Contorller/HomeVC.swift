//
//  ViewController.swift
//  esp8266Demo
//
//  Created by Supanut Laddayam on 9/12/2562 BE.
//  Copyright © 2562 Supanut Laddayam. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //"switchs": "1","page": "1"

    @IBAction func handleTapPost(_ sender: Any) {
        let parameter = ["switch": "1", "page":"1"]
        
        guard let url = URL(string: "http://192.168.4.1/wifiinfo") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: []) else {return}
        request.httpBody = httpBody
        
        let session =  URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [] )
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    @IBAction func handleTapPost2(_ sender: Any) {
        let parameter = ["switch": "1", "page":"2"]
        
        guard let url = URL(string: "http://192.168.4.1/wifiinfo") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: []) else {return}
        request.httpBody = httpBody
        
        let session =  URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [] )
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }

    
    
}

