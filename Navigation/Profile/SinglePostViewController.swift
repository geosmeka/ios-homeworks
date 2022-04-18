//
//  PostViewController.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 15.04.2022.
//

import UIKit

class SinglePostViewController: UIViewController {
    
    let post : Post
    
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    } ()
    
    init(post : Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Окно загрузилось, ещё один цвет настроили")
        
        view.addSubview(tableView)
        
        let tableViewHeightConstraint = tableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
        let tableViewCenterXConstraint = tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let tableViewTopConstraint = tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let tableViewWidthConstraint = tableView.widthAnchor.constraint(equalTo: view.widthAnchor)
        
        NSLayoutConstraint.activate([tableViewHeightConstraint, tableViewCenterXConstraint, tableViewTopConstraint, tableViewWidthConstraint])
    }
}

extension SinglePostViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        730
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        PostTableViewCell(post: post)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


