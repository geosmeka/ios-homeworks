//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 30.03.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    let identifier = "PostTableViewCell"
    
    let post : Post
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = post.title
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    lazy var likesButton : UIButton = {
        let button = UIButton()
        button.setTitle("\(post.likes) ❤️", for: .normal)
        button.setTitleColor(.black, for: .normal)
        let font = NSAttributedString(string: "\(post.likes) ❤️", attributes: [.font : UIFont.systemFont(ofSize: 16)])
        button.isEnabled = true
        button.isUserInteractionEnabled = true
        //button.backgroundColor = .blue
        button.setAttributedTitle(font, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(likesButtonTapped), for: .touchUpInside)
        return button
    } ()
    
    /*lazy var likesLabel : UILabel = {
        let label = UILabel()
        label.text = "\(post.likes) ❤️"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(likesLabelTapped)))
        return label
    } ()*/
    
    lazy var viewsLabel : UILabel = {
        let label = UILabel()
        label.text = "\(post.views) 💬"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    lazy var postImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: post.image)
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped)))
        return imageView
    } ()
    
    lazy var textView : UITextView = {
        let textView = UITextView()
        textView.text = post.description
        textView.font = .systemFont(ofSize: 14)
        textView.textColor = .systemGray
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    } ()
    
    init(post: Post) {
        self.post = post
        super.init(style: .default, reuseIdentifier: identifier)
        //backgroundColor = .systemTeal
        
        addSubview(titleLabel)
        
        let titleLabelTrailingConstraint = titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        let titleLabelLeadingConstraint = titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        let titleLabelTopConstraint = titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        let titleLabelHeightConstraint = titleLabel.heightAnchor.constraint(equalToConstant: 50)
        
        addSubview(postImageView)
        
        let postImageViewTrailingConstraint = postImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        let postImageViewTopConstraint = postImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor)
        let postImageViewHeightConstraint = postImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor)
        let postImageViewWidthConstraint = postImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor)
        
        addSubview(textView)
        
        let textViewTrailingConstraint = textView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        let textViewTopConstraint = textView.topAnchor.constraint(equalTo: postImageView.bottomAnchor)
        let textViewHeightConstraint = textView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor)
        let textViewWidthConstraint = textView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor)
        
        addSubview(likesButton)
        
        let likesLabelLeadingConstraint = likesButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        let likesLabelTopConstraint = likesButton.topAnchor.constraint(equalTo: textView.bottomAnchor)
  
        addSubview(viewsLabel)
        
        let viewsLabelTrailingConstraint = viewsLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        let viewsLabelTopConstraint = viewsLabel.topAnchor.constraint(equalTo: textView.bottomAnchor)
  
        
        
        NSLayoutConstraint.activate([titleLabelTrailingConstraint, titleLabelLeadingConstraint, titleLabelTopConstraint, titleLabelHeightConstraint, postImageViewTrailingConstraint,  postImageViewTopConstraint, postImageViewHeightConstraint, postImageViewWidthConstraint, textViewTrailingConstraint, textViewTopConstraint, textViewHeightConstraint, textViewWidthConstraint, likesLabelLeadingConstraint, likesLabelTopConstraint, viewsLabelTrailingConstraint, viewsLabelTopConstraint])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func likesButtonTapped () {
        print(#function)
    }
    
    @objc func imageViewTapped () {
        print(#function)
    }
}

