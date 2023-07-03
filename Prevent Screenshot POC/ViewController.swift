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
        // Wrap the view inside a secured UITextfield.
        view.makeSecure()
        
        listenForScreenRecordingNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func listenForScreenRecordingNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(screenCaptureDidChange),
            name: UIScreen.capturedDidChangeNotification,
            object: nil
        )
    }
    
    @objc
    private func screenCaptureDidChange() {
        debugPrint("screenCaptureDidChange.. isCapturing: \(UIScreen.main.isCaptured)")
        
        if UIScreen.main.isCaptured {
            // They started capturing..
            view.isHidden = true
        } else {
            // They stopped capturing..
            view.isHidden = false
        }
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
