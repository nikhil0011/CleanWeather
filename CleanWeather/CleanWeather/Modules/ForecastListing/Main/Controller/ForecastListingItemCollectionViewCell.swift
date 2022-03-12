//
//  ForecastListingItemCollectionViewCell.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import UIKit

class ForecastListingItemCollectionViewCell: BaseCollectionViewCell, ConfigurableCell {
    typealias T = ForecastItemListingViewModel
    
    let styler = ForecastListingStyler.myModule
    lazy var cellView: ForecastListingItemView = ForecastListingItemView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.backgroundColor = LColor.surface
    }
    
    override func prepareForReuse() {
    }
    
    override func setupViews() {
        backgroundColor = LColor.surface.alpha(with: .opacity24)
        stack(cellView)
    }
    func configure(_ item: T, at indexPath: IndexPath) {
        self.cellView.setupInfo(viewModel: item)
    }
}

