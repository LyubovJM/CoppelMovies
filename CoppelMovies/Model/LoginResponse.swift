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
    
    let statusCode:Int?
    let statusMessage:String?

    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
        

        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}
