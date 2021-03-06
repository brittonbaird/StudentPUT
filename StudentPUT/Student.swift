//
//  Student.swift
//  StudentPUT
//
//  Created by Britton Baird on 8/2/17.
//  Copyright © 2017 Britton Baird. All rights reserved.
//

import Foundation

struct Student {
    
    let name: String
    
    
}

extension Student {
    
    private static var nameKey: String { return "name"}
    
    init?(dictionary: [String: Any]) {
        guard let name = dictionary[Student.nameKey] as? String else { return nil }
        self.init(name: name)
    }
    
    var dictionaryRepresentation: [String: Any] {
        return [Student.nameKey: name]
    }
    
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
    }
}
