//
//  ViewController+alertController.swift
//  Sunny
//
//  Created by Ivan Akulov on 25/02/2020.
//  Copyright © 2020 Ivan Akulov. All rights reserved.
//

import UIKit

extension ViewController {
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addTextField { tf in
            let cities = ["San Francisco", "Moscow", "New York", "Stambul", "Viena"]
            tf.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = alert.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                print("search info for the \(cityName)")
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(search)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}
