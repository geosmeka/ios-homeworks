//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 29.03.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    let identifier = "PhotosTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    init() {
        super.init(style: .default, reuseIdentifier: identifier)
        backgroundColor = .blue
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
