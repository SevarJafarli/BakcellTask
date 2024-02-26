//
//  PackageServiceFeeLabel.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 20.02.24.
//

import UIKit
import BakcellUIKit

class PackageServiceFeeLabel: UILabel, ThemeableView {
    var theme: ThemeProvider = App.theme

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(serviceFee: Double, serviceType: String) {
        
        let serviceFeeString = "\(serviceFee) ₼ "
        let attributedString = NSMutableAttributedString(string: "\(serviceFeeString) / \(serviceType)")
        
        let boldRange = NSRange(location: 0, length: serviceFeeString.count)
        attributedString.addAttribute(.font, value: AppFonts.SFBoldCardTitle.fontStyle, range: boldRange)
        
        attributedString.addAttribute(.foregroundColor, value: adaptiveColor(.blackHigh), range: boldRange)
        
        
        let regularRange = NSRange(location: serviceFeeString.count + 1, length: String(serviceType).count + 2)
        attributedString.addAttribute(.font, value: AppFonts.SFRegularBody.fontStyle, range: regularRange)
        attributedString.addAttribute(.foregroundColor,  value: adaptiveColor(.blackLow), range: regularRange)
        
        self.attributedText = attributedString
        
    }

}
