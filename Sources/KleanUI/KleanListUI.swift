import Foundation
import UIKit

import KleanFoundation
import KleanUIModels

open class KleanListUI<ActionType: Hashable, IdentifierType: Hashable, SectionType: Hashable>: KleanUI {
    
    // MARK: - Public
    
    public typealias DataSourceType = UICollectionViewDiffableDataSource<SectionType, KleanLabelItemUIModel<ActionType, IdentifierType>>
    public typealias ListCellRegistrationType = UICollectionView.CellRegistration<UICollectionViewListCell, KleanLabelItemUIModel<ActionType, IdentifierType>>
    
    required public init(
        translatesAutoresizingMaskIntoConstraints tamic: Bool = true)
    {
        super.init(translatesAutoresizingMaskIntoConstraints: tamic)

        list.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(list)
    }
    
    required public init?(coder: NSCoder) {
        fatal_klean_notImplemented("init(coder:)")
    }
    
    public lazy var list: UICollectionView = {
        
        return UICollectionView.Factory.construct(
            uiCollectionViewLayout: listLayout)
    }()
    
    public lazy var listDataSource: DataSourceType = {
        
        return construct_ListDataSource(
            list: list,
            cellRegistration: listCellRegistration)
    }()
    
    // MARK: - Internal
    
    lazy var listCellRegistration: ListCellRegistrationType = { construct_ListCellRegistration() }()
    
    lazy var listLayout: UICollectionViewLayout = { UICollectionViewLayout.Factory.construct() }()
    
    // MARK: - Private
    
    private func construct_ListCellRegistration(
    ) -> ListCellRegistrationType
    {
        return ListCellRegistrationType(
        ) { (cell, indexPath, item) in

            var content = cell.defaultContentConfiguration()
            content.text = item.labelString
            cell.accessories = item.shouldShowDisclosure ? [.disclosureIndicator()] : []
            cell.contentConfiguration = content
        }
    }
    
    private func construct_ListDataSource(
        list: UICollectionView,
        cellRegistration: ListCellRegistrationType
    ) -> DataSourceType
    {
        return DataSourceType(
            collectionView: list
        ) { list, indexPath, identifier -> UICollectionViewCell? in
            
            return list.dequeueConfiguredReusableCell(
                using: cellRegistration,
                for: indexPath,
                item: identifier)
        }
    }
}
