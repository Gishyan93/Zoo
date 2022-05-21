//
//  AnimalTypeButton.swift
//  Zoo
//
//  Created by Tigran Gishyan on 16.05.22.
//

import UIKit

struct AnimalTypeButtonData {
    var id: Int
    var image: String
    var name: String
}

protocol AnimalButtonDelegate: AnyObject {
    func buttonPressed(id: Int)
}

class AnimalTypeButton: UIView {
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var button: UIButton!
    var onSelection: ((Int) -> Void)?
    
    private(set) var data: AnimalTypeButtonData?
    weak var delegate: AnimalButtonDelegate?
    
    init() {
        super.init(frame: .zero)
        commonInit()
        
        button.addTarget(
            self,
            action: #selector(buttonPressed),
            for: .touchUpInside
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonPressed() {
        guard let data = data else { return }
        delegate?.buttonPressed(id: data.id)
    }
    
    func set(data: AnimalTypeButtonData) {
        self.data = data
        imageView.image = UIImage(named: data.image)
        titleLabel.text = data.name
    }
    
    func commonInit() {
        layer.cornerRadius = 12
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        initImageView()
        initTitleLabel()
        initButton()
        constructHierarchy()
        activateConstraints()
    }
}

extension AnimalTypeButton {
    func initImageView() {
        imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initTitleLabel() {
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    func initButton() {
        button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constructHierarchy() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(button)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            // Relative constraint
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
