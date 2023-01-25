//
//  ListMoviesVC+Presenter.swift
//  TaskAppGain
//
//  Created by Zaghloul on 24/01/2023.
//

import Foundation

extension ListMoviesVC: MoviesView {
    
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
        if let vc = storyboard?.instantiateViewController(withIdentifier: "MoviesDetailsVC") as? MoviesDetailsVC {
            vc.movieDetailsId = movie.id ?? 0
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
