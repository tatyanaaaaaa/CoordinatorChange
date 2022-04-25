//
//  DetailScreenModule.swift
//  CoordinatorChange
//
//  Created by Tatiana Sosina on 25.04.2022.
//

import UIKit

protocol DetailScreenModuleOutput: AnyObject {
    
  
}

protocol DetailScreenModuleInput: AnyObject {
    
}

typealias DetailScreenModule = UIViewController & DetailScreenModuleInput

final class DetailScreenViewController: DetailScreenModule {
    
    weak var moduleOutput: DetailScreenModuleOutput?
    
    private let moduleView: DetailScreenViewInput & UIView
    private let interactor: DetailScreenInteractorInput
    private let factory: DetailScreenFactoryInput
    
    init(moduleView: DetailScreenViewInput & UIView, interactor: DetailScreenInteractorInput, factory: DetailScreenFactoryInput) {
        self.moduleView = moduleView
        self.interactor = interactor
        self.factory = factory
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = moduleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension DetailScreenViewController: DetailScreenViewOutput {
    
}

extension DetailScreenViewController: DetailScreenFactoryOutput {
    
}

extension DetailScreenViewController: DetailScreenInteractorOutput {
    
}
