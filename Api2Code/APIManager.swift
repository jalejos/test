//
//  APIManager.swift
//  Api2Code
//
//  Created by Alejos on 6/27/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation

class APIManager {
    private static var serverURL: String {
        return "https://sandbox.elationemr.com/api/2.0"
    }
    
    static let baseURL: URL = URL(string: serverURL)!
}
