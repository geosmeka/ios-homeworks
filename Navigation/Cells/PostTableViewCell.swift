//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 30.03.2022.
//

import UIKit


protocol PostTableViewCellDelegate : AnyObject {
    func showSinglePost (_ post: Post)
}

class PostTableViewCell: UITableViewCell {

    let identifier = "PostTableViewCell"
    weak var delegate : PostTableViewCellDelegate?
    
    var post : Post
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = post.title
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    /*lazy var likesLabel : UIButton = {
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
    } ()*/
    
    var likesLabelText : String {
        "\(post.likes) ❤️"
    }
    
    var viewsLabelText : String {
        "\(post.views) 💬"
    }
    
    lazy var likesLabel : UILabel = {
        let label = UILabel()
        label.text = likesLabelText
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(likesLabelTapped)))
        return label
    } ()
    
    lazy var viewsLabel : UILabel = {
        let label = UILabel()
        label.text = viewsLabelText
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
        imageView.isUserInteractionEnabled = true
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
    
    lazy var backView : UIView = {
        let backView = UIView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        return backView
    } ()
    
    init(post: Post) {
        self.post = post
        super.init(style: .default, reuseIdentifier: identifier)
        
        contentView.addSubview(backView)
        
        let backViewTopConstrainst = backView.topAnchor.constraint(equalTo: contentView.topAnchor)
        let backViewLeadingConstrainst = backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        let backViewTrailingConstrainst = backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        let backViewBottomConstrainst = backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        
        let backViewConstrainsts = [backViewTopConstrainst, backViewLeadingConstrainst, backViewTrailingConstrainst, backViewBottomConstrainst]
        
        
        backView.addSubview(titleLabel)
        
        let titleLabelTrailingConstraint = titleLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor)
        let titleLabelLeadingConstraint = titleLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor)
        let titleLabelTopConstraint = titleLabel.topAnchor.constraint(equalTo: backView.topAnchor)
        let titleLabelHeightConstraint = titleLabel.heightAnchor.constraint(equalToConstant: 50)
        
        backView.addSubview(postImageView)
        
        let postImageViewTrailingConstraint = postImageView.trailingAnchor.constraint(equalTo: backView.trailingAnchor)
        let postImageViewTopConstraint = postImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor)
        let postImageViewHeightConstraint = postImageView.heightAnchor.constraint(equalTo: backView.widthAnchor)
        let postImageViewWidthConstraint = postImageView.widthAnchor.constraint(equalTo: backView.widthAnchor)
        
        backView.addSubview(textView)
        
        let textViewTrailingConstraint = textView.trailingAnchor.constraint(equalTo: backView.trailingAnchor)
        let textViewTopConstraint = textView.topAnchor.constraint(equalTo: postImageView.bottomAnchor)
        let textViewHeightConstraint = textView.heightAnchor.constraint(equalTo: backView.widthAnchor)
        let textViewWidthConstraint = textView.widthAnchor.constraint(equalTo: backView.widthAnchor)
        
        backView.addSubview(likesLabel)
        
        let likesLabelLeadingConstraint = likesLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor)
        let likesLabelTopConstraint = likesLabel.topAnchor.constraint(equalTo: textView.bottomAnchor)
  
        backView.addSubview(viewsLabel)
        
        let viewsLabelTrailingConstraint = viewsLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor)
        let viewsLabelTopConstraint = viewsLabel.topAnchor.constraint(equalTo: textView.bottomAnchor)
  
        
        
        NSLayoutConstraint.activate([titleLabelTrailingConstraint, titleLabelLeadingConstraint, titleLabelTopConstraint, titleLabelHeightConstraint, postImageViewTrailingConstraint,  postImageViewTopConstraint, postImageViewHeightConstraint, postImageViewWidthConstraint, textViewTrailingConstraint, textViewTopConstraint, textViewHeightConstraint, textViewWidthConstraint, likesLabelLeadingConstraint, likesLabelTopConstraint, viewsLabelTrailingConstraint, viewsLabelTopConstraint] + backViewConstrainsts)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func likesLabelTapped () {
        post.likes += 1
        likesLabel.text = likesLabelText
        guard let index = (posts.firstIndex { $0.id == post.id }) else { return }
        posts[index].likes += 1
    }
    
    @objc func imageViewTapped () {
        post.views += 1
        viewsLabel.text = viewsLabelText
        guard let index = (posts.firstIndex { $0.id == post.id }) else { return }
        posts[index].views += 1
        delegate?.showSinglePost(post)
    }

}

