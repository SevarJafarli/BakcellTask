//
//  OperatorStatusVStackView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 26.02.24.
//

import UIKit
import BakcellUIKit

class OperatorStatusVStackView: UIStackView{
    var data: [RoumingOperatorVolume]? {
        didSet {
            configure()
        }
    }
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .vertical
        self.spacing = 16

    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

   
    
    override func updateConstraints() {
        super.updateConstraints()
    }
    
    private func configure() {
        guard let data = data else { return }
        
        for volume in data {
            let view = OperatorStatusHStackView()
            
            let subtitle = volume.volumeType.isEmpty ? volume.volume : "\(volume.volume)/\(volume.volumeType)"
            
            if subtitle == "Pulsuz" {
                view.subtitleLabel.textColor = adaptiveColor(.redPrimary)
            }
            view.data = .init(title: volume.title, subtitle: subtitle)
            self.addArrangedSubview(view)
        }
        self.updateConstraints()
    }
    
    
}
