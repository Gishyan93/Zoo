//
//  AnimalTypeViewController.swift
//  Zoo
//
//  Created by Tigran Gishyan on 11.05.22.
//

import UIKit

struct AnimalTypeData {
    var id: Int
    var name: String
    var imageName: String
    
    static var animals: [AnimalTypeData] = [
        AnimalTypeData(id: 1, name: "Mammals", imageName: "Mammals"),
        AnimalTypeData(id: 2, name: "Birds", imageName: "Mammals"),
        AnimalTypeData(id: 3, name: "Fishes", imageName: "Mammals")
    ]
}

class AnimalChoosingViewController: UIViewController {
    var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initLayout()
        createAnimalButtons()
    }
    
    func initLayout() {
        initStackView()
        constructHierarchy()
        activateConstraints()
    }
    
    func createAnimalButtons() {
        AnimalTypeData.animals.forEach { animal in
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(UIImage(named: "Mammals"), for: .normal)
            
            button.tag = animal.id
            button.addTarget(
                self,
                action: #selector(animalButtonPressed),
                for: .touchUpInside
            )
            
            stackView.addArrangedSubview(button)
        }
    }
    
    @objc func animalButtonPressed(sender: UIButton) {
        print(sender.tag)
    }
}

extension AnimalChoosingViewController {
    func initStackView() {
        stackView = UIStackView()
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constructHierarchy() {
        view.addSubview(stackView)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}
