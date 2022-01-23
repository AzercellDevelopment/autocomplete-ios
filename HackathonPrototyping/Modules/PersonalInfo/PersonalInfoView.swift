//
//  PersonalInfoView.swift
//  HackathonPrototyping
//
//  Created by Aysel Heydarova on 22.01.22.
//

import UIKit

protocol PersonalInfoViewDelegate: AnyObject {
    func submitTapped()
}

class PersonalInfoView: UIView {
    weak var delegate: PersonalInfoViewDelegate?

    private lazy var textFieldsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()

    private lazy var nameTextField: CustomTextfield = {
        let textfield = CustomTextfield()
        textfield.placeholder = "Enter your name"
        return textfield
    }()

    private lazy var surnameTextField: CustomTextfield = {
        let textfield = CustomTextfield()
        textfield.placeholder = "Enter your surname"
        return textfield
    }()

    private lazy var optionsView: RadioButtonsView = {
        let stackView = RadioButtonsView(options: ["I am looking for an idea", "I have an idea" ])
        return stackView
    }()

    private lazy var submitButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Submit", for: .normal)
        button.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func submitTapped() {
        delegate?.submitTapped()
    }

    private func addSubviews() {
        let mainViews = [textFieldsStack,
                         optionsView,
                         submitButton]

        mainViews.forEach { view in
            self.addSubview(view)
        }

        textFieldsStack.addArrangedSubview(nameTextField)
        textFieldsStack.addArrangedSubview(surnameTextField)
    }

    private func makeConstraints() {

        textFieldsStack.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        optionsView.snp.makeConstraints { make in
            make.top.equalTo(textFieldsStack.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        submitButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
}
