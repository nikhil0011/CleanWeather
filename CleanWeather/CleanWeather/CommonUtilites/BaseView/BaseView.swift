//
//  NFBaseView.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import UIKit
protocol BaseViewProtocol: AnyObject {
    func setupViews()
}

class BaseView: UIView, BaseViewProtocol {
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    // MARK: Override SetupViews in custom view
    open func setupViews() {
       
    }
}

