//
//  MovieList.swift
//  TaskAppGain
//
//  Created by Zaghloul on 24/01/2023.
//

import Foundation

import Foundation

// MARK: - ListMovies
struct MovieList: Codable {
    let page: Int?
    let results: [MovieListModel]?
    let totalPages, totalResults: Int?
}

// MARK: - MovieListModel
struct MovieListModel: Codable {
    let id: Int?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, title: String?
    let voteAverage: Double?
    let voteCount: Int?
    let releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case releaseDate = "release_date"
    }
}
