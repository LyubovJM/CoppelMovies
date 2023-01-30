//
//  TextFieldsProperties.swift
//  CoppelMovies
//
//  Created by Jesus Muñoz on 27/01/23.
//

import Foundation
import UIKit

extension UITextField {
    
    func isNotBlank() -> Bool {
        
        ((text?.isEmpty) != nil) ? text!.count > 0 : false
       
    }
    
}
