//
//  PriceComparisonViewCell.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 01.03.24.
//

import UIKit



class PriceComparisonViewCell: UITableViewCell {
    static var reuseIdentifier = "PriceComparisonViewCell"
    
    let titles = ["Operatorlar", "Daxil olan zənglər", "Çıxan zənglər", "Daxil olan SMS", "Çıxan SMS", "İnternet sərfiyyatı", "Şəbəkə"]
    let operator1 = ["TT Mobile", "0.39 ₼ / dəq", "0.99 ₼ / dəq", "Pulsuz", "0.19 ₼ / sms", "-", "2G, 3G, 4G"]
    let operator2 = ["Turkcell", "0.39 ₼ / dəq", "0.99 ₼ / dəq", "Pulsuz", "0.19 ₼ / sms", "-", "2G, 3G, 4G"]
    
    private lazy var contentHStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.backgroundColor = adaptiveColor(.greyBg)
        view.spacing = 4
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var priceTableHeaders: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.backgroundColor = .clear
        view.layer.cornerRadius = 12
        view.layer.borderColor = adaptiveColor(.greyLight).cgColor
        view.layer.borderWidth = 2
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var operatorsPricesHStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 0
        view.distribution = .fillEqually
        view.layer.cornerRadius = 12
        view.layer.borderColor = adaptiveColor(.greyLight).cgColor
        view.layer.borderWidth = 2
        view.backgroundColor = adaptiveColor(.greyBg)
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var operatorPriceTableView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical

    
        view.backgroundColor = .clear
        
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var operatorPriceTableView2: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.backgroundColor = .clear
        view.clipsToBounds = true
        return view
    }()
    
    //MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
       
        self.contentView.addSubview(self.contentHStackView)
        
        
        for (index, title) in self.titles.enumerated() {
            let view = PriceTableSectionHeaderView(title: title)
          
            
            if index % 2 == 0 {
                view.backgroundColor = adaptiveColor(.tableGrey)
            }
            else {
                view.backgroundColor = adaptiveColor(.appWhite)
            }
            self.priceTableHeaders.addArrangedSubview(view)
        }
        for (index, title) in self.operator1.enumerated() {
            let view = PriceTableSectionHeaderView(title: title)
            view.isOperationHeaderView = true
            if index != 0 {
                view.isChildView = true
            }
            if index % 2 != 0 {
                view.backgroundColor = adaptiveColor(.tableGrey)
            }
            else {
                view.backgroundColor = adaptiveColor(.appWhite)
            }
            self.operatorPriceTableView.addArrangedSubview(view)
        }
        
        for (index, title) in self.operator2.enumerated() {
            let view = PriceTableSectionHeaderView(title: title)
            view.isOperationHeaderView = true
            if index != 0 {
                view.isChildView = true
            }
            if index % 2 != 0 {
                view.backgroundColor = adaptiveColor(.tableGrey)
            }
            else {
                view.backgroundColor = adaptiveColor(.appWhite)
            }
            self.operatorPriceTableView2.addArrangedSubview(view)
        }
        
        self.operatorsPricesHStackView.addArrangedSubview(self.operatorPriceTableView)
        self.operatorsPricesHStackView.addArrangedSubview(self.operatorPriceTableView2)
        
        self.contentHStackView.addArrangedSubview(self.priceTableHeaders)
        
        self.contentHStackView.addArrangedSubview(self.operatorsPricesHStackView)
        self.updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()
        
        self.contentHStackView.snp.updateConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(8)
            make.verticalEdges.equalToSuperview()

        }
        
        self.priceTableHeaders.snp.updateConstraints { make in
            make.width.equalTo(120)
        }
        
    }
}
