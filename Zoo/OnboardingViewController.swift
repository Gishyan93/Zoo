//
//  OnboardingViewController.swift
//  Zoo
//
//  Created by Tigran Gishyan on 11.05.22.
//

import UIKit

class OnboardingViewController: UIViewController {
    var getStartedButton: UIButton!
    var welcomeLabel: UILabel!
    var pickerView: UIPickerView!
    
    var languages: [String] = ["Armenian", "Russian", "English"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initLayout()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        getStartedButton.addTarget(
            self, action: #selector(getStartedButtonPressed), for: .touchUpInside
        )
    }
    
    func initLayout() {
        initWelcomeLabel()
        initPickerView()
        initGetStartedButton()
        constructHierarchy()
        activateConstraints()
    }
    
    @objc func getStartedButtonPressed() {
        let viewController = AnimalChoosingViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension OnboardingViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(
        _ pickerView: UIPickerView, numberOfRowsInComponent component: Int
    ) -> Int {
        return 3
    }
    
    func pickerView(
        _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int
    ) -> String? {
        return languages[row]
    }
    
}

// MARK: - Layout
extension OnboardingViewController {
    func initWelcomeLabel() {
        welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome to Zoo"
        welcomeLabel.font = .systemFont(ofSize: 24, weight: .bold)
        welcomeLabel.textAlignment = .center
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initPickerView() {
        pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initGetStartedButton() {
        getStartedButton = UIButton(type: .system)
        getStartedButton.backgroundColor = .red
        getStartedButton.setTitle("Get Started", for: .normal)
        getStartedButton.layer.cornerRadius = 12
        getStartedButton.setTitleColor(.white, for: .normal)
        getStartedButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constructHierarchy() {
        view.addSubview(welcomeLabel)
        view.addSubview(pickerView)
        view.addSubview(getStartedButton)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            pickerView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            getStartedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            getStartedButton.heightAnchor.constraint(equalToConstant: 50),
            getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
