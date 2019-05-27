//
//  CreateGoalsView.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 03/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

protocol CreateGoalsDelegate: class{
    func getInputsByCell() -> UITableViewCell
}


class CreateGoalsViewCell: UITableViewCell, ConfigurableView {
    
    lazy var contentText: UILabel = {
        let label = UILabel(text: "", sizeFont: 24)
        label.font = UIFont.appFont(with: 20, and: .extraBold)
        return label
    }()
    
    lazy var contextTf: UITextField = {
        let textView = UITextField(indentifier: "contextTf")
        textView.font = UIFont.appFont(with: 14, and: .regular)
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func buildViewHierarchy() {
        addSubview(contentText)
        addSubview(contextTf)
        self.backgroundColor = .tableViewColor
        setupConstraints()
    }
     func setupConstraints(){
        NSLayoutConstraint.activate([
            contentText.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            contentText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            contextTf.bottomAnchor.constraint(equalTo: bottomAnchor),
            contextTf.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
            ])
    }
}
