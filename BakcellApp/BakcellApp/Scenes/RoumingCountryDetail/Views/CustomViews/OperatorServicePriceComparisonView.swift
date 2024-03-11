//
//  PriceComparisonViewCell.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 01.03.24.
//

import UIKit



class OperatorServicePriceComparisonView: UIView {
    
    var operators: [OperatorServicePriceModel]? {
        didSet {
            configure()
        }
    }
    
    let titles = ["Operatorlar", "Daxil olan zənglər", "Çıxan zənglər", "Daxil olan SMS", "Çıxan SMS", "İnternet sərfiyyatı", "Şəbəkə"]
    
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
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
   
        self.backgroundColor = .clear
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    fileprivate func addSubviews() {
        self.addSubview(self.contentHStackView)
        
        for (index, title) in self.titles.enumerated() {
            let view = PriceTableSectionHeaderView(title: title)
            
            view.setBackgroundColor(at: index)
            self.priceTableHeaders.addArrangedSubview(view)
        }
    }
    
    private func configure() {
        guard let operators = operators else { return }
     
        for (_, op) in operators.enumerated() {
            let operatorPriceTableView: UIStackView = {
                let view = UIStackView()
                view.axis = .vertical
                view.backgroundColor = .clear
                view.clipsToBounds = true
                return view
            }()
            
            let mirror = Mirror(reflecting: op)
            for (index, element) in mirror.children.enumerated() {
               
                let view = PriceTableSectionHeaderView(title: element.value as! String)
                view.setBackgroundColor(at: index)
                operatorPriceTableView.addArrangedSubview(view)
            }
            
            self.operatorsPricesHStackView.addArrangedSubview(operatorPriceTableView)
        }
        
        self.contentHStackView.addArrangedSubview(self.priceTableHeaders)
        self.contentHStackView.addArrangedSubview(self.operatorsPricesHStackView)
        self.updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()
        
        self.contentHStackView.snp.updateConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.verticalEdges.equalToSuperview()

        }
        
        self.priceTableHeaders.snp.updateConstraints { make in
            make.width.equalTo(120)
        }
        
    }
}
