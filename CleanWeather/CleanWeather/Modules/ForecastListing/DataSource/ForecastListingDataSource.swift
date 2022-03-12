//
//  ForecastListingDataSource.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import UIKit
class ForecastListingDataSource: CollectionArrayDataSource<ForecastItemListingViewModel, ForecastListingItemCollectionViewCell> {

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
}
//extension ForecastListingDataSource: ItemHeaderViewDelegate {
//    func wishlistTapped(index: IndexPath?) {
//        let manager = WishlistManager()
//        if let indexPath = index, let viewModel = provider.item(at: indexPath) {
//            if viewModel.isItemInWishlist {
//                _ = manager.deleteWishlistItem(id: viewModel.id)
//            } else {
//                manager.appendWishlist(item: viewModel.item)
//            }
//        }
//    }
//}
