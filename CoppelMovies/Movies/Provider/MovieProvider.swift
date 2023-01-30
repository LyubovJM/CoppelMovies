//
//  ProviderMovie.swift
//  CoppelMovies
//
//  Created by Jesus Muñoz on 27/01/23.
//

import Foundation

protocol MoviesProviderProtocol {
    func getPopularMovies() async throws -> PopularMoviesListModel
    func getTopRated()
    func getOnTV()
    func airingToday()
}

class MoviesProvider : MoviesProviderProtocol {
    func getTopRated() {
        print("soon")
    }
    /*func getTopRated() async throws -> TopRatedMoviesModel {
        let requestModel = RequestModel(endpoint: .topRatedMovies)
        do{
            let model = try await ServiceLayer.callService(requestModel, TopRatedMoviesModel.self)
            return model
        }catch{
            print(error)
            throw error
        }
    }*/
    
    func getPopularMovies() async throws -> PopularMoviesListModel {
        let requestModel = RequestModel(endpoint: .popularMovies)
        do{
            let model = try await ServiceLayer.callService(requestModel, PopularMoviesListModel.self)
            return model
        }catch{
            print(error)
            throw error
        }
    }
    
    func getOnTV() {
        print("soon")
    }
    
    func airingToday() {
        print("soon")
    }
    
    
}
