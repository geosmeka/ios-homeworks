//
//  PostViewController.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 03.03.2022.
//

import UIKit

class PostViewController: UIViewController {

    var post : Post
    
    init(post : Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = post.title
        view.backgroundColor = UIColor(red: 196/255, green: 108/255, blue: 108/255, alpha: 1)
        print("Окно поста загрузилось, ещё один цвет настроили")
        
        addInfoButton()
    }
    
    func addInfoButton () {
        let infoButton = UIBarButtonItem(image: UIImage(systemName: "info.circle.fill"), style: .plain, target: self, action: #selector (showInfo))
        
        navigationItem.setRightBarButton (infoButton, animated: true)
    }
    
    @objc func showInfo () {
        print ("Кнопка нажата")
        
        let infoViewController = InfoViewController ()
        
        present(infoViewController, animated: true)
    }

}
