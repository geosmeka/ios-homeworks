//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 10.03.2022.
//

import UIKit

protocol ProfileHeaderViewDelegate : AnyObject {
    func avatarExpanded()
    func avatarShrinked()
}

class ProfileHeaderView: UIView {
    
    weak var delegate : ProfileHeaderViewDelegate?
    
    let statusBarHeight : CGFloat = 20
    let contentInset : CGFloat = 16
    let avatarSide : CGFloat = 100
    let nameLabelTopInset : CGFloat = 27
    let statusButtonHeight : CGFloat = 50
    let statusButtonInset : CGFloat = 34
    var statusLabel : UILabel?
    
    var isExpanded = false
    
    lazy var avatarView: UIImageView = {
        let avatarView = UIImageView(image: UIImage(named: "Voznik2"))
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        return avatarView
    }()
    
    lazy var closeButton : UIButton = {
        let closeButton = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(UIImage(systemName: "xmark.app.fill"), for: .normal)
        closeButton.alpha = 0
        closeButton.addTarget(self, action: #selector(closeAvatar), for: .touchUpInside)
        return closeButton
    } ()
    
    lazy var backView: UIView = {
        let backView = UIView()
        backView.backgroundColor = .systemGray6
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.alpha = 0
        return backView
    }()
        
    init(superview: UIView) {
        super.init(frame: .zero)
        
        backgroundColor = .systemGray6
        
        let avatarTopConstraint = avatarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: contentInset)
        
        let avatarLeadingConstraint = avatarView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: contentInset)
        
        let avatarWidthConstraint = avatarView.widthAnchor.constraint(equalToConstant: avatarSide)
        let avatarHeightConstraint = avatarView.heightAnchor.constraint(equalToConstant: avatarSide)
        
/*
        NSLayoutConstraint(item: avatarView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: statusBarHeight + contentInset).isActive = true
        
        NSLayoutConstraint(item: avatarView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: contentInset).isActive = true
        
        NSLayoutConstraint(item: avatarView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: avatarSide).isActive = true
        
        NSLayoutConstraint(item: avatarView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: avatarSide).isActive = true
 */
        
