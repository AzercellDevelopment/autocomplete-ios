//
//  HomeViewController.swift
//  HackathonPrototyping
//
//  Created by Aysel Heydarova on 22.01.22.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    private var networkService:NetworkServiceProtocol  = NetworkService()

    private let productIdeasView: IdeaGroupCollectionView = {
        let view = IdeaGroupCollectionView()
        view.collectionView.tag = 0
        return view
    }()

    private let businessIdeasView: IdeaGroupCollectionView = {
        let view = IdeaGroupCollectionView()
        view.collectionView.tag = 1
        return view
    }()

    private let freeSuggestionsView: IdeaGroupCollectionView = {
        let view = IdeaGroupCollectionView()
        view.collectionView.tag = 2
        return view
    }()

    var productCellDetails: [Item] = []
    var businessIdeaItemDetails: [Item] = []
    var proposalItemDetails: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        let allViews = [productIdeasView, businessIdeasView, freeSuggestionsView]

        allViews.forEach { ideaView in
            view.addSubview(ideaView)
            ideaView.collectionView.dataSource = self
            ideaView.collectionView.delegate = self
            ideaView.collectionView.register(ProductCollectionViewCell.self,
                                    forCellWithReuseIdentifier: String(describing: ProductCollectionViewCell.self))

            ideaView.collectionView.register(BusinessIdeaCollectionViewCell.self,
                                    forCellWithReuseIdentifier: String(describing: BusinessIdeaCollectionViewCell.self))

            ideaView.collectionView.register(FreeSuggestionCollectionViewCell.self,
                                    forCellWithReuseIdentifier: String(describing: FreeSuggestionCollectionViewCell.self))
        }
    }

    private func makeConstraints() {
        productIdeasView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        businessIdeasView.snp.makeConstraints { make in
            make.top.equalTo(productIdeasView.snp.bottom).offset(32)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        freeSuggestionsView.snp.makeConstraints { make in
            make.top.equalTo(businessIdeasView.snp.bottom).offset(32)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }

    private func fetchData() {
        networkService.execute(AppEndpoints.home) { (result: Result< [HomeModel], AFError>) in
            switch result {
            case .success(let data):
                self.productIdeasView.configure(sectionName: data[0].title)
                self.businessIdeasView.configure(sectionName: data[1].title)
                self.freeSuggestionsView.configure(sectionName: data[2].title)

                self.productCellDetails.append(contentsOf: data[0].items)
                self.businessIdeaItemDetails.append(contentsOf: data[1].items)
                self.proposalItemDetails.append(contentsOf: data[2].items)

                self.productIdeasView.collectionView.reloadData()
                self.businessIdeasView.collectionView.reloadData()
                self.freeSuggestionsView.collectionView.reloadData()

            case .failure(let error):
                print(error)
            }
        }
    }

    private func fetchDetailData(id: Int) {
//        networkService.execute(AppEndpoints.productDetails(id: id)) { (result: Swift.Result<ProductDetailModel, AFError>) in
//            switch result {
//            case .success(let data):
//                print(data)
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return productCellDetails.count
        case 1:
            return businessIdeaItemDetails.count
        case 2:
            return proposalItemDetails.count
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProductCollectionViewCell.self),for: indexPath) as? ProductCollectionViewCell

            guard let productCell = cell else { return UICollectionViewCell()}
            productCell.configureCell(imageURL: productCellDetails[indexPath.row].imageURL ?? "",
                                      title: productCellDetails[indexPath.row].title,
                                      upVotes: productCellDetails[indexPath.row].upvotes)
            return productCell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BusinessIdeaCollectionViewCell.self),for: indexPath) as? BusinessIdeaCollectionViewCell

            guard let productCell = cell else { return UICollectionViewCell()}
            let currentCell =  businessIdeaItemDetails[indexPath.row]
            productCell.configureCell(imageURL: currentCell.imageURL ?? "",
                                      title: currentCell.title,
                                      description: currentCell.itemDescription ?? "",
                                      upVotes: currentCell.upvotes)
            return productCell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FreeSuggestionCollectionViewCell.self),for: indexPath) as? FreeSuggestionCollectionViewCell

            guard let productCell = cell else { return UICollectionViewCell()}
            let currentCell = proposalItemDetails[indexPath.row]
            productCell.configureCell(imageURL: currentCell.imageURL ?? "" ,
                                      title: currentCell.title,
                                      upVotes: currentCell.upvotes)
            return productCell
        default:
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsPage = DetailViewController(nibName: "DetailViewController", bundle: nil)
        show(detailsPage, sender: self)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: collectionView.frame.height)
    }
}
