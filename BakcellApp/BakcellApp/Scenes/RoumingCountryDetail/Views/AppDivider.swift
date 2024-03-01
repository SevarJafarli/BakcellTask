//
//  AppDivider.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 27.02.24.
//

import UIKit
import BakcellUIKit

class AppDivider: UIView {
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupDivider()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setupDivider() {
        self.backgroundColor = adaptiveColor(.greyStrokeSoft)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.snp.updateConstraints { make in
            make.height.equalTo(1)
        }
    }
}
