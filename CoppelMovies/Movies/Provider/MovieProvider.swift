//
//  ProviderMovie.swift
//  CoppelMovies
//
//  Created by Jesus Muñoz on 27/01/23.
//

import Foundation

protocol MoviesProviderProtocol {
    func getPopularMovies() async throws -> PopularMoviesListModel
    func getTopRated() async throws -> TopMoviesListModel
    func getnowPlaying() async throws -> NowPlayingMoviesListModel
    func getUpcoming() async throws -> UpcomingMoviesListModel
}

class MoviesProvider : MoviesProviderProtocol {
    
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
    func getTopRated() async throws -> TopMoviesListModel {
        let requestModel = RequestModel(endpoint: .topRatedMovies)
        do{
            let model = try await ServiceLayer.callService(requestModel, TopMoviesListModel.self)
            return model
        }catch{
            print(error)
            throw error
        }
    }
    func getnowPlaying() async throws -> NowPlayingMoviesListModel {
        let requestModel = RequestModel(endpoint: .nowPlaying)
        do{
            let model = try await ServiceLayer.callService(requestModel, NowPlayingMoviesListModel.self)
            return model
        }catch{
            print(error)
            throw error
        }
    }
    func getUpcoming() async throws -> UpcomingMoviesListModel {
        let requestModel = RequestModel(endpoint: .upcoming)
        do{
            let model = try await ServiceLayer.callService(requestModel, UpcomingMoviesListModel.self)
            return model
        }catch{
            print(error)
            throw error
        }
    }
}

