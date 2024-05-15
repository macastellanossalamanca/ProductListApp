//
//  View.swift
//  ProductListApp
//
//  Created by Miguel Castellanos on 13/05/24.
//

import UIKit

class ResultViewController: BaseViewController {
    
    var presenter: ResultPresenterProtocol?
    
    private lazy var productsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProductViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    required init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var productListView: ProductListView?

    override func loadView() {
        self.productListView = ProductListView()
        self.view = self.productListView
    }
    
    func didFetchProducts() {
        if presenter?.numberOfItems() == 0 {
            self.productListView?.showEmptySearch()
        } else {
            self.productListView?.showResultsTable(tableView: productsTableView)
        }
    }

    func didNotFetchProducts() {
        self.productListView?.showError()
    }
}

extension ResultViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell Selected")
    }
}

extension ResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.presenter?.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductViewCell
        
        cell.product = presenter?.products[indexPath.row]
        
        return cell
    }
}

