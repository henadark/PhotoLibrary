//
//  Error+Conversion.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation

extension Error {
    
    var applicationError: ApplicationError? {
        return self as? ApplicationError
    }
    
    var nsError: NSError? {
        return self as NSError?
    }
    
}
