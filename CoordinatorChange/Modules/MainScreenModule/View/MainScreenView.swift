//
//  MainScreenView.swift
//  CoordinatorChange
//
//  Created by Tatiana Sosina on 25.04.2022.
//

import UIKit

protocol MainScreenViewOutput: AnyObject {
    
    /// Пользователь нажал на кнопку
    func switchButtonAction()
}

protocol MainScreenViewInput: AnyObject {
    
    /// Установить текст
    /// - Parameter text
    func set(text: String)
    
    /// Изменение цвета экрана
    func changeBackgroundColor()
}

final class MainScreenView: MainScreenViewInput & UIView {
    
    weak var output: MainScreenViewOutput?
    
    private let switchButton = UIButton()
    private let textLabel = UILabel()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupDefaultSettings()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func switchButtonAction() {
        output?.switchButtonAction()
    }
    
    public func set(text: String) {
        textLabel.text = text
    }
    
    public func changeBackgroundColor() {
        backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1), alpha: 1)
    }
    
    
    private func setupDefaultSettings() {
        switchButton.setTitleColor(.blue, for: .normal)
        switchButton.setTitle(Appearents().textButton, for: .normal)
        switchButton.addTarget(self, action: #selector(switchButtonAction), for: .touchUpInside)
        
        textLabel.textColor = .black
        
        backgroundColor = .white
    }
    
    private func setupConstraints() {
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(switchButton)
        addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            switchButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            switchButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Appearents().padding)
        ])
    }
}

extension MainScreenView {
    struct Appearents {
        let textButton = "Нажать для перехода на следующий экран"
        let padding: CGFloat = 30
    }
}
