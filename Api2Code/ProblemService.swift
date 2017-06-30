//
//  ProblemService.swift
//  Api2Code
//
//  Created by Alejos on 6/30/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation

class ProblemService {
    static func getProblem(problemID: Int, token: String, completionHandler: @escaping (Problem?, Error?) -> Void) {
        ProblemRepository.getProblem(problemID: problemID, token: token) { dictionary, error in
            if let dictionary = dictionary {
                completionHandler(Problem(dictionary), nil)
            } else {
                completionHandler(nil, error)
            }
        }
    }
}
