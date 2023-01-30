//
//  PopMovies.swift
//  CoppelMovies
//
//  Created by Jesus Muñoz on 27/01/23.
//

import Foundation

// MARK: - PopularMoviesListModel
struct PopularMoviesListModel: Decodable {
    let page: Int
    let results: [PopularMovieModel] // Refresh List
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
