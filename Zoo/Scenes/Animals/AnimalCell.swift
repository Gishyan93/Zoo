//
//  AnimalCellTableViewCell.swift
//  Zoo
//
//  Created by Tigran Gishyan on 21.05.22.
//

import UIKit

class AnimalCell: UITableViewCell {

    var animalImageView: UIImageView!
    var name: UILabel!
    
    var data: Animal? {
        didSet {
            guard let data = data else { return }
            animalImageView.image = UIImage(named: data.imageString)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        initImageView()
        consructHierarchy()
        activateConstraints()
    }
}

extension AnimalCell {
    func initImageView() {
        animalImageView = UIImageView()
        animalImageView.layer.cornerRadius = 50
        animalImageView.image = UIImage(named: "Mammals")
        animalImageView.clipsToBounds = true
        animalImageView.contentMode = .scaleAspectFill
        animalImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func consructHierarchy() {
        addSubview(animalImageView)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            animalImageView.widthAnchor.constraint(equalToConstant: 100),
            animalImageView.heightAnchor.constraint(equalToConstant: 100),
            
            animalImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            animalImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            animalImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
