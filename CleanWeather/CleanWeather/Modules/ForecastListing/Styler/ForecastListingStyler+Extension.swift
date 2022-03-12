//
//  ForecastListingStyler+Extensino.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//


import UIKit
extension ForecastListingStyler {
    static var myModule: ForecastListingStyler {
        return ForecastListingStyler(
            backgroundColor: LColor.surface,
            preferredStatusBarStyle: .lightContent,
            attributesForStyle: { $0.moduleAttributes }
        )
    }
}

private extension ForecastListingStyler.TextStyle {
    var moduleAttributes: ForecastListingStyler.TextAttributes {
        switch self {
        case .listingCellTitle(let text):
            return ForecastListingStyler.TextAttributes(text: text, font: .titleSmall, color: LColor.primary, .opacity92)
        case .listingCellSubTitle(let text):
            return ForecastListingStyler.TextAttributes(text: text, font: .bodyMedium, color: LColor.primary, .opacity64)
        case .tempRange(let text):
            return ForecastListingStyler.TextAttributes(text: text, font: .bodyMedium, color: LColor.primary, .opacity92)
        case .headerRegionLabel(let text):
            return ForecastListingStyler.TextAttributes(text: text, font: .bodyMedium, color: LColor.primary, .opacity92)
        case .headerLatlongLabel(let text):
            return ForecastListingStyler.TextAttributes(text: text, font: .bodySmall, color: LColor.primary, .opacity64)
        case .headerFeelsLikeLabel(let text):
            return ForecastListingStyler.TextAttributes(text: text, font: .titleSmall, color: LColor.primary, .opacity64)
        case .headerUpdatedAtLabel(let text):
            return ForecastListingStyler.TextAttributes(text: text, font: .bodySmall, color: LColor.primary, .opacity44)
        case .headerTempLabel(let text):
            return ForecastListingStyler.TextAttributes(text: text, font: .bodyMedium, color: LColor.primary, .opacity92)
        }
    }
}
