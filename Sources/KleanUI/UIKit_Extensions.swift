import Foundation
import UIKit

extension UICollectionView {
    
    final class Factory {
    
        static func construct(
            delegate: UICollectionViewDelegate,
            uiCollectionViewLayout: UICollectionViewLayout
        ) -> UICollectionView
        {
            let collectionView = UICollectionView(
                frame: .zero,
                collectionViewLayout: uiCollectionViewLayout)
            
            collectionView.delegate = delegate
            
            return collectionView
        }
    }
}

extension UICollectionViewLayout {
    
    final class Factory {
    
        static func construct(
        ) -> UICollectionViewLayout
        {
            return UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
                
                let configuration = UICollectionLayoutListConfiguration(
                    appearance: .insetGrouped)
                
                let section = NSCollectionLayoutSection.list(
                    using: configuration,
                    layoutEnvironment: layoutEnvironment)
                
                return section
            }
        }
    }
}
