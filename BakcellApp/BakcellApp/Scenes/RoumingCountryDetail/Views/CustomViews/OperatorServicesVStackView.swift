//
//  OperatorServicesVStackView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 26.02.24.
//

import UIKit

class OperatorServicesVStackView: UIStackView {
  
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .vertical
        self.spacing = 24
        addSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        for _ in [1...3] {
            let view = OperatorServiceInfoStackView()
            self.addArrangedSubview(view)
        }
        
        self.updateConstraints()
    }
    
}
