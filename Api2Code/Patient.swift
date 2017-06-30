//
//  Patient.swift
//  Api2Code
//
//  Created by Alejos on 6/29/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation

class Patient {
    var patientID: Int
    var firstName: String
    var lastName: String
    var sex: String
    var dob: String
    var ssn: String?
    var race: String
    var ethnicity: String
    var preferedLanguage: String?
    var address: String?
    var phones: [String] = []
    var emails: [String] = []
    var emergencyContact: String?
    var primaryPhysician: Int?
    var primaryCareProvider: Int?
    var caregiverPractice: Int?
    var masterPatient: String?
    var employer: String?
    
    init(_ dictionary: [String: Any]) {
        patientID           = dictionary["id"] as? Int ?? 0
        firstName           = dictionary["first_name"] as? String ?? ""
        lastName            = dictionary["last_name"] as? String ?? ""
        sex                 = dictionary["sex"] as? String ?? ""
        dob                 = dictionary["dob"] as? String ?? ""
        ssn                 = dictionary["ssn"] as? String
        race                = dictionary["race"] as? String ?? ""
        ethnicity           = dictionary["ethnicity"] as? String ?? ""
        preferedLanguage    = dictionary["prefered_language"] as? String ?? ""
        address             = dictionary["address"] as? String
        phones              = dictionary["phones"] as? [String] ?? []
        emails              = dictionary["emails"] as? [String] ?? []
        emergencyContact    = dictionary["emergency_contact"] as? String
        primaryPhysician    = dictionary["primary_physician"] as? Int
        primaryCareProvider = dictionary["primary_care_provider"] as? Int
        caregiverPractice   = dictionary["caregiver_practice"] as? Int
        masterPatient       = dictionary["master_patient"] as? String
        employer            = dictionary["employer"] as? String
    }
}
