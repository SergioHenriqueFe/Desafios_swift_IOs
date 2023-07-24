//
//  UIviewExtension.swift
//  2-DesafioUITableViewCarros
//
//  Created by Sergio henrique Ferreira on 10/07/23.
//

import Foundation
import UIKit

extension UIView {
    
    public func gradientes(colors: [UIColor]){
        let gradienteLayer = CAGradientLayer()
        gradienteLayer.frame = bounds
        gradienteLayer.colors = colors.map {$0.cgColor}
        self.layer.insertSublayer(gradienteLayer, at: 0)
    }
    
    
}
