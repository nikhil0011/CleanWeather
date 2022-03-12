//
//  ForecastListingDataSource.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import UIKit
class ForecastListingDataSource: CollectionArrayDataSource<ForecastItemListingViewModel, ForecastListingItemCollectionViewCell> {
    var headerViewModel: ForecastHeaderViewModel?
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ForecastHeader.reuseIdentifier, for: indexPath) as? ForecastHeader else {
                return collectionView.defaultReusableview(indexPath)
            }
            headerView.configure(viewModel: headerViewModel)
            return headerView
        default:
            fatalError("Could not find supplementary view of \(kind)!")
        }
    }
}

extension ForecastListingDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let item = provider.item(at: indexPath) else { return CGSize.zero }
        let width = collectionView.frame.width - (item.sectionInset.left + item.sectionInset.right)
        let actual = (width - (item.interItemSpacing * 2))
        return .init(width: actual, height: item.itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        guard let item = provider.item(at: IndexPath(item: 0, section: section)) else { return .zero }
        return item.interItemSpacing
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        guard let item = provider.item(at: IndexPath(item: 0, section: section)) else { return .zero }
        return item.sectionInset
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard let item = provider.item(at: IndexPath(item: 0, section: section)) else { return .zero }
        return .init(width: collectionView.frame.width, height: 200)
    }
}
