//
//  StudentController.swift
//  StudentPUT
//
//  Created by Britton Baird on 8/2/17.
//  Copyright © 2017 Britton Baird. All rights reserved.
//

import Foundation

class StudentController {
    
    // Data Source
    static var students: [Student] = []
    
    // Base URL
    static let baseURL = URL(string: "https://survey-ios14.firebaseio.com/students")
    
    // Fetch Students
    static func fetchStudents(completion: @escaping () -> Void) {
        
        // Build URL 
        guard let url = baseURL?.appendingPathExtension("json") else { completion(); return }
        
        // Build a request
        var request = URLRequest(url: url)
        // Set the properties for request
        request.httpMethod = "GET"
        request.httpBody = nil
        
        // Create and resume a DataTask
        let dataTask = URLSession.shared.dataTask(with: request) { data, _, error in
            
            if let error = error {
                NSLog("There was an error: \(error.localizedDescription)")
                completion()
                return
            }
            
            guard let data = data else {
                NSLog("No data returned for the dataTask")
                completion()
                return
            }
            
            // Serialize(parse) the JSON
            guard let studentsDictionary = (try? JSONSerialization.jsonObject(with: data, options: [.allowFragments])) as? [String: [String: String]] else {
                NSLog("Unable to serialize JSON")
                completion()
                return
            }
            
            
            students = studentsDictionary.flatMap { Student(dictionary: $0.value) }
            
            // call our completion when the task is complete
            completion()
            
        }
        dataTask.resume()
        
    }
    
    // Post Students
    
    
    
}













