//
//  LandingPageStyler+Extension.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import Foundation
extension LandingPageStyler {
    static var myModule: LandingPageStyler {
        return LandingPageStyler(
            backgroundColor: LColor.surface,
            preferredStatusBarStyle: .lightContent,
            attributesForStyle: { $0.moduleAttributes }
        )
    }
}

private extension LandingPageStyler.TextStyle {
    var moduleAttributes: LandingPageStyler.TextAttributes {
        switch self {
        case .pageTitle(let text):
            return LandingPageStyler.TextAttributes(text: text, font: .titleLarge, color: LColor.primary.alpha(with: .opacity92))
        case .pageSubTitle(let text):
            return LandingPageStyler.TextAttributes(text: text, font: .bodyMedium, color: LColor.primary.alpha(with: .opacity64), .opacity92)
        case .submitButton(let text):
            return LandingPageStyler.TextAttributes(text: text, font: .titleSmall, color: LColor.surface, backgroundColor: LColor.primary)
        case .inputField(let text):
            return LandingPageStyler.TextAttributes(text: text, font: .bodyMedium, color: LColor.primary.alpha(with: .opacity92))
        }
    }
}
