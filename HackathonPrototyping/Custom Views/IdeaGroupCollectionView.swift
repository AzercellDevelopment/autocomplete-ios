//
//  IdeaGroupCollectionView.swift
//  HackathonPrototyping
//
//  Created by Aysel Heydarova on 22.01.22.
//

import UIKit

class IdeaGroupCollectionView: UIView {
    private lazy var sectionName: UILabel = {
        let label  = UILabel()
        return label
    }()

    private lazy var seeAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See all", for: .normal)
        return button
    }()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 200)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        makeConstraints()
    }

    func configure(sectionName: String) {
        self.sectionName.text = sectionName
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews() {
        addSubview(sectionName)
        addSubview(seeAllButton)
        addSubview(collectionView)
    }

    func makeConstraints() {
        sectionName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(16)
        }

        seeAllButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.firstBaseline.equalTo(sectionName)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(sectionName.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()

        }
    }
}

