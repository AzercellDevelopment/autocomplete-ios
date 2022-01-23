//
//  LoginView.swift
//  HackathonPrototyping
//
//  Created by Aysel Heydarova on 22.01.22.
//

import UIKit


protocol LoginViewDelegate: AnyObject {
    func nextButtonClicked()
}

class LoginView: UIView {
    weak var delegate: LoginViewDelegate?

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "lightbulb.circle")
        return imageView
    }()

    private lazy var emailTextField: CustomTextfield = {
        let textfield = CustomTextfield()
        textfield.placeholder = "Enter your email"
        return textfield
    }()

    private lazy var nextButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Continue", for: .normal)
        return button
    }()

    private lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "OR"
        label.textAlignment = .center
        return label
    }()

    private var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()

    private lazy var signInWithGoogle: UIButton = {
        let button = UIButton()
        button.setTitle("Sign in with Google", for: .normal)
        button.backgroundColor = .red
        return button
    }()

    private lazy var signInWithFacebook: UIButton = {
        let button = UIButton()
        button.setTitle("Sign in with Facebook", for: .normal)
        button.backgroundColor = .blue
        return button
    }()

    private lazy var signInWithApple: UIButton = {
        let button = UIButton()
        button.setTitle("Sign in with Apple", for: .normal)
        button.backgroundColor = .black
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func nextButtonTapped() {
        delegate?.nextButtonClicked()
    }

   private func addSubviews() {
        let allViews = [imageView,
                        emailTextField,
                        nextButton,
                        orLabel,
                        buttonsStackView]


        let buttons = [signInWithGoogle,
                       signInWithFacebook,
                       signInWithApple]

        buttons.forEach { button in
            buttonsStackView.addArrangedSubview(button)
        }

       allViews.forEach { view in
           self.addSubview(view)
       }

    }


    private func makeConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(150)
            make.size.equalTo(CGSize(width: 100, height: 100))
            make.centerX.equalToSuperview()
        }

        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        nextButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        orLabel.snp.makeConstraints { make in
            make.top.equalTo(nextButton.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        buttonsStackView.snp.makeConstraints { make in
            make.top.equalTo(orLabel.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
}
