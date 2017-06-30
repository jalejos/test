//
//  Allergy.swift
//  Api2Code
//
//  Created by Alejos on 6/30/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation

class Allergy {
    var allergyID: Int
    var status: String
    var startDate: String
    var name: String
    var reaction: String
    var medispanID: String
    var medispandnID: String
    var patient: Int
    
    init(_ dictionary: [String: Any]) {
        allergyID           = dictionary["id"] as? Int ?? 0
        status              = dictionary["status"] as? String ?? ""
        startDate           = dictionary["start_date"] as? String ?? ""
        name                = dictionary["name"] as? String ?? ""
        reaction            = dictionary["reaction"] as? String ?? ""
        medispanID          = dictionary["medispanid"] as? String ?? ""
        medispandnID        = dictionary["medispandnid"] as? String ?? ""
        patient             = dictionary["patient"] as? Int ?? 0
    }
}
