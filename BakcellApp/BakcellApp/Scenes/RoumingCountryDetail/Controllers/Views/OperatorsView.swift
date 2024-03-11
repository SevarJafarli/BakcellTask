//
//  OperatorsView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 05.03.24.
//

import UIKit

internal class OperatorsView: UIView {

    var operators: [OperatorModel]?
    
    private lazy var roamingSegmentedControl: RoamingCountryPageSegmentedControl = {
        let segmentedControl = RoamingCountryPageSegmentedControl()
        segmentedControl.delegate = self
        return segmentedControl
    }()
    
    private lazy var backViewForRoamingSegmentedControl: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var operatorsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.contentInset = .zero
        tableView.register(OperatorViewCell.self, forCellReuseIdentifier: OperatorViewCell.reuseIdentifier)
        return tableView
        
    }()
    
    private lazy var stackView: UIStackView  = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 0
        return view
    }()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.backViewForRoamingSegmentedControl.addSubview(self.roamingSegmentedControl)
       
        self.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.backViewForRoamingSegmentedControl)
        self.stackView.addArrangedSubview(self.operatorsTableView)

        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.stackView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        self.backViewForRoamingSegmentedControl.snp.updateConstraints { make in
            make.height.equalTo(64)

        }
        
        self.roamingSegmentedControl.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
}


//MARK: UITableView

extension OperatorsView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.operators?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OperatorViewCell.reuseIdentifier, for: indexPath) as?  OperatorViewCell else {
            return UITableViewCell()
        }
        guard let operators = operators else { return  UITableViewCell() }
        let op = operators[indexPath.row]
        cell.data = op
        return cell
    }
}

//MARK: SegmentedControlDelegate

extension OperatorsView: SegmentedControlDelegate {
    func segmentedControl(_ segmentedControl: SegmentedControl, didSelectIndex selectedIndex: Int) {
        
    }
}
