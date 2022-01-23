//
//  BusinessIdeaCollectionViewCell.swift
//  HackathonPrototyping
//
//  Created by Aysel Heydarova on 22.01.22.
//

import UIKit
import Nuke

class BusinessIdeaCollectionViewCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    private lazy var descriptionText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    private lazy var upvotes: UILabel = {
        let label = UILabel()
        return label
    }()

    func configureCell(imageURL: String,
                       title: String,
                       description: String,
                       upVotes: Int) {
        Nuke.loadImage(with: URL(string: imageURL), into: imageView)
        self.title.text = title
        self.descriptionText.text = description
        self.upvotes.text = String(describing: upvotes)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 20
        layer.masksToBounds = true
        addSubviews()
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        addSubview(imageView)

        imageView.addSubview(title)
        imageView.addSubview(descriptionText)
        imageView.addSubview(upvotes)
    }

    private func makeConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        title.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(32)
        }

        descriptionText.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)

            make.top.equalTo(title.snp.bottom).offset(8)
        }

        upvotes.snp.makeConstraints { make in
            make.top.equalTo(imageView).offset(16)
            make.trailing.equalTo(imageView).offset(-8)
        }
    }
}
