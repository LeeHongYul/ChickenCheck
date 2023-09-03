//
//  BaseViewController.swift
//  ChickenCheck
//
//  Created by 이홍렬 on 2023/08/17.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser


class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .yellow
        setView()
        setConstraint()
    }

    @objc func kakakoLoginButtonClicked() {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            // 카카오톡 로그인. api 호출 결과를 클로저로 전달.
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    // 예외 처리 (로그인 취소 등)
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                   // do something
                    _ = oauthToken
                   // 어세스토큰
                   let accessToken = oauthToken?.accessToken
                }
            }
          }
    }

    @objc func startButtonClicked() {
        print("Start Button Clicked")


        let firstVC = UINavigationController(rootViewController: HomeViewController())
        let secondVC = UINavigationController(rootViewController: CalendarViewController())

        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([firstVC, secondVC], animated: true)
        tabBarController.modalPresentationStyle = .fullScreen
        
        if let items = tabBarController.tabBar.items {
            items[0].selectedImage = UIImage(systemName: "plus")
            items[0].title = "Home"

            items[1].selectedImage = UIImage(systemName: "calendar")
            items[1].title = "Calendar"
        }


        self.present(tabBarController, animated: true)
    }

    private let kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오톡 로그인 버튼", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        return button
    }()

    private let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .red
        return button
    }()

    func setView() {
        view.addSubview(kakaoLoginButton)
        view.addSubview(startButton)
    }

    func setConstraint() {
        kakaoLoginButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            kakaoLoginButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            kakaoLoginButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
//            kakaoLoginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            kakaoLoginButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])

        kakaoLoginButton.addTarget(self, action: #selector(kakakoLoginButtonClicked), for: .touchUpInside)

        startButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: kakaoLoginButton.bottomAnchor),
            startButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            startButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])

        startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
    }


}
