//
//  PackageIconView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 28.02.24.
//

import UIKit
import BakcellUIKit

class PackageIconView: UIView {
//    var theme: ThemeProvider = App.theme
    

    var image: UIImage? {
        didSet {
            configure()
        }
    }
    lazy var imageView: UIImageView  = {
        let view = UIImageView()
        view.tintColor = adaptiveColor(.blackHigh)
        return view
    }()
    
    //MARK: İnit
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = adaptiveColor(.greyBg)
        self.layer.cornerRadius = 14
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.addSubview(self.imageView)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.imageView.snp.updateConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(24)
        }
    }
    private func configure() {
        self.imageView.image = image
    }
}
