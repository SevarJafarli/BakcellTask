//
//  MiniAddButton.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 16.02.24.
//

import UIKit
import BakcellUIKit

class MiniAddButton: UIButton, ThemeableView {
    
    let cornerRadius: Int
    
    var theme: ThemeProvider = App.theme
    
    init(frame: CGRect, cornerRadius: Int) {
        self.cornerRadius = cornerRadius
        super.init(frame: frame)
     
        self.backgroundColor = adaptiveColor(.redPrimary)
        self.layer.cornerRadius = CGFloat(cornerRadius)

        let image = UIImage(named: AppAssets.addIcon.rawValue)?.resized(to: CGSize(width: self.frame.width / 2, height: self.frame.height / 2))
        
        self.setImage(image, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
