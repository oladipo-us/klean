import Foundation
import UIKit

import KleanFoundation
import KleanUIModels

open class KleanListUI<ActionType: Hashable, IdentifierType: Hashable, SectionType: Hashable>: KleanUI {
    
    // MARK: - Public
    
    public typealias DataSourceType = UICollectionViewDiffableDataSource<SectionType, KleanLabelItemUIModel<ActionType, IdentifierType>>
    public typealias ListCellRegistrationType = UICollectionView.CellRegistration<UICollectionViewListCell, KleanLabelItemUIModel<ActionType, IdentifierType>>
    
    required public init(translatesAutoresizingMaskIntoConstraints tamic: Bool = true) {
        super.init(translatesAutoresizingMaskIntoConstraints: tamic)

        list.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(list)
    }
    
    required public init?(coder: NSCoder) {
        fatal_klean_notImplemented("init(coder:)")
    }
    
    public lazy var list: UICollectionView = {
        buildList(listLayout: listLayout)
    }()
    
    public lazy var listDataSource: DataSourceType = {
        buildListDataSource(
            list: list,
            cellRegistration: listCellRegistration)
    }()
    
    // MARK: - Internal
    
    lazy var listCellRegistration: ListCellRegistrationType = {
        buildListCellRegistration()
    }()
    
    lazy var listLayout: UICollectionViewLayout = {
        buildListLayout()
    }()
    
    // MARK: - Private
    
    private func buildList(
        listLayout: UICollectionViewLayout
    ) -> UICollectionView
    {
        return UICollectionView(
            frame: .zero,
            collectionViewLayout: listLayout)
    }
    
    private func buildListCellRegistration(
    ) -> ListCellRegistrationType
    {
        return ListCellRegistrationType { (cell, indexPath, item) in
            
            var content = cell.defaultContentConfiguration()
            content.text = item.labelString
            cell.accessories = item.shouldShowDisclosure ? [.disclosureIndicator()] : []
            cell.contentConfiguration = content
        }
    }
    
    private func buildListDataSource(
        list: UICollectionView,
        cellRegistration: ListCellRegistrationType
    ) -> DataSourceType
    {
        return DataSourceType(
            collectionView: list)
        { list, indexPath, identifier -> UICollectionViewCell? in
            return list.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        }
    }
    
    private func buildListLayout(
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
