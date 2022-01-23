//
//  PersonalInfoViewController.swift
//  HackathonPrototyping
//
//  Created by Aysel Heydarova on 22.01.22.
//

import UIKit

class PersonalInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Introduce yourself"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func loadView() {
        let personalInfoView = PersonalInfoView(frame: UIScreen.main.bounds)
        personalInfoView.delegate = self
        view = personalInfoView
    }
}

extension PersonalInfoViewController: PersonalInfoViewDelegate {
    func submitTapped() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate
          else {
            return
          }
          sceneDelegate.window?.rootViewController = TabbarViewController()
    }
}
