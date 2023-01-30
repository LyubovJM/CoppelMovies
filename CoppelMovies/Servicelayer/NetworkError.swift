//
//  NetworkError.swift
//  CoppelMovies
//
//  Created by Jesus Muñoz on 27/01/23.
//

import Foundation
 enum NetworkError: String, Error{
     case invalidURL
     case serializationFailed
     case generic
     case couldNotDecodeData
     case httpResponseError
     case statusCodeError
     case jsonDecoder
     case unauthorized
 }

 extension NetworkError : LocalizedError{
     public var errorDescription: String?{
         switch self{
         case .invalidURL:
             return NSLocalizedString("Invalid URL", comment: "")
         case .serializationFailed:
             return NSLocalizedString("Failed serialized the body request", comment: "")
         case .generic:
             return NSLocalizedString("404: Error Unknow, check for valid API-Key", comment: "")
         case .couldNotDecodeData:
             return NSLocalizedString("Decode Fail", comment: "")
         case .httpResponseError:
             return NSLocalizedString("Can't obtain HTTPURLResponse", comment: "")
         case .statusCodeError:
             return NSLocalizedString("invalid status code, need to be 200", comment: "")
         case .jsonDecoder:
             return NSLocalizedString("JSON invalid decode", comment: "")
         case .unauthorized:
             return NSLocalizedString("Session Finalized, log in again", comment: "")
         }
     }
 }
