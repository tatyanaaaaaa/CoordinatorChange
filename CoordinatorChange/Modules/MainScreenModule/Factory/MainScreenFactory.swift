//
//  MainScreenFactory.swift
//  CoordinatorChange
//
//  Created by Tatiana Sosina on 25.04.2022.
//

import UIKit

protocol MainScreenFactoryOutput: AnyObject {
    
}

protocol MainScreenFactoryInput: AnyObject {
    
}

final class MainScreenFactory: MainScreenFactoryInput {
    
    weak var output: MainScreenFactoryOutput?
    
}
