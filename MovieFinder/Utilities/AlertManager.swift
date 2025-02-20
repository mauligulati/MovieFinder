//
//  AlertManager.swift
//  MovieFinder
//
//  Created by Mauli Gulati on 19/2/25.
//

import Foundation
import UIKit

class AlertManager {
    
    static func showAlert(on viewController: UIViewController,
                          title: String,
                          message: String,
                          actionTitle: String,
                          actionStyle: UIAlertAction.Style = .default,
                          handler: ((UIAlertAction) -> Void)? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: actionStyle, handler: handler)
        alertController.addAction(action)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
