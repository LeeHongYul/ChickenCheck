//
//  HomeCollectionViewCell.swift
//  ChickenCheck
//
//  Created by 이홍렬 on 2023/08/17.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

   let homeLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 12

        setUI()
        configureLabelConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setUI()
        configureLabelConstraint()
    }

    private func setUI() {
        self.addSubview(homeLabel)
    }

    private func configureLabelConstraint() {
        homeLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            homeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            homeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])

    }
}
