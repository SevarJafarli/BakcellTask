//
//  SectionHeaderView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 22.02.24.
//

import UIKit
import BakcellUIKit

class SectionHeaderView: UIView {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    init(title: String) {
        super.init(frame: .zero)
        self.addSubview(self.titleLabel)
        
        self.titleLabel.text = title
        self.titleLabel.textColor = adaptiveColor(.blackHigh)
        
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        self.titleLabel.snp.updateConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.verticalEdges.equalToSuperview().inset(5)
        }
    }
}
