//
//  FreeSuggestionCollectionViewCell.swift
//  HackathonPrototyping
//
//  Created by Aysel Heydarova on 22.01.22.
//

import UIKit
import Nuke

class FreeSuggestionCollectionViewCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var title: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var companyStack: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()

    private lazy var companyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var companyTitle: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var upvotes: UILabel = {
        let label = UILabel()
        return label
    }()

    func configureCell(imageURL: String, title: String, upVotes: Int) {
        Nuke.loadImage(with: imageURL, into: companyImageView)
        self.title.text = title
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
        imageView.addSubview(companyStack)
        imageView.addSubview(upvotes)

        companyStack.addArrangedSubview(companyTitle)
        companyStack.addArrangedSubview(companyImageView)
    }

    private func makeConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        title.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }

        companyImageView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 60, height: 60))
        }

        companyStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        upvotes.snp.makeConstraints { make in
            make.top.equalTo(imageView).offset(16)
            make.trailing.equalTo(imageView).offset(-8)
        }
    }
}
