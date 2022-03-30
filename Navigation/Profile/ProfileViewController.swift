//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 02.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    //let profileHeaderView = ProfileHeaderView(frame: .zero)
    
    /*static func getFromNib () -> UIViewController {
        UINib(nibName: "ProfileViewController", bundle: nil).instantiate(withOwner: self).first as! UIViewController
    }*/
    
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
       
    } ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = .systemMint //.lightGray
        print("Окно загрузилось, ещё один цвет настроили")
        
        view.addSubview(tableView)
        
        let tableViewHeightConstraint = tableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
        let tableViewCenterXConstraint = tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let tableViewTopConstraint = tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let tableViewWidthConstraint = tableView.widthAnchor.constraint(equalTo: view.widthAnchor)
        
        NSLayoutConstraint.activate([tableViewHeightConstraint, tableViewCenterXConstraint, tableViewTopConstraint, tableViewWidthConstraint])
        
        /*profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileHeaderView)
        let profileHeaderViewHeightConstraint = profileHeaderView.heightAnchor.constraint(equalToConstant: 600)
        let profileHeaderViewCenterXConstraint = profileHeaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let profileHeaderViewTopConstraint = profileHeaderView.topAnchor.constraint(equalTo: view.topAnchor)
        let profileHeaderViewWidthConstraint = profileHeaderView.widthAnchor.constraint(equalTo: view.widthAnchor)*/
        
        /*let newButton = UIButton ()
        newButton.setTitle("New Action", for: .normal)
        view.addSubview(newButton)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        let newButtonTrailingConstraint = newButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        let newButtonLeadingConstraint = newButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let newButtonBottomConstraint = newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        NSLayoutConstraint.activate([newButtonLeadingConstraint, newButtonBottomConstraint, newButtonTrailingConstraint])*/
        
        /*NSLayoutConstraint(item: newButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: newButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: newButton, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0).isActive = true*/
    }
    
    /*override func viewWillLayoutSubviews() {
        //profileHeaderView?.frame = view.frame
    }*/

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    /*
     switch indexPath.section {
     case 0:
         return 200
     case 1:
         return 100
     default:
         return 0
     }
     */
    
    /*
     switch indexPath.section {
     case 0:
         return ProfileTableViewCell ()
     case 1:
         return PhotosTableViewCell ()
     default:
         return UITableViewCell ()
     }
     */
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        220
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        ProfileHeaderView ()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        730
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        PostTableViewCell (post: posts[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
