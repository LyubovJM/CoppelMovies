//
//  LongInPresenter.swift
//  CoppelMovies
//
//  Created by Jesus Muñoz on 27/01/23.
//

import Foundation

struct LoginStatus{
    let status:Bool
    let message:String
}

 @MainActor class LoginPresenter {
     var provider: LoginProvider
     init(provider: LoginProvider = LoginProvider()) {
         self.provider = provider
     }

     
     func login(username:String, password:String) async -> LoginStatus{
         do{
             let newToken = try await provider.getNewRequestToken()
             if newToken.success {
                 let login = try await provider.login(username: username, password: password, requestToken: newToken.requestToken!)
                 return LoginStatus(status: login.success, message: login.statusMessage ?? "")
             }else
             {
                 return LoginStatus(status: false, message: "Data error: invalid credentials.")
             }

         }catch
         {
             return LoginStatus(status: false, message: "unknown error, try again later")
         }
     }
 }



