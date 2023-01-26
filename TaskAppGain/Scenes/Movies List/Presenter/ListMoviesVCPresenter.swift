//
//  ListMoviesVCPresenter.swift
//  TaskAppGain
//
//  Created by Zaghloul on 24/01/2023.
//

import UIKit

protocol MoviesView: AnyObject{
    
    func fetchingDataSuccess()
    func showError(error: String)
    func showIndicator()
    func hideIndicator()
    func navigateToMoviesDetailsScreen(movie: MovieListModel)
}

protocol MoviesCellView {
    
    func displayMoviesName(name: String)
    func displayMoviesImage(image: String)
    func displayMoviesDescription(description: String)
}

class ListMoviesVCPresenter {
    
    private weak var view: MoviesView?
    private let interactor = MoviesInteractor()
    private var movies: [MovieListModel] = []
    
    init(view: MoviesView){
        self.view = view
    }
    
    func viewDidLoad(){
        getListMovies()
    }
    
    func getListMovies(){
        view?.showIndicator()
        interactor.fetchDate(url: .popular, complation: { [weak self] (moviesList: MovieList?, error) in
            guard let self = self else {return}
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription )
            } else {
                guard let moviesList = moviesList else {return}
                self.movies = moviesList.results ?? []
                DispatchQueue.main.async {
                    self.view?.fetchingDataSuccess()
                }
            }
        })
    }
    
    func getMoviesCount() -> Int {
        return movies.count
    }
    
    func configure(cell: MoviesCellView, for index: Int) {
        let moviesList = movies[index]
        cell.displayMoviesName(name: moviesList.title ?? "")
        cell.displayMoviesImage(image: moviesList.posterPath ?? "")
        cell.displayMoviesDescription(description: moviesList.overview ?? "")
    }
    
    func didSelectRow(index: Int) {
        let moviesList = movies[index]
        view?.navigateToMoviesDetailsScreen(movie: moviesList)
    }
}
