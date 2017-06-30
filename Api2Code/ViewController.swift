//
//  ViewController.swift
//  Api2Code
//
//  Created by Alejos on 6/27/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var token: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AuthService.getAuth(username: "testdoctor1@elationemr.com",
                            password: "password",
                            grantType: "password",
                            clientID: "S1rKvfolMITXXTgrijCEEZFP1Ooe5ifZ9oXSIs9C",
                            clientSecret: "fTrAAkeX4PqvJMzySpvmI0dLDhz2WcT3AN0iGPOQTP2Jt8gsMIUN3w0ldQFy2QhTze1pIulAagLajJo5g8QpfP3lZ0C0hVsRymq0nh3G8xxMFm65Ra2ss2pSW1PtNTDp") { token, error in
            if let token = token {
                self.token = token
                self.testOtherEndpoints()
            } else {
                //Handle error
            }
        }
    }
    
    func testOtherEndpoints() {
        PatientService.getPatients(firstName: "Pagination",
                                   lastName: "Test",
                                   dob: "1975-03-20",
                                   token: token) { patients, error in
            if let patients = patients {
                for patient in patients {
                    print(patient.firstName)
                }
            }
        }
        PatientService.setPatient(patientID: 54233202689,
                                  firstName: "test",
                                  lastName: "patient",
                                  dob: "1955-10-01",
                                  sex: "Female",
                                  primaryPhysician: 720898,
                                  caregiverPractice: 65540,
                                  token: token) { patient, error in
            if let patient = patient {
                print(patient.firstName)
            }
        }
        PatientService.getPatients(limit: 20,
                                   offset: 0,
                                   token: token) { patients, error in
            if let patients = patients {
                print(patients.count)
            }
        }
        
        AllergyService.getAllergy(allergyID: 67367534633,
                                  token: token) { allergy, error in
            if let allergy = allergy {
                print(allergy.name)
            }
        }
        
        ProblemService.getProblem(problemID: 350421035,
                                  token: token) { problem, error in
            if let problem = problem {
                print(problem.description)
            }
            
        }
    }

}

