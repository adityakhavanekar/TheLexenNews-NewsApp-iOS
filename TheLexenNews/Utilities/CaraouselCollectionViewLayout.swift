//
//  CaraouselCollectionViewLayout.swift
//  TheLexenNews
//
//  Created by Aditya Khavanekar on 8/8/24.
//

import Foundation
import UIKit

class CaraouselCollectionViewLayout: UICollectionViewFlowLayout {
    
    let activeDistance: CGFloat = 200
    let zoomFactor: CGFloat = 0.3
    
    override func prepare() {
        super.prepare()
        scrollDirection = .horizontal
        minimumLineSpacing = 35
        itemSize = CGSize(width: 300, height: 200) // Adjust size as needed
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        let centerX = collectionView!.contentOffset.x + collectionView!.bounds.width / 2
        
        attributes?.forEach { attribute in
            let distance = abs(attribute.center.x - centerX)
            let normalizedDistance = distance / activeDistance
            if distance < activeDistance {
                let zoom = 1 + zoomFactor * (1 - normalizedDistance)
                attribute.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0)
                attribute.zIndex = Int(zoom.rounded())
            } else {
                attribute.transform3D = CATransform3DIdentity
            }
        }
        
        return attributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
