//
//  LogInView.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 18.03.2022.
//

import UIKit

class LogInView: UIView {
    
    let trueLogin = "geosmeka"
    let truePassword = "netology"

    var scrollView : UIScrollView?
    var logIn : (() -> Void)?
    var errorAlert : (() -> Void)?
    
    let passwordLimit = 8
    var errorLabelHeightConstraint : NSLayoutConstraint?
    
    lazy var separator : UIView = {
        return UIView ()
    }()
    
    lazy var passwordErrorLabel : UILabel = {
        let errorLabel = UILabel ()
        errorLabel.text = "Password should be more than or \(passwordLimit) symbols!"
        errorLabel.font = .systemFont(ofSize: 14)
        errorLabel.textColor = .red
        errorLabel.textAlignment = .center
        errorLabel.isHidden = true
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        return errorLabel
    }()
    
    lazy var eMailTextField : UITextField = {
        let eMailTextField = UITextField ()
        eMailTextField.backgroundColor = .systemGray6
        eMailTextField.placeholder = "Email or phone"
        eMailTextField.font = .systemFont(ofSize: 16)
        eMailTextField.textColor = UIColor.init(named: "AccentColor")
        eMailTextField.autocapitalizationType = .none
        return eMailTextField
    }()
    
    lazy var passWordTextField : UITextField = {
        let passWordTextField = UITextField ()
        passWordTextField.isSecureTextEntry = true
        passWordTextField.backgroundColor = .systemGray6
        passWordTextField.placeholder = "Password"
        passWordTextField.font = .systemFont(ofSize: 16)
        passWordTextField.textColor = UIColor.init(named: "AccentColor")
        passWordTextField.autocapitalizationType = .none
        return passWordTextField
    }()
    
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
        
