//
//  UIImage + URLSession.swift
//  TaskAppGain
//
//  Created by Zaghloul on 24/01/2023.
//

import UIKit

extension UIImageView {
    
    func loadImageFromURL(urlPath: String){
        
        let urlString = "https://image.tmdb.org/t/p/w500" + urlPath
//        print(urlString)
        guard let url = URL(string: urlString) else {return}
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    self.image = image
                }
            }
    }
}
