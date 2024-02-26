//
//  OperatorsView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 26.02.24.
//

import UIKit

class OperatorsView: UIView {
    
    lazy var segmentedControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: [
            "Öncədən ödənişli",
            "Fakturalı"
        ])
//        segmentControl.selectedSegmentTintColor = adaptiveColor(.appWhite)
        segmentControl.backgroundColor = .clear
        segmentControl.tintColor = .clear
      
//        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        return segmentControl
    }()
    
    
    lazy var operatorsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(OperatorViewCell.self, forCellReuseIdentifier: OperatorViewCell.reuseIdentifier)
        return tableView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
        self.segmentedControl.selectedSegmentIndex = 0
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.addSubview(self.segmentedControl)
        self.addSubview(self.operatorsTableView)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.segmentedControl.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        self.operatorsTableView.snp.updateConstraints { make in
            make.top.equalTo(self.segmentedControl.snp.bottom).offset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}


//MARK: UITableView

extension OperatorsView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OperatorViewCell.reuseIdentifier, for: indexPath) as?  OperatorViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    
}
