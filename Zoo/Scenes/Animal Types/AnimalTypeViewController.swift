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

class BaseViewController: UIViewController {
    var languageId: Int?
}

class AnimalChoosingViewController: BaseViewController {
    
    var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        checkLanguage(with: languageId!)
        initLayout()
        createAnimalButtons()
        
        title = NSLocalizedString("animalType_title", comment: "")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gear"),
            style: .plain,
            target: self,
            action: #selector(gearButtonPressed)
        )
    }
    
    @objc func gearButtonPressed() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
    
    func checkLanguage(with Id: Int) {
        switch Id {
        case 0:
            print("Armenian")
        case 1:
            print("Russian")
        case 2:
            print("English")
        default:
            fatalError()
        }
    }
    
    func initLayout() {
        initStackView()
        constructHierarchy()
        activateConstraints()
    }
    
    func createAnimalButtons() {
        AnimalTypeData.animals.forEach { animal in
            let button = AnimalTypeButton()
            button.delegate = self
            button.translatesAutoresizingMaskIntoConstraints = false
            
            button.set(
                data: AnimalTypeButtonData(
                    id: animal.id, image: animal.imageName, name: animal.name
                )
            )
            
            stackView.addArrangedSubview(button)
        }
    }
}

extension AnimalChoosingViewController: AnimalButtonDelegate {
    func buttonPressed(id: Int) {
        let viewController = AnimalsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension AnimalChoosingViewController {
    func initStackView() {
        stackView = UIStackView()
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constructHierarchy() {
        view.addSubview(stackView)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            // Greater than or equal constraint
            stackView.bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor, constant: -30)
        ])
    }
}
