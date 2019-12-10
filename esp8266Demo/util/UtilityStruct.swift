//
//  UtilityStruct.swift
//  esp8266Demo
//
//  Created by Supanut Laddayam on 10/12/2562 BE.
//  Copyright © 2562 Supanut Laddayam. All rights reserved.
//

import Foundation

struct passingVariable: Decodable {
    let page: String
    let sswitch: String
    
    init(json: [String: Any]) {
        page = json["page"] as? String ?? ""
        sswitch = json["sswitch"] as? String ?? ""
    }
}
