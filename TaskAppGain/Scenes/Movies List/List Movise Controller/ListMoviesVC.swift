//
//  ListMoviseVC.swift
//  TaskAppGain
//
//  Created by Zaghloul on 24/01/2023.
//

import UIKit

class ListMoviesVC: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var moviseTableView: UITableView!
    
    var presenter: ListMoviesVCPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter = ListMoviesVCPresenter(view: self)
        presenter.viewDidLoad()
    }
     
}

 
