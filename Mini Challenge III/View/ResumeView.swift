//
//  ResumeView.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 09/05/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//
import UIKit

class ResumeView: UIView, ViewsNeed {
    fileprivate let goalLabel = UILabel(text: "A minha meta é:", sizeFont: 20)
    public lazy var goalDescription = UILabel(text: "Tornar meu perfil da rede social Y famoso")
    fileprivate lazy var howLabel = UILabel(text: "Com ela eu vou:", sizeFont: 20)
    public lazy var goalHow = UILabel (text: "Atingir X seguidores na minha rede social Y")
    fileprivate lazy var whatINeed = UILabel(text: "Para concluí-la eu preciso:", sizeFont: 20)
    public lazy var goalNeeds = UILabel(text: "Postar diariamente conteúdos mais atrativos da atualidade.")
    fileprivate lazy var when = UILabel(text: "E isso levará:", sizeFont: 20)
    public lazy var goalWhen = UILabel(text: "2 Meses.")
    public lazy var createButton = UIButton(title: "Create")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        buildViewHierarchy()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubview(goalLabel)
        addSubview(goalDescription)
        addSubview(howLabel)
        addSubview(goalHow)
        addSubview(when)
        addSubview(goalWhen)
        addSubview(whatINeed)
        addSubview(goalNeeds)
        addSubview(createButton)
        setupConstraints()
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            goalLabel.topAnchor.constraint(equalTo: self.topAnchor),
            goalLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -180),
            goalLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            goalDescription.topAnchor.constraint(equalTo: self.goalLabel.bottomAnchor, constant: -140),
            goalDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            goalDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            howLabel.topAnchor.constraint(equalTo: self.goalLabel.bottomAnchor, constant: -80),
            howLabel.centerXAnchor.constraint(equalTo: goalLabel.centerXAnchor),
            goalHow.topAnchor.constraint(equalTo: self.howLabel.bottomAnchor, constant: 10),
            goalHow.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            goalHow.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            whatINeed.topAnchor.constraint(equalTo: self.howLabel.bottomAnchor, constant: 70),
            whatINeed.centerXAnchor.constraint(equalTo: goalLabel.centerXAnchor),
            goalNeeds.topAnchor.constraint(equalTo: self.whatINeed.bottomAnchor, constant: 10),
            goalNeeds.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            goalNeeds.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            when.topAnchor.constraint(equalTo: self.whatINeed.bottomAnchor, constant: 70),
            when.centerXAnchor.constraint(equalTo: goalLabel.centerXAnchor),
            goalWhen.topAnchor.constraint(equalTo: self.when.bottomAnchor, constant: 10),
            goalWhen.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            goalWhen.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            createButton.centerXAnchor.constraint(equalTo: self.goalLabel.centerXAnchor),
            createButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            createButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            createButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            createButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
}