        avatarView.contentMode = .scaleAspectFill
        avatarView.layer.cornerRadius = avatarSide/2
        avatarView.layer.masksToBounds = true
        avatarView.layer.borderWidth = 3
        avatarView.layer.borderColor = UIColor.white.cgColor
        avatarView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(avatarViewTapped)))
        avatarView.isUserInteractionEnabled = true
        
        let namelabel = UILabel ()
        namelabel.text = "Steve Voznik"
        namelabel.font = .boldSystemFont(ofSize: 18)
        namelabel.textColor = .black
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(namelabel)
        
        let nameLabelTopConstraint = namelabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: nameLabelTopInset)
        
        let nameLabelLeadingConstraint = namelabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: contentInset)
        
        /*
        NSLayoutConstraint(item: namelabel, attribute: .leading, relatedBy: .equal, toItem: avatarView, attribute: .trailing, multiplier: 1, constant: contentInset).isActive = true
        
        NSLayoutConstraint(item: namelabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: nameLabelTopInset + statusBarHeight).isActive = true
         */
        
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
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(statusButton)
        
        let statusButtonTopConstraint = statusButton.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: contentInset)

        let statusButtonLeadingConstraint = statusButton.leadingAnchor.constraint(equalTo: avatarView.leadingAnchor)

        let statusButtonCenterXConstraint = statusButton.centerXAnchor.constraint(equalTo: centerXAnchor)

        let statusButtonHeightConstraint = statusButton.heightAnchor.constraint(equalToConstant: statusButtonHeight)
        
        
        /*let statusButtonTopConstraint = NSLayoutConstraint(item: statusButton, attribute: .top, relatedBy: .equal, toItem: avatarView, attribute: .bottom, multiplier: 1, constant: contentInset)

        let statusButtonLeadingConstraint = NSLayoutConstraint(item: statusButton, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: contentInset)

        let statusButtonCenterXConstraint = NSLayoutConstraint(item: statusButton, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)

        let statusButtonHeightConstraint = NSLayoutConstraint(item: statusButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: statusButtonHeight)*/
         
        
        statusLabel = UILabel ()
        statusLabel!.text = "Waiting for something..."
        statusLabel!.font = .systemFont(ofSize: 14)
        statusLabel!.textColor = .gray
        statusLabel!.translatesAutoresizingMaskIntoConstraints = false
        addSubview(statusLabel!)

        let statusLabelLeadingConstraint = statusLabel!.leadingAnchor.constraint(equalTo: namelabel.leadingAnchor)

        let statusLabelBottomConstraint = statusLabel!.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -statusButtonInset)
        
        /*
        NSLayoutConstraint(item: statusLabel!, attribute: .leading, relatedBy: .equal, toItem: avatarView, attribute: .trailing, multiplier: 1, constant: contentInset).isActive = true
        
        NSLayoutConstraint(item: statusButton, attribute: .top, relatedBy: .equal, toItem: statusLabel!, attribute: .firstBaseline, multiplier: 1, constant: statusButtonInset).isActive = true
        */
        
        let backViewTopConstraint = backView.topAnchor.constraint(equalTo: topAnchor)
        let backViewLeadingConstraint = backView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let backViewWidthConstraint = backView.widthAnchor.constraint(equalTo: widthAnchor)
        let backViewHeightConstraint = backView.heightAnchor.constraint(equalToConstant: superview.frame.height)
        let backViewConstraints = [backViewTopConstraint, backViewLeadingConstraint, backViewWidthConstraint, backViewHeightConstraint]
        
        addSubview(backView)
        backView.addSubview(closeButton)
        
        let closeButtonTopConstraint = closeButton.topAnchor.constraint(equalTo: backView.topAnchor)
        let closeButtonTrailingConstraint = closeButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor)
        let closeButtonConstraints = [closeButtonTopConstraint, closeButtonTrailingConstraint]
        
        addSubview(avatarView)
        
        NSLayoutConstraint.activate([avatarTopConstraint, avatarLeadingConstraint, avatarWidthConstraint, avatarHeightConstraint, nameLabelTopConstraint, nameLabelLeadingConstraint, statusButtonTopConstraint, statusButtonLeadingConstraint, statusButtonCenterXConstraint, statusButtonHeightConstraint, statusButtonTopConstraint, statusLabelLeadingConstraint, statusLabelBottomConstraint] + backViewConstraints + closeButtonConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func avatarViewTapped () {
        print("tap")
        
        guard !isExpanded else {return}
        
        print("start")
        
        let avatarFrame = UIImageView(image: avatarView.image).frame
        let aspectRatio = avatarFrame.width/avatarFrame.height
        let scale = frame.width/avatarSide/aspectRatio
        let scaleTransform = CGAffineTransform(scaleX: scale, y: scale)
        
        let translationX = (frame.width/2 - avatarSide/2 - contentInset)/scale
        let screenHeight = UIScreen.main.bounds.height
        let translationY = (screenHeight/2 - avatarSide/2 - contentInset)/scale
        let translation = CGAffineTransform(translationX: translationX, y: translationY)
        
        self.avatarView.layer.borderColor = UIColor.clear.cgColor //прозрачный цвет границы
        
        UIView.animate(withDuration: 0.5) {
            self.avatarView.transform = translation.concatenating(scaleTransform) //к сдвигу + расширение
            self.avatarView.layer.masksToBounds = false
            self.backView.alpha = 0.5
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.closeButton.alpha = 1
            }
        }
        
        delegate?.avatarExpanded()
        isExpanded = true
    }
    
    @objc func closeAvatar () {
        UIView.animate(withDuration: 0.3) {
            self.avatarView.transform = .identity
            self.avatarView.layer.masksToBounds = true
            self.backView.alpha = 0
            self.closeButton.alpha = 0
        }
        
        self.avatarView.layer.borderColor = UIColor.white.cgColor
        
        delegate?.avatarShrinked()
        isExpanded = false
    }
    
    @objc func showStatus () {
        print(statusLabel?.text ?? "no status")
        
    }
    
}

class OldProfileHeaderView: UIView {
    
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
