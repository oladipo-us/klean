import Foundation
import UIKit

extension UICollectionView {
    
    final class Factory {
    
        static func construct(
            uiCollectionViewLayout: UICollectionViewLayout
        ) -> UICollectionView
        {
            return UICollectionView(
                frame: .zero,
                collectionViewLayout: uiCollectionViewLayout)
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
