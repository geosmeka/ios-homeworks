//
//  ProfileViewController.swift
//  B_Instruments'
//
//  Created by Екатерина Смекалова on 09.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view = ProfileView.getFromNib()
    }

}
