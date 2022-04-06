//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 01.04.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotosCollectionViewCell"
    
    var image: UIImage? {
        didSet {
            photoImageView.image = image
        }
    }
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(photoImageView)
        
        let photoImageViewTopConstraint = photoImageView.topAnchor.constraint(equalTo: topAnchor)
        let photoImageViewLeadingConstraint = photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let photoImageViewTrailingConstraint = photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let photoImageViewBottomConstraint = photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        NSLayoutConstraint.activate([photoImageViewTopConstraint, photoImageViewLeadingConstraint, photoImageViewTrailingConstraint, photoImageViewBottomConstraint])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
