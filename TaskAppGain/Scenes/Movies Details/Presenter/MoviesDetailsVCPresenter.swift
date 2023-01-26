//
//  MoviesDetailsVCPresenter.swift
//  TaskAppGain
//
//  Created by Zaghloul on 25/01/2023.
//

import UIKit

//MARK: - Protocol Controller
protocol MoviesDelailsViewControllerType: AnyObject {
    
    func showIndicator()
    func hideIndicator()
    func updateDataToUI(title: String, date: String, description: String, image: String)
    
}
//MARK: - Protocol Presenter
protocol MoviesDetailsType: AnyObject {
    
    var viewControllerType: MoviesDelailsViewControllerType? {get set}
    func getDetailsMovieFromURL()
    func updateMovieDetails(movie: MovieModel)
}
//MARK: - Presenter Movies Delails
class MoviesDelailsVCPresenter: MoviesDetailsType {
    
    //MARK: VARIABLE
    weak var viewControllerType: MoviesDelailsViewControllerType?
    private var interactor = MoviesInteractor()
    private var movie: MovieModel?
    var movieId: Int
    //MARK: INIT
    init(movieId: Int){
        self.movieId = movieId
    }
    //MARK: - Functions
    func getDetailsMovieFromURL(){
        viewControllerType?.showIndicator()
        interactor.fetchDate(url: .movie(id: movieId ), complation: { [weak self ] (detailsMovie: MovieModel?, error) in
            guard let self = self else {return}
            self.viewControllerType?.hideIndicator()
            if let error = error {
                print(error.localizedDescription)
            } else {
                if let detailsMovie = detailsMovie {
                    self.movie = detailsMovie
                    if let movieDetails = self.movie {
                        DispatchQueue.main.async {
                            self.updateMovieDetails(movie: movieDetails )
                        }
                    }
                }
            }
        })
    }
    
    func updateMovieDetails(movie: MovieModel){
        let title = movie.title ?? ""
        let date = movie.releaseDate ?? ""
        let description = movie.overview ?? ""
        let image = movie.posterPath ?? ""
        viewControllerType?.updateDataToUI(title: title, date: date, description: description, image: image)
    }
    
}
