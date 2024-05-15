//
//  SearchViewController.swift
//  ProductListApp
//
//  Created by Miguel Castellanos on 13/05/24.
//

import UIKit

class SearchViewController: BaseViewController {
    
    private let searchBar = UISearchBar()
    var presenter: SearchPresenterProtocol?
    
    private let image: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "banner")
        return img
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setupUI()
        view.addSubview(image)
        setupLayout()
    }
    
    func setupUI() {
        self.view = UIView()
        self.view.backgroundColor = .yellow
        
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        searchBar.sizeToFit()
        searchBar.searchTextField.textColor = .black
        searchBar.searchTextField.backgroundColor = .white
        searchBar.placeholder = "Busca en Mercado Libre"
        searchBar.searchTextField.layer.cornerRadius = 18
        searchBar.searchTextField.layer.masksToBounds = true
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        presenter?.searchProducts(searchText: searchBar.text ?? "")
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.becomeFirstResponder()
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = nil
        searchBar.resignFirstResponder()
    }
}
