//
//  InfoViewController.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 03.03.2022.
//

import UIKit

class InfoViewController: ButtonViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 135/255, green: 76/255, blue: 115/255, alpha: 1)
        
        print("Info-oкно загрузилось, ещё один цвет настроили")
      
        buttonTitle = "Happy End!"
        buttonAction = showAlert
        
        addButton()
    }

    
    @objc func showAlert () {
        
        let alertController = UIAlertController(title: "Happy End!", message: "Спасибо, что дошли до конца. С Вас 5$ :)", preferredStyle: .actionSheet)
        
        let alertPayAction = UIAlertAction(title: "Pay", style: .default) { _ in
            print("С Вас успешно списаны 5 $!")
            
        }
        
        let alertCancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Жаль, Вы всегда можете оплатить позже")
            
        }
        
        alertController.addAction(alertPayAction)
        alertController.addAction(alertCancelAction)
        
        present(alertController, animated: true)
    }
}
