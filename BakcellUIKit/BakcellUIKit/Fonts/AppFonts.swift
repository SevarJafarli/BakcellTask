//
//  AppFonts.swift
//  BakcellUIKit
//
//  Created by Sevar Jafarli on 15.02.24.
//

import UIKit

public enum AppFonts {
    case SFBoldHeadline
    case SFRegularBody
    case SFBoldFootnote
    case SFBoldLargeTitle
    case SFBoldTitle2
    case SFBoldCardTitle
    case SFBoldCaption1
    case SFBoldCaptionBold
    case SFRegularCaption1
    case SFRegularSubheadline
    case SFBoldSubheadline
}

extension AppFonts {
    public var fontStyle: UIFont {
        
        switch self {
        case .SFBoldHeadline:
            return .systemFont(ofSize: 17, weight: .semibold)
        case .SFRegularBody:
            return .systemFont(ofSize: 17, weight: .regular)
        case .SFBoldFootnote:
            return .systemFont(ofSize: 13, weight: .semibold)
        case .SFBoldLargeTitle:
            return .systemFont(ofSize: 34, weight: .bold)
        case .SFBoldTitle2:
            return .systemFont(ofSize: 22, weight: .bold)
        case .SFBoldCardTitle:
            return .systemFont(ofSize: 17, weight: .bold)
        case .SFBoldCaption1:
            return .systemFont(ofSize: 12, weight: .medium)
        case .SFBoldCaptionBold:
            return .systemFont(ofSize: 12, weight: .bold)
        case .SFRegularCaption1:
            return .systemFont(ofSize: 12, weight: .medium)
        case .SFRegularSubheadline:
            return .systemFont(ofSize: 15, weight: .regular)
        case .SFBoldSubheadline:
            return .systemFont(ofSize: 15, weight: .semibold)
        }
    }
}
