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
    View: KleanUI,
    Presenter: KleanUIPresenter,
    Logic: KleanLogic,
    Service: KleanLogicService,
    Gateway>: UIViewController where Presenter.Logic == Logic,
                                     Logic.Service == Service,
                                     Service.Gateway == Gateway
{
    // MARK: - Open
    
    open override func loadView() {
        self.view = View()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        
        service.configure(gateway: gateway)

        cancellables.formUnion(logic.configure(service: service))
        cancellables.formUnion(presenter.configure(logic: logic))
    }
    
    // MARK: - Internal

    public init(gateway g: Gateway) {
        gateway = g
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
    
    required public init?(coder: NSCoder) {
        fatal_klean_notImplemented("init(coder:)")
    }
    
    lazy var logic: Logic = { buildLogic() }()
    lazy var presenter: Presenter = { buildPresenter() }()
    lazy var service: Service = { buildService() }()
    
    var cancellables = Set<AnyCancellable>()
    
    var theView: View {
        return view as! View
    }
    
    let gateway: Gateway
    
    // MARK: - Builders
    
    func buildLogic() -> Logic
    {
        return Logic()
    }
    
    func buildPresenter() -> Presenter
    {
        return Presenter()
    }
    
    func buildService() -> Service
    {
        return Service()
    }
}
