//
//  LandingPageStyler.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//


import UIKit

class LandingPageStyler {
    enum TextStyle {
        case pageTitle(_ text: String)
        case pageSubTitle(_ text: String)
        case submitButton(_ text: String)
        case inputField(_ text: String)
    }
    
    struct TextAttributes {
        let font: AliasFontToken
        let color: UIColor
        let backgroundColor: UIColor?
        let text: String
        var opacity: Opacity = .opacity100
        init(text: String, font: AliasFontToken, color: UIColor, backgroundColor: UIColor? = nil, _ opacity: Opacity = .opacity100) {
            self.font = font
            self.color = color
            self.backgroundColor = backgroundColor
            self.text = text
            self.opacity = opacity
        }
    }
    // MARK: - General Properties
    let backgroundColor: UIColor
    let preferredStatusBarStyle: UIStatusBarStyle
    
    let attributesForStyle: (_ style: TextStyle) -> TextAttributes
    
    init(backgroundColor: UIColor,
         preferredStatusBarStyle: UIStatusBarStyle = .default,
         attributesForStyle: @escaping (_ style: TextStyle) -> TextAttributes)
    {
        self.backgroundColor = backgroundColor
        self.preferredStatusBarStyle = preferredStatusBarStyle
        self.attributesForStyle = attributesForStyle
    }
    
    // MARK: - Convenience Getters
    func font(for style: TextStyle) -> AliasFontToken {
        return attributesForStyle(style).font
    }
    func color(for style: TextStyle) -> UIColor {
        return attributesForStyle(style).color
    }
    func backgroundColor(for style: TextStyle) -> UIColor? {
        return attributesForStyle(style).backgroundColor
    }
    func apply(textStyle: TextStyle, to label: UILabel) {
        label.numberOfLines = 0
        let attributes = attributesForStyle(textStyle)
        let attributedText = NSMutableAttributedString(attributedString: attributes.text.typographicText(color: attributes.color, font: attributes.font, opacity: attributes.opacity))
        label.attributedText = attributedText
        label.textAlignment = .center
    }
    func  apply(textStyle: TextStyle, to button: UIButton) {
        let attributes = attributesForStyle(textStyle)
        let attributedText = NSMutableAttributedString(attributedString: attributes.text.typographicText(color: attributes.color, font: attributes.font, opacity: attributes.opacity))
        button.setAttributedTitle(attributedText, for: .normal)
    }
    func apply(textStyle: TextStyle, to textField: UITextField) {
        let attributes = attributesForStyle(textStyle)
        let attributedText = NSMutableAttributedString(attributedString: attributes.text.typographicText(color: attributes.color, font: attributes.font, opacity: attributes.opacity))
        let attributesForTyping = attributedText.attributes(at: 0, effectiveRange: nil)
        textField.typingAttributes = attributesForTyping
    }
}
extension UIImage {
    struct App {
        static let settings = "icons8-settings-28"
        static let dismiss = "dismiss"
    }
}
