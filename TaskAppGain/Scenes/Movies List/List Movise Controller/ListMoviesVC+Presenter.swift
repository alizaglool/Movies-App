//
//  ListMoviesVC+Presenter.swift
//  TaskAppGain
//
//  Created by Zaghloul on 24/01/2023.
//

import Foundation
import UIKit

extension ListMoviesVC: MoviesView {
    // MARK: - Functions Movies Protocol
    func showIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        }    }
    
    func hideIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
    
    func fetchingDataSuccess() {
        moviseTableView.reloadData()
    }
    
    func showError(error: String) {
        print(error)
    }
    
    func navigateToMoviesDetailsScreen(movie: MovieListModel) {
        let detailPresenter = MoviesDelailsVCPresenter(movieId: movie.id ?? 0)
        let detailsViewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "MoviesDetailsVC", creator: { coder -> MoviesDetailsVC? in
            MoviesDetailsVC(coder: coder, presenter: detailPresenter)
        })
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
