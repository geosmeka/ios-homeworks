//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 01.04.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
     
        navigationController?.navigationBar.isHidden = false
        title = "Photos Gallery"
        
        view.addSubview(collectionView)
        
        let collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
        let collectionViewCenterXConstraint = collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let collectionViewTopConstraint = collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let collectionViewLeadingConstraint = collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        
        NSLayoutConstraint.activate([collectionViewHeightConstraint, collectionViewCenterXConstraint, collectionViewTopConstraint, collectionViewLeadingConstraint])
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
        
        photosCollectionViewCell?.image = UIImage(named: String(photoNumber))
        
        return photosCollectionViewCell ?? collectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 32)/3
        return CGSize(width: width, height: width)
    }
    
}
