import Foundation
import UIKit

import KleanFoundation
import KleanUIModels

public protocol KleanListUIDelgate: class {
    
    associatedtype ActionType: Hashable
    associatedtype IdentifierType: Hashable
    associatedtype SectionType: Hashable
    
    func handleSelection(
        kleanListUI: KleanListUI<ActionType, Self, IdentifierType, SectionType>,
        labelItem: KleanLabelItemUIModel<ActionType, IdentifierType>)
}

open class KleanListUI<
    ActionType,
    DelegateType: KleanListUIDelgate,
    IdentifierType,
    SectionType>
:
    KleanUI,
    UICollectionViewDelegate
where
    DelegateType.ActionType == ActionType,
    DelegateType.IdentifierType == IdentifierType,
    DelegateType.SectionType == SectionType
{
    // MARK: - Public - UICollectionViewDelegate Interface
    
    public func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath)
    {
        
        guard let labelItem = listDataSource.itemIdentifier(for: indexPath) else { return }
        
        delegate?.handleSelection(kleanListUI: self, labelItem: labelItem)
    }
    
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
    
    // MARK: - Internal
    
    lazy var list: UICollectionView = {
        return UICollectionView.Factory.construct(
            delegate: self,
            uiCollectionViewLayout: listLayout)
    }()
    
    lazy var listCellRegistration: ListCellRegistrationType = { construct_ListCellRegistration() }()
    
    lazy var listDataSource: DataSourceType = {
        
        return construct_ListDataSource(
            list: list,
            cellRegistration: listCellRegistration)
    }()
    
    lazy var listLayout: UICollectionViewLayout = { UICollectionViewLayout.Factory.construct() }()
    
    // MARK: - Private
    
    private weak var delegate: DelegateType? = nil
    
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
