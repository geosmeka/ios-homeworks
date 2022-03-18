//
//  LogInView.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 18.03.2022.
//

import UIKit

class LogInView: UIView {

    var scrollView : UIScrollView?
    var logIn : (() -> Void)?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        scrollView = UIScrollView ()
        guard let scrollView = scrollView else {
            return
        }

        scrollView.backgroundColor = .purple
        scrollView.contentSize = frame.size
        addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.init(item: scrollView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: scrollView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: scrollView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: scrollView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0).isActive = true
        
        let contentView = UIView ()
        contentView.backgroundColor = .systemTeal
        scrollView.addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.init(item: contentView, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: contentView, attribute: .centerY, relatedBy: .equal, toItem: scrollView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: contentView, attribute: .width, relatedBy: .equal, toItem: scrollView, attribute: .width, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: contentView, attribute: .height, relatedBy: .equal, toItem: scrollView, attribute: .height, multiplier: 1, constant: 0).isActive = true
        
        let logoView = UIImageView(image: UIImage(named: "Logo"))
        contentView.addSubview(logoView)
        
        logoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.init(item: logoView, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item:logoView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 120).isActive = true
        
        NSLayoutConstraint.init(item: logoView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100).isActive = true
        
        NSLayoutConstraint.init(item: logoView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100).isActive = true
        
        let stackView = UIStackView ()
        stackView.axis = .vertical
        
        let eMailTextField = UITextField ()
        let passWordTextField = UITextField ()
        
        passWordTextField.isSecureTextEntry = true
        passWordTextField.backgroundColor = .systemGray6
        eMailTextField.backgroundColor = .systemGray6
        
        eMailTextField.placeholder = "Email or phone"
        passWordTextField.placeholder = "Password"
        
        eMailTextField.font = .systemFont(ofSize: 16)
        passWordTextField.font = .systemFont(ofSize: 16)
        
        eMailTextField.textColor = UIColor.init(named: "AccentColor")
        passWordTextField.textColor = UIColor.init(named: "AccentColor")
        
        eMailTextField.autocapitalizationType = .none
        passWordTextField.autocapitalizationType = .none
        
        stackView.addArrangedSubview(eMailTextField)
        stackView.addArrangedSubview(passWordTextField)
        
        stackView.layer.cornerRadius = 10
        stackView.layer.masksToBounds = true
        
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        contentView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.init(item: eMailTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true
        
        NSLayoutConstraint.init(item: passWordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true
        
        NSLayoutConstraint.init(item: stackView, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: stackView, attribute: .top, relatedBy: .equal, toItem: logoView, attribute: .bottom, multiplier: 1, constant: 120).isActive = true
        
        NSLayoutConstraint.init(item: stackView, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 16).isActive = true
        
        let loginButton = UIButton ()
        loginButton.setTitle("Log in", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setBackgroundImage(UIImage.init(named: "BUTTON"), for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.layer.masksToBounds = true
        
        contentView.addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.init(item: loginButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true

        
        NSLayoutConstraint.init(item: loginButton, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: loginButton, attribute: .top, relatedBy: .equal, toItem: stackView, attribute: .bottom, multiplier: 1, constant: 16).isActive = true
        
        NSLayoutConstraint.init(item: loginButton, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 16).isActive = true
        
        loginButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    @objc func buttonPressed () {
        print(#function)
        logIn?()
    }

}
