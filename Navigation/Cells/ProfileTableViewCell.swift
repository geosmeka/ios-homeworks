//
//  ProfileTableViewCell.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 29.03.2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    let identifier = "ProfileTableViewCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    init() {
        super.init(style: .default, reuseIdentifier: identifier)
        
        let profileHeaderView = ProfileHeaderView(superview: contentView)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileHeaderView)
        
        let profileHeaderViewHeightConstraint = profileHeaderView.heightAnchor.constraint(equalTo: heightAnchor)
        let profileHeaderViewCenterXConstraint = profileHeaderView.centerXAnchor.constraint(equalTo: centerXAnchor)
        let profileHeaderViewTopConstraint = profileHeaderView.topAnchor.constraint(equalTo: topAnchor)
        let profileHeaderViewWidthConstraint = profileHeaderView.widthAnchor.constraint(equalTo: widthAnchor)
   
        NSLayoutConstraint.activate([profileHeaderViewHeightConstraint, profileHeaderViewCenterXConstraint, profileHeaderViewTopConstraint, profileHeaderViewWidthConstraint])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
