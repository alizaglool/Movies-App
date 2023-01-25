//
//  ListMovieDetails.swift
//  TaskAppGain
//
//  Created by Zaghloul on 25/01/2023.
//

import Foundation

// MARK: - ListMovieDetails
struct ListMovieDetails: Codable {
    let id: Int?
    let originalTitle, overview: String?
    let posterPath: String?
    let releaseDate: String?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }
}

