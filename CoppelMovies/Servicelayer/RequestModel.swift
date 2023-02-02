//
//  RequestModel.swift
//  CoppelMovies
//
//  Created by Jesus Muñoz on 27/01/23.
//

import Foundation
struct RequestModel {
    let endpoint: Endpoints
    var queryItems: [String:String]?
    var httpMethod: HttpMethod = .GET
    var baseURL: URLBase = .movieDatabase

    func getURL()->String{
        return baseURL.rawValue + endpoint.rawValue
    }

    enum HttpMethod : String {
        case GET
        case POST
    }

    enum Endpoints : String {
        case login = "authentication/token/validate_with_login"
        case requestToken = "authentication/token/new"
        case popularMovies = "/movie/popular"
        case topRatedMovies = "/movie/top_rated"
        case nowPlaying = "/movie/now_playing"
        case upcoming = "/movie/upcoming"
        
    }

    enum URLBase : String {
        case movieDatabase = "https://api.themoviedb.org/3/"
    }
}
