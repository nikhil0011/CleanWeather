//
//  LandingPageView.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import UIKit

class LandingPageView: BaseView {
    lazy var contentViewLayer: UIView = UIView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    lazy var titleLabel: UILabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 1
    }
    lazy var subTitleLabel: UILabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 2

    }
    let styler: LandingPageStyler = LandingPageStyler.myModule
    lazy var inputField: UITextField = UITextField.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.borderStyle = .roundedRect
    }
    var doneButton: UIButton = UIButton.create {
        $0.backgroundColor = UIColor.black
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isUserInteractionEnabled = true
        $0.contentMode = .scaleAspectFit
        $0.layer.masksToBounds = true
//        $0.addTarget(self, action: #selector(viewDetailTapped), for: .touchUpInside)
    }
    override func setupViews() {
        addsub(views: contentViewLayer)
        contentViewLayer.addsub(views: titleLabel, subTitleLabel, inputField, doneButton)
        contentViewLayer.fillSuperview(padding: .init(top: 40, left: 20, bottom: 20, right: 20))
        titleLabel.anchor(top: contentViewLayer.topAnchor, left: contentViewLayer.leftAnchor, bottom: nil, right: contentViewLayer.rightAnchor, paddingTop: 12)
        subTitleLabel.anchor(top: titleLabel.bottomAnchor, left: contentViewLayer.leftAnchor, bottom: nil, right: contentViewLayer.rightAnchor, paddingTop: 12)
        inputField.anchor(top: subTitleLabel.bottomAnchor, left: contentViewLayer.leftAnchor, bottom: nil, right: contentViewLayer.rightAnchor, paddingTop: 12, height: 40)
        doneButton.anchor(top: inputField.bottomAnchor, left: contentViewLayer.leftAnchor, bottom: nil, right: contentViewLayer.rightAnchor, paddingTop: 12, height: 48)
        configure()
    }
    func configure() {
        styler.apply(textStyle: .pageTitle("Accuweather App"), to: titleLabel)
        styler.apply(textStyle: .pageSubTitle("Please enter the city name to check the weather forecast"), to: subTitleLabel)
        styler.apply(textStyle: .submitButton("Submit"), to: doneButton)
        styler.apply(textStyle: .inputField("dummy"), to: inputField)
    }
}
