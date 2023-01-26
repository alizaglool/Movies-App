//
//  MoviesDetailsVC.swift
//  TaskAppGain
//
//  Created by Zaghloul on 25/01/2023.
//

import UIKit

class MoviesDetailsVC: UIViewController{
    //MARK: - OUTLETS
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var MovieDetailsDescription: UILabel!
    @IBOutlet weak var movieDetailsName: UILabel!
    @IBOutlet weak var movieDetailsDate: UILabel!
    @IBOutlet weak var movieDetailsImage: UIImageView!
    //MARK: - VARABLE
    var presenter: MoviesDetailsType
    //MARK: INIT
    init?(coder: NSCoder, presenter: MoviesDetailsType) {
        self.presenter = presenter
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getDetailsMovieFromURL()
        presenter.viewControllerType = self
        navigationItem.largeTitleDisplayMode = .never
    }
}
