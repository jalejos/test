//
//  RequestRouting.swift
//  Api2Code
//
//  Created by Alejos on 6/27/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation

enum RequestRouting {
    case getAuth(username: String, password: String, grantType: String, clientID: String, clientSecret: String)
    case getPatients(firstName: String?, lastName: String?, dob: String?, token: String, limit: Int?, offset: Int?)
    case setPatient(patientID: Int, firstName: String, lastName: String, dob: String, sex: String, primaryPhysician: Int, caregiverPractice: Int, token: String)
    case getAllergy(allergyID: Int, token: String)
    case getProblem(problemID: Int, token: String)
    
    private var url: String {
        switch self {
        case .getAuth, .getPatients, .setPatient, .getAllergy, .getProblem:
            return APIManager.baseURL.absoluteString
        }
    }
    
    private var path: String {
        switch self {
        case .getAuth:
            return "/oauth2/token/"
        case .getPatients:
            return "/patients/"
        case let .setPatient(patientID, _, _, _, _, _, _, _):
            return "/patients/\(patientID)"
        case let .getAllergy(allergyID, _):
            return "/allergies/\(allergyID)"
        case let .getProblem(problemID, _):
            return "/problems/\(problemID)"
        }
    }
    
    private var method: String {
        switch self {
        case .getAuth:
            return "POST"
        case .getPatients, .getAllergy, .getProblem:
            return "GET"
        case .setPatient:
            return "PUT"
        }
    }
    
    private var httpBody: [String: Any] {
        switch self {
        case let .setPatient(_, firstName, lastName, dob, sex, primaryPhysician, caregiverPractice, _):
            let dictionary: [String: Any] = [
                "first_name"        : firstName,
                "last_name"         : lastName,
                "dob"               : dob,
                "sex"               : sex,
                "primary_physician" : primaryPhysician,
                "caregiver_practice": caregiverPractice
            ]
            return dictionary
        default:
                return [:]
        }
    }
    
    private var urlQueryItems : [URLQueryItem] {
        switch self {
        case let .getAuth(user, pass, grantType, _, _):
            return [
                URLQueryItem(name: "grant_type", value: grantType),
                URLQueryItem(name: "username", value: user),
                URLQueryItem(name: "password", value: pass)
            ]
        case let .getPatients(firstName, lastName, dob, _, limit, offset):
            var limitString = "", offsetString = ""
            if let limit = limit {
                limitString = String(describing:limit)
            }
            if let offset = offset {
                offsetString = String(describing:offset)
            }
            return [
                URLQueryItem(name: "first_name", value: firstName ?? ""),
                URLQueryItem(name: "last_name", value: lastName ?? ""),
                URLQueryItem(name: "dob", value: dob ?? ""),
                URLQueryItem(name: "limit", value: limitString),
                URLQueryItem(name: "offset", value: offsetString)
            ]
        default:
            return []
        }
    }
    
    private var authorization: String {
        switch self {
        case let .getAuth(_, _, _, clientID, clientSecret):
            let loginString = String(format: "%@:%@", clientID, clientSecret)
            let loginData = loginString.data(using: String.Encoding.utf8)!
            let base64LoginString = loginData.base64EncodedString()
            return "Basic \(base64LoginString)"
        case let .getPatients(_, _, _, token, _, _), let .setPatient(_, _, _, _, _, _, _, token), let .getAllergy(_, token), let .getProblem(_, token):
            return "Bearer \(token)"
        }
    }
    
    private var contentType: String {
        switch self {
        case .getPatients:
            return "application/x-www-form-urlencoded"
        case .setPatient:
            return "application/json"
        default:
            return ""
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let components = NSURLComponents(string: "\(url)\(path)")!
        components.queryItems = urlQueryItems
        var request = URLRequest(url: components.url!)
        request.httpMethod = method
        switch self {
        case .setPatient:
            let jsonData = try? JSONSerialization.data(withJSONObject: httpBody)
            request.httpBody = jsonData
            break
        default:
            break
        }
        request.addValue(authorization, forHTTPHeaderField: "Authorization")
        request.addValue(contentType, forHTTPHeaderField: "Content-Type")
        return request
    }
    
    public var urlRequest: URLRequest? { return try? asURLRequest() }
}
