//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 01.04.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    var photoImageViewConstraints: [NSLayoutConstraint]?
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isHidden = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var collectionViewLayout : UICollectionViewFlowLayout = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        return layout
    }()
    
    lazy var collectionView : UICollectionView = {
        let collectionView = UICollectionView (frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return collectionView
    } ()
    
    lazy var backView: UIView = {
        let backView = UIView()
        backView.backgroundColor = .systemGray6
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.alpha = 0
        return backView
    }()
    
    lazy var closeButton : UIButton = {
        let closeButton = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(UIImage(systemName: "xmark.app.fill"), for: .normal)
        closeButton.alpha = 0
        closeButton.addTarget(self, action: #selector(closePhoto), for: .touchUpInside)
        return closeButton
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
     
        navigationController?.navigationBar.isHidden = false
        title = "Фото-альбом"
        
        view.addSubview(collectionView)
        view.addSubview(backView)
        view.addSubview(photoImageView)
        backView.addSubview(closeButton)
        
        let closeButtonTopConstraint = closeButton.topAnchor.constraint(equalTo: backView.topAnchor)
        let closeButtonTrailingConstraint = closeButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor)
        let closeButtonConstraints = [closeButtonTopConstraint, closeButtonTrailingConstraint]
        
        let collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
        let collectionViewCenterXConstraint = collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let collectionViewTopConstraint = collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let collectionViewLeadingConstraint = collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        
        let backViewTopConstraint = backView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let backViewLeadingConstraint = backView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let backViewWidthConstraint = backView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        let backViewHeightConstraint = backView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
        let backViewConstraints = [backViewTopConstraint, backViewLeadingConstraint, backViewWidthConstraint, backViewHeightConstraint]
        
        NSLayoutConstraint.activate([collectionViewHeightConstraint, collectionViewCenterXConstraint, collectionViewTopConstraint, collectionViewLeadingConstraint] + backViewConstraints + closeButtonConstraints)
    }

}

extension PhotosViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let photoNumber = indexPath.section * 3 + indexPath.row
        
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath)
        
        let photosCollectionViewCell = collectionViewCell as? PhotosCollectionViewCell
        photosCollectionViewCell?.delegate = self
        photosCollectionViewCell?.indexPath = indexPath
        
        photosCollectionViewCell?.image = UIImage(named: String(photoNumber))
        
        return photosCollectionViewCell ?? collectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 32)/3
        return CGSize(width: width, height: width)
    }
    
}

extension PhotosViewController : PhotosCollectionViewCellDelegate {
    
    func expandPhoto(_ indexPath: IndexPath, photo: UIImage) {
        print(indexPath)
        
        guard var frame = collectionView.layoutAttributesForItem(at: indexPath)?.frame else { return }
        print(frame)
        
        photoImageView.image = photo
        //photoImageView.backgroundColor = .yellow
        
        frame.origin.y -= collectionView.contentOffset.y
        frame.origin.x -= collectionView.contentOffset.x
        
        let photoImageViewTopConstraint = photoImageView.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: frame.origin.y)
        let photoImageViewLeadingConstraint = photoImageView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: frame.origin.x)
        let photoImageViewHeightConstraint = photoImageView.heightAnchor.constraint(equalToConstant: frame.size.height)
        let photoImageViewWidthConstraint = photoImageView.widthAnchor.constraint(equalToConstant: frame.size.width)
        
        if let constraints = photoImageViewConstraints {
            NSLayoutConstraint.deactivate(constraints)
        }
        
        photoImageViewConstraints = [photoImageViewTopConstraint, photoImageViewLeadingConstraint, photoImageViewHeightConstraint, photoImageViewWidthConstraint]
        
        NSLayoutConstraint.activate(photoImageViewConstraints!)
        photoImageView.isHidden = false
        
        //frame.origin.x += 8
        frame.origin.y += collectionView.frame.origin.y
        
        let photoFrame = UIImageView(image: photo).frame
        let aspectRatio = photoFrame.width/photoFrame.height
        let scale = view.frame.width/frame.width/aspectRatio
        let scaleTransform = CGAffineTransform(scaleX: scale, y: scale)
        
        let translationX = (view.frame.width/2 - frame.width/2 - frame.origin.x)/scale
        let translationY = (UIScreen.main.bounds.height/2 - frame.width/2 - frame.origin.y)/scale
        let translation = CGAffineTransform(translationX: translationX, y: translationY)
        
        UIView.animate(withDuration: 0.5) {
            self.photoImageView.transform = translation.concatenating(scaleTransform)
            self.backView.alpha = 0.8
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.closeButton.alpha = 1
            }
        }
    }
   
    @objc func closePhoto () {
        print(#function)
        UIView.animate(withDuration: 0.3) {
            self.photoImageView.transform = .identity
            self.backView.alpha = 0
            self.closeButton.alpha = 0
        } completion: { _ in
            self.photoImageView.isHidden = true
        }
    }
}
