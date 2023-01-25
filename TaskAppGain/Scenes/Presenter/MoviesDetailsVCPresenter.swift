//
//  MoviesDetailsVCPresenter.swift
//  TaskAppGain
//
//  Created by Zaghloul on 25/01/2023.
//

import UIKit

protocol MoviesDelailsView: AnyObject {
    
    func showIndicator()
    func hideIndicator()
    func updateDataToUI(title: String, date: String, description: String, image: String)
    
}

class MoviesDelailsVCPresenter {

    private weak var view: MoviesDelailsView?
    private var interactor = MoviesInteractor()
    private var movieDetails: ListMovieDetails?
    var movieId: Int
    init(view: MoviesDelailsView, movieId: Int){
        self.view = view
        self.movieId = movieId
    }
    
    func viewDidLoad(){
        getDetailsMovie()
    }
    
    func getDetailsMovie(){
        view?.showIndicator()
        interactor.fetchDate(url: .movie(id: movieId ?? 0), complation: { [weak self ] (detailsMovie: ListMovieDetails?, error) in
            guard let self = self else {return}
            self.view?.hideIndicator()
            if let error = error {
                print(error.localizedDescription)
            } else {
                if let detailsMovie = detailsMovie {
                    self.movieDetails = detailsMovie
                    if let movieDetails = self.movieDetails {
                        DispatchQueue.main.async {
                            self.movieDetailsUpdata(movie: movieDetails )
                        }
                    }
                }
            }
        })
    }
    
    func movieDetailsUpdata(movie: ListMovieDetails){
        let title = movie.title ?? ""
        let date = movie.releaseDate ?? ""
        let description = movie.overview ?? ""
        let image = movie.posterPath ?? ""
        view?.updateDataToUI(title: title, date: date, description: description, image: image)
    }
    
}
