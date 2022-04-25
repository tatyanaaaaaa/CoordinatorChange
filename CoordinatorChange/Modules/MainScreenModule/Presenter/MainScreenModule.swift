//
//  MainScreenModule.swift
//  CoordinatorChange
//
//  Created by Tatiana Sosina on 25.04.2022.
//

import UIKit

protocol MainScreenModuleOutput: AnyObject {
    
    func showNewScreenAction()
}

protocol MainScreenModuleInput: AnyObject {
    
}

typealias MainScreenModule = UIViewController & MainScreenModuleInput

final class MainScreenViewController: MainScreenModule {
    
    weak var moduleOutput: MainScreenModuleOutput?
    
    private let moduleView: MainScreenViewInput & UIView
    private let interactor: MainScreenInteractorInput
    private let factory: MainScreenFactoryInput
    
    init(moduleView: MainScreenViewInput & UIView, interactor: MainScreenInteractorInput, factory: MainScreenFactoryInput) {
        self.moduleView = moduleView
        self.interactor = interactor
        self.factory = factory
        super .init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        view = moduleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Appearents().setTitle
        interactor.getContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MainScreenViewController {
    struct Appearents {
        let setTitle = "Main screen"
    }
}

extension MainScreenViewController: MainScreenViewOutput {
    func switchButtonAction() {
        moduleView.changeBackgroundColor()
        moduleOutput?.showNewScreenAction()
    }
}

extension MainScreenViewController: MainScreenFactoryOutput {
    
}

extension MainScreenViewController: MainScreenInteractorOutput {
    func didRecive(text: String) {
        moduleView.set(text: text)
    }
}
