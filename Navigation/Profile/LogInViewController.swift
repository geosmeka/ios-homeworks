//
//  LogInViewController.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 18.03.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    var logInView : LogInView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        logInView = LogInView ()
        
        logInView?.logIn = {
            let profileViewController = ProfileViewController.getFromNib()
            self.navigationController?.pushViewController(profileViewController, animated: true)
        }
        
        guard let logInView = logInView else {
            return
        }

        logInView.backgroundColor = .systemMint
        view.addSubview(logInView)
        
        logInView.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint = logInView.heightAnchor.constraint(equalToConstant: 600)
        
        let centerXConstraint = logInView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        let centerYConstraint = logInView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        let widthConstraint = logInView.widthAnchor.constraint(equalTo: view.widthAnchor)

        /*
        NSLayoutConstraint.init(item: logInView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: logInView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: logInView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: logInView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0).isActive = true
        */
        
        NSLayoutConstraint.activate([heightConstraint, centerXConstraint, centerYConstraint, widthConstraint])
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tap)))
    }
    
    @objc func tap () {
        print(#function)
        view.endEditing(true)
    }
    
    @objc func keyBoardWillShow (notification: NSNotification) {
        print(#function)
        
        guard let keyboardFrameValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
            logInView?.scrollView?.setContentOffset(CGPoint(x: 0, y: keyboardFrameValue.cgRectValue.height), animated: true)
            //logInView?.scrollView?.setContentOffset(CGPoint.init(x: 0, y: 200), animated: true)
    }
    
    @objc func keyBoardWillHide () {
        print(#function)
        logInView?.scrollView?.setContentOffset(.zero, animated: true)
    }}
