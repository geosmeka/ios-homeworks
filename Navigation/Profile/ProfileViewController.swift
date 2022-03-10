//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 02.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    var profileHeaderView : ProfileHeaderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint //.lightGray
        print("Окно загрузилось, ещё один цвет настроили")
        
        profileHeaderView = ProfileHeaderView()
        
        view.addSubview(profileHeaderView!) //
    }
    
    override func viewWillLayoutSubviews() {
        profileHeaderView?.frame = view.frame
    }

}
