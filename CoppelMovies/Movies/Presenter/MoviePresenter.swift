//
//  MoviePresenter.swift
//  CoppelMovies
//
//  Created by Jesus Muñoz on 27/01/23.
//

import Foundation
@MainActor class MoviesPresenter {
    
    var provider: MoviesProvider
    
    
    init(provider: MoviesProvider = MoviesProvider()) {
        self.provider = provider
    }
    
    func popularMovies() async -> [CardMovieModel] {
        var moviesArray: [CardMovieModel] = []
        
        do{
            let movies = try await provider.getPopularMovies()
            
            if movies.results.count > 0 {
                
                for result in movies.results {
                    let movie = CardMovieModel(id: result.id, url: result.posterPath, title: result.title, date: result.releaseDate, rating: "\(result.voteAverage)", description: result.overview)
                    moviesArray.append(movie)
                }
                
                return moviesArray
            }
            
            return moviesArray
            
        }catch{
            print(error.localizedDescription)
            return moviesArray
        }
        
    }
    func topMovies() async -> [CardMovieModel] {
        var moviesArray: [CardMovieModel] = []
        
        do{
            let movies = try await provider.getTopRated()
            
            if movies.results.count > 0 {
                
                for result in movies.results {
                    let movie = CardMovieModel(id: result.id, url: result.posterPath, title: result.title, date: result.releaseDate, rating: "\(result.voteAverage)", description: result.overview)
                    moviesArray.append(movie)
                }
                
                return moviesArray
            }
            
            return moviesArray
            
        }catch{
            print(error.localizedDescription)
            return moviesArray
        }
        
    }
    func nowPlaying() async -> [CardMovieModel] {
        var moviesArray: [CardMovieModel] = []
        
        do{
            let movies = try await provider.getnowPlaying()
            
            if movies.results.count > 0 {
                
                for result in movies.results {
                    let movie = CardMovieModel(id: result.id, url: result.posterPath, title: result.title, date: result.releaseDate, rating: "\(result.voteAverage)", description: result.overview)
                    moviesArray.append(movie)
                }
                
                return moviesArray
            }
            
            return moviesArray
            
        }catch{
            print(error.localizedDescription)
            return moviesArray
        }
        
    }
    func upcoming() async -> [CardMovieModel] {
        var moviesArray: [CardMovieModel] = []
        
        do{
            let movies = try await provider.getUpcoming()
            
            if movies.results.count > 0 {
                
                for result in movies.results {
                    let movie = CardMovieModel(id: result.id, url: result.posterPath, title: result.title, date: result.releaseDate, rating: "\(result.voteAverage)", description: result.overview)
                    moviesArray.append(movie)
                }
                
                return moviesArray
            }
            
            return moviesArray
            
        }catch{
            print(error.localizedDescription)
            return moviesArray
        }
        
    }
}
