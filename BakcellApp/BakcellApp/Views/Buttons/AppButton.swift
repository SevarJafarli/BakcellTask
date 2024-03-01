//
//  AppButton.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 29.02.24.
//

import UIKit
import BakcellUIKit

class AppButton: UIButton {
    
    let title: String
    
    //MARK: Init
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        self.setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupButton() {
        self.backgroundColor = adaptiveColor(.redPrimary)
        self.layer.cornerRadius = 12
        self.setTitle(self.title, for: .normal)
        self.setTitleColor(adaptiveColor(.appWhite), for: .normal)
    }
}
