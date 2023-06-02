//
//  ViewController.swift
//  Prevent Screenshot POC
//
//  Created by Ramy Sabry on 10/09/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.makeSecure()
    }
}

extension UIView {
    func makeSecure() {
        DispatchQueue.main.async { [self] in
            let textfield = UITextField()
            textfield.isSecureTextEntry = true
            addSubview(textfield)
            textfield.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            textfield.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            layer.superlayer?.addSublayer(textfield.layer)
            textfield.layer.sublayers?.first?.addSublayer(layer)
        }
    }
}
