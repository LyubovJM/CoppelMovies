//
//  LoginResponse.swift
//  CoppelMovies
//
//  Created by Jesus Muñoz on 27/01/23.
//

import Foundation
struct LoginResponse: Decodable {
    let success: Bool
    let expiresAt, requestToken: String?
    
    //respuestas de error
    let statusCode:Int?
    let statusMessage:String?

    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
        
        //respuestas de error
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}
