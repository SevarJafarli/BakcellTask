//
//  OperatorStatusVStackView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 26.02.24.
//

import UIKit

class OperatorStatusVStackView: UIStackView {
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .vertical
        self.spacing = 16
        
        self.addSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

    private func addSubviews() {
        let firstHStackView = OperatorStatusHStackView()
        let secondHStackView = OperatorStatusHStackView()
        firstHStackView.data = .init(title: "Daxil olan", subtitle: "0.39 ₼/deq")
        secondHStackView.data = .init(title: "Çıxan", subtitle: "0.99 ₼/deq")
        
        self.addArrangedSubview(firstHStackView)
        self.addArrangedSubview(secondHStackView)
        
        self.updateConstraints()
    }

}
