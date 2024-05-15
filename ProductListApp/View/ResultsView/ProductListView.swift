//
//  ProductListView.swift
//  ProductListApp
//
//  Created by Miguel Castellanos on 14/05/24.
//

import UIKit

class ProductListView: UIView {

    private var contentView: UIView
    
    override init(frame: CGRect) {
        contentView = UIView()
        super.init(frame: frame)
        
        self.addSubview(contentView)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showResultsTable(tableView: UITableView) {
        self.contentView.removeFromSuperview()
        self.contentView = tableView
        self.addSubview(self.contentView)
        setupLayout()
    }
    
    func showError() {
        self.contentView.removeFromSuperview()
        self.contentView = ErrorView()
        self.addSubview(self.contentView)
        setupLayout()
    }

    func showEmptySearch() {
        self.contentView.removeFromSuperview()
        self.contentView = EmptySearchView()
        self.addSubview(self.contentView)
        setupLayout()
    }
    
    private func setupLayout() {
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.leftAnchor.constraint(equalTo: self.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: self.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
