//
//  DetailScreenView.swift
//  CoordinatorChange
//
//  Created by Tatiana Sosina on 25.04.2022.
//

import UIKit

protocol DetailScreenViewOutput: AnyObject {
    
    /// Пользователь нажал на кнопку
    func closeButtonAction()
}

protocol DetailScreenViewInput: AnyObject {
    
}

final class DetailScreenView: UIView & DetailScreenViewInput {
    
    weak var output: DetailScreenViewOutput?
    
    private let textLabel = UILabel()
    private let closeButton = UIButton()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupConstraints()
        setupDefaultSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDefaultSettings() {
        textLabel.textColor = .black
        
        closeButton.setTitleColor(.orange, for: .normal)
        closeButton.setTitle(Appearents().setTextButton, for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        
        backgroundColor = .white
    }
    
    @objc private func closeButtonAction() {
        output?.closeButtonAction()
    }
    
    private func setupConstraints() {
        [textLabel, closeButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            closeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            closeButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Appearents().padding)
        ])
    }
}

extension DetailScreenView {
    struct Appearents {
        let setTextButton = "Закрыть экран"
        let padding:CGFloat = 30
    }
}
