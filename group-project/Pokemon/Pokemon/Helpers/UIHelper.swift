//
//  UIHelper.swift
//  PokedexSearch
//
//  Created by Enes Kaya on 3.11.2023.
//

import UIKit

struct UIHelper {
    private enum ViewMetrics {
        static let bgColor = UIColor.systemBackground

        static let collectionViewBackgroundColor = UIColor.systemBackground
        static let collectionViewEdgeInsets = UIEdgeInsets(top: 12.0, left: 12.0, bottom: 12.0, right: 12.0)
        static let collectionViewMinimumItemSpacing: CGFloat = 10.0
        static let collectionViewExtraVerticalSpace: CGFloat = 30.0
    }

    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let sidePadding = ViewMetrics.collectionViewEdgeInsets.left + ViewMetrics.collectionViewEdgeInsets.right
        let width                       = view.bounds.width
        let minItemSpacing = ViewMetrics.collectionViewMinimumItemSpacing
        let availableWidth              = width - sidePadding - (minItemSpacing * 2)
        let itemWidth                   = availableWidth / 3

        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.sectionInset = ViewMetrics.collectionViewEdgeInsets

        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + ViewMetrics.collectionViewExtraVerticalSpace)
        return flowLayout
    }
}
