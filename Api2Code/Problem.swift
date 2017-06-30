//
//  Problem.swift
//  Api2Code
//
//  Created by Alejos on 6/30/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation

class Problem {
    var problemID: Int
    var description: String
    var status: String
    var synopsis: String?
    var startDate: String
    var resolvedDate: String?
    var patient: Int
    var dx: [[String: Any]]?
    
    init(_ dictionary: [String: Any]) {
        problemID       = dictionary["id"] as? Int ?? 0
        description     = dictionary["description"] as? String ?? ""
        status          = dictionary["status"] as? String ?? ""
        synopsis        = dictionary["synopsis"] as? String ?? ""
        startDate       = dictionary["start_date"] as? String ?? ""
        resolvedDate    = dictionary["resolved_date"] as? String
        patient         = dictionary["patient"] as? Int ?? 0
        dx              = dictionary["dx"] as? [[String: Any]]
    }
}
