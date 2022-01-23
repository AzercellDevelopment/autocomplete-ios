//
//  ProductCollectionViewCell.swift
//  HackathonPrototyping
//
//  Created by Aysel Heydarova on 22.01.22.
//

import UIKit
import Nuke

class ProductCollectionViewCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var infoView: UIView = {
        let view  = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .black.withAlphaComponent(0.5)
        return view
    }()

    private lazy var title: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var upvotes: UILabel = {
        let label = UILabel()
        return label
    }()

    func configureCell(imageURL: String, title: String, upVotes: Int) {
        Nuke.loadImage(with: URL(string: imageURL), into: imageView)
        self.title.text = title
        self.upvotes.text = String(describing: upVotes)

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
        addSubview(infoView)

        infoView.addSubview(title)
        infoView.addSubview(upvotes)
    }

    private func makeConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        infoView.snp.makeConstraints { make in
            make.edges.equalTo(imageView)
        }

        title.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }

        upvotes.snp.makeConstraints { make in
            make.top.equalTo(infoView).offset(16)
            make.trailing.equalTo(infoView).offset(-8)
        }
    }
}