        let scrollViewCenterXConstraint = scrollView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        
        let scrollViewCenterYConstraint = scrollView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        
        let scrollViewWidthConstraint = scrollView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor)
        
        let scrollViewHeightConstraint = scrollView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor)
        
        /*
        NSLayoutConstraint.init(item: scrollView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: scrollView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: scrollView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: scrollView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0).isActive = true
        */
        
        let contentView = UIView ()
        contentView.backgroundColor = .systemTeal
        scrollView.addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let contentViewCenterXConstraint = contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        
        let contentViewCenterYConstraint = contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        
        let contentViewWidthConstraint = contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        
        let contentViewHeightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        
        /*
        NSLayoutConstraint.init(item: contentView, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: contentView, attribute: .centerY, relatedBy: .equal, toItem: scrollView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: contentView, attribute: .width, relatedBy: .equal, toItem: scrollView, attribute: .width, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: contentView, attribute: .height, relatedBy: .equal, toItem: scrollView, attribute: .height, multiplier: 1, constant: 0).isActive = true
        */
        let logoView = UIImageView(image: UIImage(named: "Logo"))
        contentView.addSubview(logoView)
        
        logoView.translatesAutoresizingMaskIntoConstraints = false
        
        let logoViewCenterXConstraint = logoView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        
        let logoViewTopConstraint = logoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120)
        
        let logoViewWidthConstraint = logoView.widthAnchor.constraint(equalToConstant: 100)
        
        let logoViewHeightConstraint = logoView.heightAnchor.constraint(equalToConstant: 100)
        
        /*
        NSLayoutConstraint.init(item: logoView, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item:logoView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 120).isActive = true
        
        NSLayoutConstraint.init(item: logoView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100).isActive = true
        
        NSLayoutConstraint.init(item: logoView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100).isActive = true
        */
        
        let stackView = UIStackView ()
        stackView.axis = .vertical
        
        stackView.addArrangedSubview(eMailTextField)
        stackView.addArrangedSubview(separator)
        stackView.addArrangedSubview(passWordTextField)
        
        stackView.layer.cornerRadius = 10
        stackView.layer.masksToBounds = true
        
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        contentView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let eMailTextFieldHeightConstraint = eMailTextField.heightAnchor.constraint(equalToConstant: 50)
        
        let separatorHeightConstraint = separator.heightAnchor.constraint(equalToConstant: 2)
        
        let passWordTextFieldHeightConstraint = passWordTextField.heightAnchor.constraint(equalToConstant: 50)
        
        let stackViewTopConstraint = stackView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120)
        
        let stackViewCenterXConstraint = stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        
        let stackViewLeadingConstraint = stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        
        /*
        NSLayoutConstraint.init(item: eMailTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true
        
        NSLayoutConstraint.init(item: passWordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true
        */
        /*
        NSLayoutConstraint.init(item: stackView, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: stackView, attribute: .top, relatedBy: .equal, toItem: logoView, attribute: .bottom, multiplier: 1, constant: 120).isActive = true
        
        NSLayoutConstraint.init(item: stackView, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 16).isActive = true
        */

        
        let loginButton = UIButton ()
        loginButton.setTitle("Log in", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setBackgroundImage(UIImage.init(named: "BUTTON"), for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.layer.masksToBounds = true
        
        contentView.addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        let loginButtonLeadingConstraint = loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        
        let loginButtonHeightConstraint = loginButton.heightAnchor.constraint(equalToConstant: 50)
        
        let loginButtonCenterXConstraint = loginButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        
        contentView.addSubview(passwordErrorLabel)
        
        let errorLabelTopConstraint = passwordErrorLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor)
        let errorLabelBottomConstraint = passwordErrorLabel.bottomAnchor.constraint(equalTo: loginButton.topAnchor)
        errorLabelHeightConstraint = passwordErrorLabel.heightAnchor.constraint(equalToConstant: 16)
        
        NSLayoutConstraint.activate([scrollViewCenterXConstraint, scrollViewCenterYConstraint, scrollViewWidthConstraint, scrollViewHeightConstraint, contentViewCenterXConstraint, contentViewCenterYConstraint, contentViewWidthConstraint, contentViewHeightConstraint, logoViewCenterXConstraint, logoViewTopConstraint, logoViewWidthConstraint, logoViewHeightConstraint, eMailTextFieldHeightConstraint, passWordTextFieldHeightConstraint, stackViewTopConstraint, stackViewCenterXConstraint, stackViewLeadingConstraint, loginButtonLeadingConstraint, loginButtonHeightConstraint, loginButtonCenterXConstraint, separatorHeightConstraint, errorLabelTopConstraint, errorLabelBottomConstraint, errorLabelHeightConstraint].compactMap({ $0 })) //метод оставляет не nil, развертыват опциналы
        /*
        NSLayoutConstraint.init(item: loginButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true

        NSLayoutConstraint.init(item: loginButton, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: loginButton, attribute: .top, relatedBy: .equal, toItem: stackView, attribute: .bottom, multiplier: 1, constant: 16).isActive = true
        
        NSLayoutConstraint.init(item: loginButton, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 16).isActive = true
        */
        loginButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    @objc func buttonPressed () {
        
        eMailTextField.layer.borderColor = UIColor.clear.cgColor
        passWordTextField.layer.borderColor = UIColor.clear.cgColor
        
        eMailTextField.layer.borderWidth = 0
        passWordTextField.layer.borderWidth = 0
        passwordErrorLabel.isHidden = true
        errorLabelHeightConstraint?.constant = 16
        
        guard let email = eMailTextField.text, let password = passWordTextField.text else { return }
        
        if email.count == 0 {
            eMailTextField.layer.borderColor = UIColor.red.cgColor
            eMailTextField.layer.borderWidth = 2
        }
        
        if password.count == 0 {
            passWordTextField.layer.borderColor = UIColor.red.cgColor
            passWordTextField.layer.borderWidth = 2
        }
        
        if password.count < passwordLimit {
            passwordErrorLabel.isHidden = false
            errorLabelHeightConstraint?.constant = 32
        }
        
        if email.count > 0 && password.count >= passwordLimit {
            if email == trueLogin && password == truePassword {
                logIn?()
            } else {
                errorAlert?()
            }
        }
    }

}
