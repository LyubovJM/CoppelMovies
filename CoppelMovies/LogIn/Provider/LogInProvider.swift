//
//  Provider.swift
//  CoppelMovies
//
//  Created by Jesus Muñoz on 27/01/23.
//

import Foundation

 protocol LoginProviderProtocol {
     func getNewRequestToken() async throws -> NewTokenResponse
     func login(username: String, password: String, requestToken: String) async throws -> LoginResponse
 }

 class LoginProvider : LoginProviderProtocol {

     func getNewRequestToken() async throws -> NewTokenResponse {
 
         let requestModel = RequestModel(endpoint: .requestToken)
         do{
             let model = try await ServiceLayer.callService(requestModel, NewTokenResponse.self)
             return model
         }catch{
             print(error)
             throw error
         }
     }

     func login(username: String, password: String, requestToken: String) async throws -> LoginResponse {
 
         let queryParams : [String:String] = ["username": username, "password": password, "request_token": requestToken]
         let requestModel = RequestModel(endpoint: .login, queryItems: queryParams, httpMethod: .POST)

         do{
             let model = try await ServiceLayer.callService(requestModel, LoginResponse.self)
             return model
         }catch{
             print("hubo un error: \(error.localizedDescription)")
             throw error
         }
     }


 }
