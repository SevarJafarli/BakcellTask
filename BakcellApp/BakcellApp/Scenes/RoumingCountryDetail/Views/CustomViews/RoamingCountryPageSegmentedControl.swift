//
//  RoamingCountryPageSegmentedControl.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 05.03.24.
//

import Foundation
import BakcellUIKit

class RoamingCountryPageSegmentedControl: SegmentedControl {
    
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = adaptiveColor(.greyBg)
        self.selectionBoxStyle = .default
        self.selectionBoxColor = adaptiveColor(.appWhite)
        self.selectionBoxCornerRadius = 10
        self.layoutPolicy = .fixed
        self.segmentSpacing = 0
        self.selectionBoxHeight = 32
        self.selectionHorizontalPadding = 8
        self.contentInset = .zero
        self.clipsToBounds = true
        self.setSegmentedControl()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    
    func setSegmentedControl() {
        let titleStrings = ["Öncədən ödənişli", "Fakturalı"]
        let titles: [NSAttributedString] = {
            let attributes: [NSAttributedString.Key: Any] = [.font:  AppFonts.SFRegularSubheadline.fontStyle, .foregroundColor: adaptiveColor(.blackHigh)]
            var titles = [NSAttributedString]()
            for titleString in titleStrings {
                let title = NSAttributedString(string: titleString, attributes: attributes)
                titles.append(title)
            }
            return titles
        }()
        
        let selectedTitles: [NSAttributedString] = {
            let attributes: [NSAttributedString.Key: Any] =  [.font:  AppFonts.SFRegularSubheadline.fontStyle, .foregroundColor: adaptiveColor(.blackHigh)]
            var selectedTitles = [NSAttributedString]()
            for titleString in titleStrings {
                let selectedTitle = NSAttributedString(string: titleString, attributes: attributes)
                selectedTitles.append(selectedTitle)
            }
            return selectedTitles
        }()
        
        self.setTitles(titles, selectedTitles: selectedTitles)
        
    }
}
