//
//  OnTVMoviesListModel.swift
//  CoppelMovies
//
//  Created by Jesus Muñoz on 01/02/23.
//

import Foundation


struct NowPlayingMoviesListModel: Decodable {
    let page: Int
    let results: [NowPlayingMovieModel]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
