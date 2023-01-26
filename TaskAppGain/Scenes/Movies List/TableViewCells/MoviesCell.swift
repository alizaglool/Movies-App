//
//  MoviesCell.swift
//  TaskAppGain
//
//  Created by Zaghloul on 24/01/2023.
//

import UIKit

class MoviesCell: UITableViewCell, MoviesCellView {
    // MARK: - OUTLETS
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieName: UILabel!
    @IBOutlet private weak var movieDescription: UILabel!
    // MARK: - LIFECYLE
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    // MARK: - Function Update Cell
    func displayMoviesName(name: String) {
        movieName.text = name
    }
    
    func displayMoviesImage(image: String) {
        movieImage.loadImageFromURL(urlPath: image)
    }
    
    func displayMoviesDescription(description: String) {
        movieDescription.text = description
    }
    
}
