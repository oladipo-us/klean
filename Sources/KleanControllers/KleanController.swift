import Combine
import Foundation
import UIKit

import KleanFoundation
import KleanLogic
import KleanLogicServices
import KleanUI
import KleanUIModels
import KleanUIPresenters

open class KleanController<
    UI: KleanUI,
    Presenter: KleanUIPresenter,
    Logic: KleanLogic,
    Service: KleanLogicService,
    Gateway>: UIViewController where Presenter.Logic == Logic,
                                     Logic.Service == Service,
                                     Service.Gateway == Gateway
{
    // MARK: - Open Constructors
    
    open func constructLogic() -> Logic
    {
        return Logic()
    }
    
    open func constructPresenter() -> Presenter
    {
        return Presenter()
    }
    
    open func constructService() -> Service
    {
        return Service()
    }
    
    // MARK: - Open
    
    open override func loadView() {
        self.view = UI()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        service.configure(gateway: gateway)

        cancellables.formUnion(logic.configure(service: service))
        cancellables.formUnion(presenter.configure(logic: logic))
        
        cancellables.formUnion(
            connect(
                presenter: presenter,
                ui: ui,
                controller: self))
    }
    
    open func connect(
        presenter: Presenter,
        ui: UI,
        controller: KleanController<UI, Presenter, Logic, Service, Gateway>
    ) -> Set<KleanCancellable>
    {
        guard let titlePresenter = presenter as? KleanUINavigationItemTitlePresenter else {
            
            return  KleanCancellable.Factory.constructSet(
                cancellableList: [])
        }
        
        return KleanCancellable.Factory.constructSet(cancellableList: [

            titlePresenter.navigationItemTitlePublisher
                .sink { title in
                    controller.navigationItem.title = title
                },
        ])
    }
    
    // MARK: - Public

    public init(
        gateway g: Gateway,
        isConnectImplemented ici: Bool = false)
    {
        gateway = g
        isConnectImplemented = ici
        
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    public lazy var logic: Logic = { constructLogic() }()
    public lazy var presenter: Presenter = { constructPresenter() }()
    public lazy var service: Service = { constructService() }()
    
    public var cancellables = Set<KleanCancellable>()
    
    public var ui: UI {
        return view as! UI
    }
    
    // MARK: - Internal

    deinit {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
    
    required public init?(coder: NSCoder) {
        fatal_klean_notImplemented("init(coder:)")
    }
    
    let gateway: Gateway
    let isConnectImplemented: Bool
}
