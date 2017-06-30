//
//  PatientRepository.swift
//  Api2Code
//
//  Created by Alejos on 6/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation

class PatientRepository {
    static func getPatients(firstName: String?, lastName: String?, dob: String?, token: String, completionHandler: @escaping ([String: Any]?, Error?) -> Void) {
        let request = RequestRouting.getPatients(firstName: firstName, lastName: lastName, dob: dob, token: token, limit: nil, offset: nil).urlRequest!
        handleRequest(request: request, completionHandler: completionHandler)
    }
    
    static func getPatients(limit: Int?, offset: Int?, token: String, completionHandler: @escaping ([String: Any]?, Error?) -> Void) {
        let request = RequestRouting.getPatients(firstName: nil, lastName: nil, dob: nil, token: token, limit: limit, offset: offset).urlRequest!
        handleRequest(request: request, completionHandler: completionHandler)
    }
    
    static func setPatient(patientID: Int, firstName: String, lastName: String, dob: String, sex: String, primaryPhysician: Int, caregiverPractice: Int, token: String, completionHandler: @escaping ([String: Any]?, Error?) -> Void) {
        let request = RequestRouting.setPatient(patientID: patientID,firstName: firstName, lastName: lastName, dob: dob, sex: sex, primaryPhysician: primaryPhysician, caregiverPractice: caregiverPractice, token: token).urlRequest!
        handleRequest(request: request, completionHandler: completionHandler)
    }
    
    static private func handleRequest (request: URLRequest, completionHandler: @escaping ([String: Any]?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let dictionary = json as? [String: Any] {
                    completionHandler(dictionary, nil)
                } else if let error = error {
                    completionHandler(nil, error)
                } else {
                    completionHandler(nil, nil)
                }
            }
        }
        task.resume()
    }
}
