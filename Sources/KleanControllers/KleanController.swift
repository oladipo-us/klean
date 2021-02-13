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
    
    // MARK: - Open Builders
    
    open func buildLogic() -> Logic
    {
        return Logic()
    }
    
    open func buildPresenter() -> Presenter
    {
        return Presenter()
    }
    
    open func buildService() -> Service
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
    }
    
    // MARK: - Public

    public init(gateway g: Gateway) {
        gateway = g
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    public lazy var logic: Logic = { buildLogic() }()
    public lazy var presenter: Presenter = { buildPresenter() }()
    public lazy var service: Service = { buildService() }()
    
    public var cancellables = Set<AnyCancellable>()
    
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
}
