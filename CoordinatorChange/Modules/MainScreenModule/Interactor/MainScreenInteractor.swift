//
//  MainScreenInteractor.swift
//  CoordinatorChange
//
//  Created by Tatiana Sosina on 25.04.2022.
//

import UIKit

protocol MainScreenInteractorOutput: AnyObject {
    
    /// Данные получены
    /// - Parameter text: получен текст
    func didRecive(text: String)
}

protocol MainScreenInteractorInput: AnyObject {
    
    /// Получить данные
    func getContent()
}

final class MainScreenInteractor: MainScreenInteractorInput {
    
    weak var output: MainScreenInteractorOutput?
    
    func getContent() {
        output?.didRecive(text: Appearents().setText)
    }
}

extension MainScreenInteractor {
    struct Appearents {
        let setText = "Готово"
    }
}
