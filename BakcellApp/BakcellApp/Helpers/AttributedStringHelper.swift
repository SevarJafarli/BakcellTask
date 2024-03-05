//
//  AttributedStringHelper.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 28.02.24.
//

import Foundation
import BakcellUIKit
import UIKit

extension UILabel {
    
    func makePackageAmountLabel(amount: Int, amountType: String){
        let attributedString = NSMutableAttributedString(string: "\(amount) \(amountType)")
        
        let boldRange = NSRange(location: 0, length: String(amount).count)
        attributedString.addAttribute(.font, value: AppFonts.SFBoldLargeTitle.fontStyle, range: boldRange)
        attributedString.addAttribute(.foregroundColor, value: adaptiveColor(.blackHigh), range: boldRange)
        
        
        let regularRange = NSRange(location: String(amount).count + 1, length: String(amountType).count)
        
        attributedString.addAttribute(.font, value: AppFonts.SFBoldTitle2.fontStyle, range: regularRange)
        attributedString.addAttribute(.foregroundColor,  value: adaptiveColor(.blackHigh), range: regularRange)
    
        self.attributedText = attributedString
    }
    
    func makePackageAmountLabel2(amount: String, amountType: String){
        let attributedString = NSMutableAttributedString(string: "\(amount) \(amountType)")
        
        let boldRange = NSRange(location: 0, length: String(amount).count)
        attributedString.addAttribute(.font, value: AppFonts.SFBoldTitle3.fontStyle, range: boldRange)
        attributedString.addAttribute(.foregroundColor, value: adaptiveColor(.blackHigh), range: boldRange)
        
        
        let regularRange = NSRange(location: String(amount).count + 1, length: String(amountType).count)
        
        attributedString.addAttribute(.font, value: AppFonts.SFBoldFootnote.fontStyle, range: regularRange)
        attributedString.addAttribute(.foregroundColor,  value: adaptiveColor(.blackHigh), range: regularRange)
    
        self.attributedText = attributedString
    }
    
    
    func makePackageServiceFeeLabel(serviceFee: Double, serviceType: String) {
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
