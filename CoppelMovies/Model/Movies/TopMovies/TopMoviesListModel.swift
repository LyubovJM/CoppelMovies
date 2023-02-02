//
//  TopMoviesListModel.swift
//  CoppelMovies
//
//  Created by Jesus Muñoz on 01/02/23.
//

import Foundation


struct TopMoviesListModel: Decodable {
    let page: Int
    let results: [TopMovieModel]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
