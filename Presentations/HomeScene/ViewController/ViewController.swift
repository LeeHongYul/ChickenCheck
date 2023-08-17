//
//  ViewController.swift
//  ChickenCheck
//
//  Created by 이홍렬 on 2023/08/16.
//

import UIKit

let cellID = "Cell"

class ViewController: UIViewController {
    let testData = ["전체", "스테이크", "소세지", "볶음밥", " 큐브"]

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)

        return cv
    }()

    private let mainView: UIView = {
        let view = UIView()

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: cellID)

        setViews()
        configureCollectionView()
    }

    func setViews() {
        view.addSubview(collectionView)
        view.addSubview(mainView)
    }
    
    func configureCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: mainView.topAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 1.0 / 9.0),
        ])
        collectionView.collectionViewLayout = creatLayout()

        mainView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            mainView.leftAnchor.constraint(equalTo: collectionView.leftAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainView.rightAnchor.constraint(equalTo: collectionView.rightAnchor)
        ])

        mainView.backgroundColor = .yellow
    }

    func creatLayout() -> UICollectionViewLayout {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging

        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HomeCollectionViewCell

        cell.homeLabel.text = testData[indexPath.row].description

        cell.backgroundColor = .red
        return cell
    }

}

extension ViewController: UICollectionViewDelegate {

}

