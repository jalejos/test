//
//  Service.swift
//  Api2Code
//
//  Created by Alejos on 6/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation

class AuthService {
    static func getAuth(username: String, password: String, grantType: String, clientID: String, clientSecret: String, completionHandler: @escaping (String?, Error?) -> Void) {
        AuthRepository.getAuth(username: username, password: password, grantType: grantType, clientID: clientID, clientSecret: clientSecret) { dictionary, error in
            if let dictionary = dictionary {
                if let token = dictionary["access_token"] as? String {
                    completionHandler(token, nil)
                } 
            } else {
                completionHandler(nil, error)
            }
        }
    }
}
