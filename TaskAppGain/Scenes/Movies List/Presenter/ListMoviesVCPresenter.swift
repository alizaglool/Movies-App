//
//  ListMoviesVCPresenter.swift
//  TaskAppGain
//
//  Created by Zaghloul on 24/01/2023.
//

import UIKit

protocol MoviesView: AnyObject{
    //
    func fetchingDataSuccess()
    func showError(error: String)
    func showIndicator()
    func hideIndicator()
    func navigateToMoviesDetailsScreen(movie: MovieListModel)
}

protocol MoviesCellView {
    //
    func displayMoviesName(name: String)
    func displayMoviesImage(image: String)
    func displayMoviesDescription(description: String)
}
// MARK: - Movies List Presenter
class ListMoviesVCPresenter {
    // MARK: - VARABLE
    private weak var viewController: MoviesView?
    private let interactor = MoviesInteractor()
    private var movies: [MovieListModel] = []
    // MARK: - INIT
    init(view: MoviesView){
        self.viewController = view
    }
    // MARK: - Funtions
    func getListMoviesFromURL(){
        viewController?.showIndicator()
        interactor.fetchDate(url: .popular, complation: { [weak self] (moviesList: MovieList?, error) in
            guard let self = self else {return}
            self.viewController?.hideIndicator()
            if let error = error {
                self.viewController?.showError(error: error.localizedDescription )
            } else {
                guard let moviesList = moviesList else {return}
                self.movies = moviesList.results ?? []
                DispatchQueue.main.async {
                    self.viewController?.fetchingDataSuccess()
                }
            }
        })
    }
    
    func getMoviesCount() -> Int {
        return movies.count
    }
    
    func configureCell(cell: MoviesCellView, for index: Int) {
        let moviesList = movies[index]
        cell.displayMoviesName(name: moviesList.title ?? "")
        cell.displayMoviesImage(image: moviesList.posterPath ?? "")
        cell.displayMoviesDescription(description: moviesList.overview ?? "")
    }
    
    func didSelectRow(index: Int) {
        let moviesList = movies[index]
        viewController?.navigateToMoviesDetailsScreen(movie: moviesList)
    }
}
