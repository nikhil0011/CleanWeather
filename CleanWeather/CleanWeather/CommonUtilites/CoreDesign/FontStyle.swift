//
//  FontStyle.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import UIKit

public enum FontStyle {
    case type282
    case type162
    case type140
    func getAttribues() -> [NSAttributedString.Key : Any] {
        let paragraphStyle = NSMutableParagraphStyle()
        switch self {
        case .type140:
            paragraphStyle.minimumLineHeight = 20
            return [.font: Theme.shared.font.regularFont(14), .paragraphStyle: paragraphStyle]
        case .type162:
            paragraphStyle.minimumLineHeight = 24
            return [.font: Theme.shared.font.semiboldFont(16), .paragraphStyle: paragraphStyle]
        case .type282:
            paragraphStyle.minimumLineHeight = 24
            return [.font: Theme.shared.font.semiboldFont(28), .paragraphStyle: paragraphStyle]
        }
    }
}
