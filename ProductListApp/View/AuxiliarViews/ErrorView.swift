//
//  ErrorView.swift
//  ProductListApp
//
//  Created by Miguel Castellanos on 14/05/24.
//

import UIKit

class ErrorView: UIView {

    // MARK: Views
    private let image: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "error")
        return img
    }()
    
    private let errorLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Ooops, algo salió mal...\nintenta de nuevo más tarde."
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        lbl.textColor = UIColor.black
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        return lbl
    }()

    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        self.addSubview(image)
        self.addSubview(errorLbl)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout
    private func setupLayout() {
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 250),
            image.widthAnchor.constraint(equalToConstant: 250),
            
            errorLbl.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            errorLbl.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
