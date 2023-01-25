//
//  UIImage + URLString.swift
//  TaskAppGain
//
//  Created by Zaghloul on 24/01/2023.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImageFromURl(urlPath: String){
        
        let urlString = ServiesAPI.instance.imageURLBased + urlPath
        print(urlString)
        guard let url = URL(string: urlString) else {return}
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    self.image = image
                }
            }
    }
}
