//
//  ForecastDetailPresenter+Extension.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//
import UIKit
extension ForecastDetailStyler {
    static var myModule: ForecastDetailStyler {
        return ForecastDetailStyler(
            backgroundColor: LColor.surface,
            preferredStatusBarStyle: .lightContent,
            attributesForStyle: { $0.moduleAttributes }
        )
    }
}

private extension ForecastDetailStyler.TextStyle {
    var moduleAttributes: ForecastDetailStyler.TextAttributes {
        switch self {
        case .regionLabel(let text):
            return ForecastDetailStyler.TextAttributes(text: text, font: .titleLarge, color: LColor.primary)
        case .currentTempLabel(let text):
            return ForecastDetailStyler.TextAttributes(text: text, font: .titleSmall, color: LColor.primary, .opacity92)
        case .weatherSentimentLabel(let text):
            return ForecastDetailStyler.TextAttributes(text: text, font: .bodyMedium, color: LColor.primary, .opacity64)
        case .hourTempLabel(let text):
            return ForecastDetailStyler.TextAttributes(text: text, font: .bodyMedium, color: LColor.primary)
        case .hourTimeLabel(let text):
            return ForecastDetailStyler.TextAttributes(text: text, font: .bodySmall, color: LColor.primary, .opacity92)
//        case .headerFeelsLikeLabel(let text):
//            return ForecastListingStyler.TextAttributes(text: text, font: .titleSmall, color: LColor.primary, .opacity64)
//        case .headerUpdatedAtLabel(let text):
//            return ForecastListingStyler.TextAttributes(text: text, font: .bodySmall, color: LColor.primary, .opacity44)
//        case .headerTempLabel(let text):
//            return ForecastListingStyler.TextAttributes(text: text, font: .bodyMedium, color: LColor.primary, .opacity92)
        }
    }
}
