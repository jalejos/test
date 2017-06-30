//
//  AllergyService.swift
//  Api2Code
//
//  Created by Alejos on 6/30/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation

class AllergyService {
    static func getAllergy(allergyID: Int, token: String, completionHandler: @escaping (Allergy?, Error?) -> Void) {
        AllergyRepository.getAllergy(allergyID: allergyID, token: token) { dictionary, error in
            if let dictionary = dictionary {
                completionHandler(Allergy(dictionary), nil)
            } else {
                completionHandler(nil, error)
            }
        }
    }
}
