//
//  ButtonViewController.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 03.03.2022.
//

import UIKit

class ButtonViewController : UIViewController {
    
    var buttonAction : () -> Void = {}
    
    func addButton (buttonTitle : String, buttonAction : @escaping () -> Void = {}) {
        
        self.buttonAction = buttonAction
        
        let button = ButtonBuilder.build(title: buttonTitle)
        
        button.addTarget(self, action: #selector(action), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    @objc func action () {
        buttonAction()
    }
}


