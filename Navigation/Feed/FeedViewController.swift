//
//  FeedViewController.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 02.03.2022.
//

import UIKit

class FeedViewController: ButtonViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 249/255, green: 178/255, blue: 209/255, alpha: 1)
        print("Окно загрузилось, цвет настроили")
        
        addButton(buttonTitle: "Show Post", buttonAction: showPost)
    }
    
    
    @objc func showPost () {
        print ("Кнопка нажата")
        
        let post = Post(title: "New iPhone 13 Release")
        //let post2 = Post(title: "iPhone 14 Release")
        
        let postViewController = PostViewController (post: post)
        navigationController?.pushViewController(postViewController, animated: true)
    }

}
