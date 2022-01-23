//
//  OptionButton.swift
//  HackathonPrototyping
//
//  Created by Aysel Heydarova on 22.01.22.
//

import UIKit

class OptionView: UIView {

    lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()

    lazy var radioButton: RadioButton = {
        let button = RadioButton()
        return button
    }()

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 80)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 10
        semanticContentAttribute =  .forceLeftToRight
        addSubviews()
        makeConstrains()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        self.addSubview(label)
        self.addSubview(radioButton)
    }

    private func makeConstrains() {
        radioButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }

        label.snp.makeConstraints { make in
            make.firstBaseline.equalTo(radioButton)
            make.leading.equalTo(radioButton.snp.trailing).offset(8)
        }
    }
}
