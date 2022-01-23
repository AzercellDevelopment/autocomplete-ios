//
//  LoginViewController.swift
//  HackathonPrototyping
//
//  Created by Aysel Heydarova on 22.01.22.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    override func loadView() {
        let loginView = LoginView(frame: UIScreen.main.bounds)
        loginView.delegate = self
        view = loginView
    }
}

extension LoginViewController: LoginViewDelegate {
    func nextButtonClicked() {
        navigationController?.pushViewController(PersonalInfoViewController(), animated: true)
    }
}

