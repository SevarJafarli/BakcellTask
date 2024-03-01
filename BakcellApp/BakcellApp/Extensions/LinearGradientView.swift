//
//  LinearGradientView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 29.02.24.
//

import UIKit

extension UIView {
    func applyLinearGradient(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)

        layer.insertSublayer(gradientLayer, at: 0)
    }
}
