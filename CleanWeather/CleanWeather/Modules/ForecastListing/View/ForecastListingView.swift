//
//  ForecastListingView.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import UIKit

class ForecastListingView: BaseView {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = LColor.surface
        view.contentInset = .init(top: 10, left: 0, bottom: 0, right: 0)
        view.register(cell: ForecastListingItemCollectionViewCell.self)
        return view
    }()
    override func setupViews() {
        stack(collectionView)
    }
}
