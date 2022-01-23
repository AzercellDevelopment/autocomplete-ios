//
//  RadioButtonsView.swift
//  HackathonPrototyping
//
//  Created by Aysel Heydarova on 22.01.22.
//

import UIKit

class RadioButtonsView: UIView {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()

    var selectedIndex = 0
    let options: [String]

    init(options: [String]) {
        self.options = options
        super.init(frame: .zero)
        addSubview(stackView)
        makeConstraint()
        setOptions(options: options)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setOptions(options: [String]) {
        options.enumerated().forEach { index, title in
            let optionView = OptionView()
            optionView.radioButton.tag = index
            optionView.radioButton.isChecked = index == selectedIndex
            optionView.label.text = title
            optionView.radioButton.addTarget(self, action: #selector(optionSelected(button:)), for: .touchUpOutside)
            stackView.addArrangedSubview(optionView)
        }
    }

    // TODO: fix radio button selection

    @objc func optionSelected(button: UIButton) {
        selectedIndex = button.tag
        stackView.arrangedSubviews.forEach { view in
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        setOptions(options: options)
    }

    func makeConstraint() {
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}
