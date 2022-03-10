//
//  ButtonBuilder.swift
//  Navigation
//
//  Created by Екатерина Смекалова on 02.03.2022.
//

import UIKit

class ButtonBuilder {
    static func build (title : String) -> UIButton {
 
        let size: CGFloat = 100
        let screenSize = UIScreen.main.bounds.size
        let x = (screenSize.width - size)/2
        let y = (screenSize.height - size)/2
        
        let frame = CGRect(x: x, y: y, width: size, height: size)
        
        let button = UIButton(frame: frame)
        
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.setTitle(title, for: .normal)
        
        return button
        
    }
}

