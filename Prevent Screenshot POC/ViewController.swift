//
//  ViewController.swift
//  Prevent Screenshot POC
//
//  Created by Ramy Sabry on 10/09/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userNameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.makeSecure()
    }
}

extension UIView {
    func makeSecure() {
        DispatchQueue.main.async {
            let field = UITextField()
            field.isSecureTextEntry = true
            self.addSubview(field)
            field.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            field.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            self.layer.superlayer?.addSublayer(field.layer)
            field.layer.sublayers?.first?.addSublayer(self.layer)
        }
    }
}
