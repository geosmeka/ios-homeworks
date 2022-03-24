//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 10.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var statusTextField: UITextField!
    
    @IBOutlet weak var setStatusButton: UIButton!
    
    
    override func draw(_ rect: CGRect) {
        
        avatarImageView.image = UIImage(named: "Voznik2")
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width/2
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        
        fullNameLabel.text = "Steve Voznik"
        fullNameLabel.font = .boldSystemFont(ofSize: 18)
        fullNameLabel.textColor = .black
       
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.tintColor = .white
        setStatusButton.backgroundColor = .blue
        
        setStatusButton.layer.cornerRadius = 4
        
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.addTarget(self, action: #selector(showStatus), for: .touchUpInside)
            
        statusLabel.text = "Waiting for something..."
        statusLabel.font = .systemFont(ofSize: 14)
        statusLabel.textColor = .gray
    }

    @objc func showStatus () {
        print(statusLabel?.text ?? "no status")
        
    }
    
}

class OldProfileHeaderView: UIView {
    
    let statusBarHeight : CGFloat = 20
    let contentInset : CGFloat = 16
    let avatarSide : CGFloat = 100
    let nameLabelTopInset : CGFloat = 27
    let statusButtonHeight : CGFloat = 50
    let statusButtonInset : CGFloat = 34
    var statusLabel : UILabel?
    
    override func draw(_ rect: CGRect) {
        
        let avatarView = UIImageView(image: UIImage(named: "Voznik2"))
        addSubview(avatarView)
        
        let avatarTopConstraint = avatarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: statusBarHeight + contentInset)
        
        let avatarLeadingConstraint = avatarView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: contentInset)
        
        let avatarWidthConstraint = avatarView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: avatarSide)
        
        let avatarHeightConstraint = avatarView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, constant: avatarSide)
        
/*
        NSLayoutConstraint(item: avatarView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: statusBarHeight + contentInset).isActive = true
        
        NSLayoutConstraint(item: avatarView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: contentInset).isActive = true
        
        NSLayoutConstraint(item: avatarView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: avatarSide).isActive = true
        
        NSLayoutConstraint(item: avatarView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: avatarSide).isActive = true
 */
        
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        
        avatarView.contentMode = .scaleAspectFill
        avatarView.layer.cornerRadius = avatarSide/2
        avatarView.layer.masksToBounds = true
        avatarView.layer.borderWidth = 3
        avatarView.layer.borderColor = UIColor.white.cgColor
        
        let namelabel = UILabel ()
        namelabel.text = "Steve Voznik"
        namelabel.font = .boldSystemFont(ofSize: 18)
        namelabel.textColor = .black
        addSubview(namelabel)
        
        let nameLabelTopConstraint = namelabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: nameLabelTopInset + statusBarHeight)
        
        let nameLabelLeadingConstraint = namelabel.leadingAnchor.constraint(equalTo: avatarView.leadingAnchor, constant: contentInset)
        
        /*
        NSLayoutConstraint(item: namelabel, attribute: .leading, relatedBy: .equal, toItem: avatarView, attribute: .trailing, multiplier: 1, constant: contentInset).isActive = true
        
        NSLayoutConstraint(item: namelabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: nameLabelTopInset + statusBarHeight).isActive = true
         */
        
        
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        
        let statusButton = UIButton ()
        statusButton.setTitle("Show status", for: .normal)
        statusButton.tintColor = .white
        statusButton.backgroundColor = .blue
        
        statusButton.layer.cornerRadius = 4
        //statusButton.layer.masksToBounds = true
        
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.layer.shadowRadius = 4
        statusButton.addTarget(self, action: #selector(showStatus), for: .touchUpInside)
        
        addSubview(statusButton)
        
        let statusButtonTopConstraint = statusButton.topAnchor.constraint(equalTo: avatarView.topAnchor, constant: contentInset)
        
        let statusButtonLeadingConstraint = statusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: contentInset)
        
        let statusButtonCenterXConstraint = statusButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        
        let statusButtonHeightConstraint = statusButton.heightAnchor.constraint(equalToConstant: statusButtonHeight)
        
        /*
        NSLayoutConstraint(item: statusButton, attribute: .top, relatedBy: .equal, toItem: avatarView, attribute: .bottom, multiplier: 1, constant: contentInset).isActive = true
        
        NSLayoutConstraint(item: statusButton, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: contentInset).isActive = true
        
        NSLayoutConstraint(item: statusButton, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: statusButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: statusButtonHeight).isActive = true
         */
        
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        
        statusLabel = UILabel ()
        statusLabel!.text = "Waiting for something..."
        statusLabel!.font = .systemFont(ofSize: 14)
        statusLabel!.textColor = .gray
        addSubview(statusLabel!)
        
        let statusLabelLeadingConstraint = statusLabel!.leadingAnchor.constraint(equalTo: avatarView.leadingAnchor, constant: contentInset)
        
        let statusLabelBottomConstraint = statusButton.topAnchor.constraint(equalTo: statusLabel!.firstBaselineAnchor, constant: statusButtonInset)
        
        /*
        NSLayoutConstraint(item: statusLabel!, attribute: .leading, relatedBy: .equal, toItem: avatarView, attribute: .trailing, multiplier: 1, constant: contentInset).isActive = true
        
        NSLayoutConstraint(item: statusButton, attribute: .top, relatedBy: .equal, toItem: statusLabel!, attribute: .firstBaseline, multiplier: 1, constant: statusButtonInset).isActive = true
        */
        
        statusLabel!.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([avatarTopConstraint, avatarLeadingConstraint, avatarWidthConstraint, avatarHeightConstraint, nameLabelTopConstraint, nameLabelLeadingConstraint, statusButtonTopConstraint, statusButtonLeadingConstraint, statusButtonCenterXConstraint, statusButtonHeightConstraint, statusLabelLeadingConstraint, statusButtonTopConstraint, statusLabelBottomConstraint])
    }

    @objc func showStatus () {
        print(statusLabel?.text ?? "no status")
        
    }
    
}
