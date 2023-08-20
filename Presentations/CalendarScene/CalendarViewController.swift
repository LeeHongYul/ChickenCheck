//
//  CalendarViewController.swift
//  ChickenCheck
//
//  Created by 이홍렬 on 2023/08/20.
//

import UIKit

class CalendarViewController: UIViewController {


    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Calendar"
        label.textAlignment = .center
        return label
    }()

    var calendarView: UICalendarView = {
        let view = UICalendarView()
        view.wantsDateDecorations = true
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        configureView()
    }

    func setView() {
        view.addSubview(titleLabel)
        view.addSubview(calendarView)
    }

    func configureView() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,constant: 0),
            titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: 0),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])

        calendarView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            calendarView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            calendarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            calendarView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}


