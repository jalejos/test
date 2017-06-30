//
//  PatientService.swift
//  Api2Code
//
//  Created by Alejos on 6/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation

class PatientService {
    static func getPatients(firstName: String?, lastName: String?, dob: String?, token: String, completionHandler: @escaping ([Patient]?, Error?) -> Void) {
        PatientRepository.getPatients(firstName: firstName, lastName: lastName, dob: dob, token: token) { dictionary, error in
            if let dictionary = dictionary {
                var patientArray: [Patient] = []
                if let dictionaryArray = dictionary["results"] as? [[String: Any]] {
                    for patientDictionary in dictionaryArray {
                        patientArray.append(Patient(patientDictionary))
                    }
                }
                completionHandler(patientArray, nil)
            } else {
                completionHandler(nil, error)
            }
        }
    }
    
    static func getPatients(limit: Int?, offset: Int?, token: String, completionHandler: @escaping ([Patient]?, Error?) -> Void) {
        PatientRepository.getPatients(limit: limit, offset: offset, token: token) { dictionary, error in
            if let dictionary = dictionary {
                var patientArray: [Patient] = []
                if let dictionaryArray = dictionary["results"] as? [[String: Any]] {
                    for patientDictionary in dictionaryArray {
                        patientArray.append(Patient(patientDictionary))
                    }
                }
                completionHandler(patientArray, nil)
            } else {
                completionHandler(nil, error)
            }
        }
    }
    
    static func setPatient(patientID: Int, firstName: String, lastName: String, dob: String, sex: String, primaryPhysician: Int, caregiverPractice: Int, token: String, completionHandler: @escaping (Patient?, Error?) -> Void) {
        PatientRepository.setPatient(patientID: patientID, firstName: firstName, lastName: lastName, dob: dob, sex: sex, primaryPhysician: primaryPhysician, caregiverPractice: caregiverPractice, token: token) { dictionary, error in
            if let dictionary = dictionary {
                completionHandler(Patient(dictionary), nil)
            } else {
                completionHandler(nil, error)
            }
        }
    }
}
