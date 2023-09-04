//
//  ViewController.swift
//  ChickenCheck
//
//  Created by 이홍렬 on 2023/08/16.
//

import UIKit

let cellID = "Cell"

class HomeViewController: UIViewController {
    let testData = ["전체", "스테이크", "소세지", "볶음밥", "큐브"]

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    private let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let noticeLabel: UILabel = {
        let label = UILabel()
        label.text = "20개 남았습니다."
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let showButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Show All", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .blue
        button.layer.cornerRadius = 12
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let foodImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "chickenBreast"))
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return imageView
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        mainView.addSubview(stackView)
        [foodImage, noticeLabel].map {
            stackView.addArrangedSubview($0)
        }
        mainView.addSubview(showButton)
    }

    func configureCollectionView() {

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10),
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

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            stackView.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20),
//            stackView.bottomAnchor.constraint(equalTo: showButton.topAnchor, constant: -20),
            stackView.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20),
        ])

        NSLayoutConstraint.activate([
            showButton.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20),
            showButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20),
            showButton.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20)
            //            showButton.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            //            showButton.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
        ])

        showButton.backgroundColor = .gray
        showButton.addTarget(self, action: #selector(addItemsButton), for: .touchUpInside)
    }

    @objc func addItemsButton() {
        let nextVC = AddItemsViewController()
        navigationController?.pushViewController(nextVC, animated: true)
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

extension HomeViewController: UICollectionViewDataSource {
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

extension HomeViewController: UICollectionViewDelegate {

}

