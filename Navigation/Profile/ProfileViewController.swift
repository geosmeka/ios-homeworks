//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 02.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    //var profileHeaderView : ProfileHeaderView?
    
    static func getFromNib () -> UIViewController {
        UINib(nibName: "ProfileViewController", bundle: nil).instantiate(withOwner: self).first as! UIViewController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint //.lightGray
        print("Окно загрузилось, ещё один цвет настроили")
        
        //profileHeaderView = ProfileHeaderView()
        //view.addSubview(profileHeaderView!) //
        
        let newButton = UIButton ()
        newButton.setTitle("New Action", for: .normal)
        
        view.addSubview(newButton)
        
        NSLayoutConstraint(item: newButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: newButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: newButton, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        
        newButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewWillLayoutSubviews() {
        //profileHeaderView?.frame = view.frame
    }

}
