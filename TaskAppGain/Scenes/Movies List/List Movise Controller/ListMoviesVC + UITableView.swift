//
//  ListMoviseVC + UITableView.swift
//  TaskAppGain
//
//  Created by Zaghloul on 24/01/2023.
//

import UIKit

extension ListMoviesVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView(){
        moviseTableView.delegate = self
        moviseTableView.dataSource = self
        moviseTableView.register(UINib(nibName: "MoviesCell", bundle: nil), forCellReuseIdentifier: "MoviesCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getMoviesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesCell", for: indexPath) as! MoviesCell
        presenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(index: indexPath.row)
    }
}
