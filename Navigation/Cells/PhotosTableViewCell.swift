//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 29.03.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    let identifier = "PhotosTableViewCell"
    let photoViewWidth = (UIScreen.main.bounds.width - 48)/4
    let titleLabelHeight: CGFloat = 25
    let baseInset: CGFloat = 12
    
    lazy var arrowButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage.init(systemName: "arrow.right"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    func photoImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    lazy var stackView : UIStackView = {
        
        let stackView = UIStackView ()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        return stackView
    } ()
    
    func getHeight () -> CGFloat {
        baseInset * 3 + photoViewWidth + titleLabelHeight
    }
    
    init() {
        super.init(style: .default, reuseIdentifier: identifier)
        
        addSubview(arrowButton)
        
        let arrowButtonTrailingConstraint = arrowButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -baseInset)
        let arrowButtonCenterYConstraint = arrowButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        
        addSubview(titleLabel)
        
        let titleLabelLeadingConstraint = titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: baseInset)
        let titleLabelTopConstraint = titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: baseInset)
        let titleLabelHeightConstraint = titleLabel.heightAnchor.constraint(equalToConstant: titleLabelHeight)
        
        var allConstraints = [NSLayoutConstraint]()
        
        for i in 0...3 {
            let photoView = photoImageView()
            photoView.image = UIImage(named: String(i))
            stackView.addArrangedSubview(photoView)
            
            let photoViewWidthConstraint = photoView.widthAnchor.constraint(equalToConstant: photoViewWidth)
            let photoViewHeightConstraint = photoView.heightAnchor.constraint(equalToConstant: photoViewWidth)
            allConstraints.append(photoViewWidthConstraint)
            allConstraints.append(photoViewHeightConstraint)
        }
        
        addSubview(stackView)
        
        let stackViewTopConstraint = stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: baseInset)
        
        let stackViewLeadingConstraint = stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: baseInset)
        
        let stackViewBottomConstraint = stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -baseInset)
        
        allConstraints.append(contentsOf: [titleLabelLeadingConstraint, titleLabelTopConstraint, stackViewTopConstraint, stackViewLeadingConstraint, stackViewBottomConstraint, titleLabelHeightConstraint, arrowButtonTrailingConstraint, arrowButtonCenterYConstraint])
        
        NSLayoutConstraint.activate(allConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
