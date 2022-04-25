//
//  DetailScreenInteractor.swift
//  CoordinatorChange
//
//  Created by Tatiana Sosina on 25.04.2022.
//

import UIKit

protocol DetailScreenInteractorOutput: AnyObject {
    
}

protocol DetailScreenInteractorInput: AnyObject {
    
}

final class DetailScreenInteractor: DetailScreenInteractorInput {
    
    weak var output: DetailScreenInteractorOutput?
}
