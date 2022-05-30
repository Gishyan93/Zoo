//
//  AnimalsViewController.swift
//  Zoo
//
//  Created by Tigran Gishyan on 17.05.22.
//

import UIKit

struct Animal {
    var imageString: String
    var name: String
    var info: String
}

struct Animals {
    static func getAnimals() -> [Animal] {
        var animals: [Animal] = []
        animals.append(
            Animal(
                imageString: "Mammals",
                name: "Colibri",
                info: "Lives in South America."
            )
        )
        
        animals.append(
            Animal(
                imageString: "Mammals",
                name: "Colibri",
                info: "Lives in South America."
            )
        )
        
        animals.append(
            Animal(
                imageString: "Mammals",
                name: "Colibri",
                info: "Lives in South America."
            )
        )
        
        return animals
    }
}

class AnimalsViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(
            AnimalCell.self, forCellReuseIdentifier: "cell"
        )
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Animals.getAnimals().count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        ) as! AnimalCell
        
        cell.data = Animals.getAnimals()[indexPath.row]
        
        return cell
    }
}
