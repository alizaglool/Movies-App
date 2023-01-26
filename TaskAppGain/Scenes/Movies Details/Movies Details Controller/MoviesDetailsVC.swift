//
//  MoviesDetailsVC.swift
//  TaskAppGain
//
//  Created by Zaghloul on 25/01/2023.
//

import UIKit

class MoviesDetailsVC: UIViewController{
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var MovieDetailsDescription: UILabel!
    @IBOutlet weak var movieDetailsName: UILabel!
    @IBOutlet weak var movieDetailsDate: UILabel!
    @IBOutlet weak var movieDetailsImage: UIImageView!
    
    var presenter: MoviesDelailsVCPresenter!
    var movieDetailsId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MoviesDelailsVCPresenter(view: self, movieId: movieDetailsId ?? 0)
        presenter.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
}
