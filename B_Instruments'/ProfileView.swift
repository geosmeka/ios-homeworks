//
//  ProfileView.swift
//  B_Instruments'
//
//  Created by Екатерина Смекалова on 09.03.2022.
//

import UIKit

class ProfileView: UIView {
    
    @IBOutlet weak var avatarView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var birthdateLabel: UILabel!
    
    @IBOutlet weak var bioView: UITextView!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    static func getFromNib () -> UIView {
        UINib (nibName: "ProfileView", bundle: nil).instantiate(withOwner: self).first as! UIView
    }
}
