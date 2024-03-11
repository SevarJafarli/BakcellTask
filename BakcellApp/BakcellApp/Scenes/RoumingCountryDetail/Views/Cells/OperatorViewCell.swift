//
//  OperatorViewCell.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 26.02.24.
//

import UIKit
import BakcellUIKit

class OperatorViewCell: UITableViewCell {

    static var reuseIdentifier = "OperatorViewCell"
    
    
    var data: OperatorModel? {
        didSet {
            configure()
        }
    }
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = adaptiveColor(.appWhite)
        view.layer.cornerRadius = 24
        view.layer.borderColor = adaptiveColor(.greyLight1).cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    private lazy var contentVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        return stackView
    }()
    
    private lazy var operatorTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.SFBoldTitle2.fontStyle
        label.textColor = adaptiveColor(.blackHigh)
        return label
    }()
    
    private lazy var operatorServiceVStackView: OperatorServiceVStackView = {
        let stackView = OperatorServiceVStackView()

        return stackView
    }()
    
    //MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        self.addSubviews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    private func addSubviews() {
        self.contentVStackView.addArrangedSubview(self.operatorTitleLabel)
        self.contentVStackView.addArrangedSubview(self.operatorServiceVStackView)
        
        self.backView.addSubview(self.contentVStackView)
        self.contentView.addSubview(self.backView)
       
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.backView.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        self.contentVStackView.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
    
    
    private func configure() {
        guard let op = self.data else { return }
        self.operatorTitleLabel.text = op.operatorName
        self.operatorServiceVStackView.data = op.services
        
    }
}
