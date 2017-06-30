//
//  ProblemRepository.swift
//  Api2Code
//
//  Created by Alejos on 6/30/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation

class ProblemRepository {
    static func getProblem(problemID: Int, token: String, completionHandler: @escaping ([String: Any]?, Error?) -> Void) {
        let request = RequestRouting.getProblem(problemID: problemID, token: token).urlRequest!
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
