//
//  Alert.swift
//  TaskAppGain
//
//  Created by Zaghloul on 27/01/2023.
//

import UIKit

struct Alert {
    static func showAlert(vc: UIViewController,title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        vc.present(alert, animated: true, completion: nil)
    }
}
