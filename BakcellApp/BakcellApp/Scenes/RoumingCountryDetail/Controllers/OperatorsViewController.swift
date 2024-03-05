//
//  OperatorsViewController.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 04.03.24.
//

import UIKit
import BakcellUIKit

class OperatorsViewController: UIViewController, ThemeableViewController {
    
    var theme: ThemeProvider = App.theme
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setSegmentedControl()
        self.addSubviews()
    }
    
    private func addSubviews() {
        self.backViewForRoamingSegmentedControl.addSubview(self.roamingSegmentedControl)
       
        self.view.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.backViewForRoamingSegmentedControl)
        self.stackView.addArrangedSubview(self.operatorsTableView)

        self.updateViewConstraints()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
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

extension OperatorsViewController: UITableViewDataSource, UITableViewDelegate {
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

//MARK: SegmentedControlDelegate

extension OperatorsViewController: SegmentedControlDelegate {
    func segmentedControl(_ segmentedControl: SegmentedControl, didSelectIndex selectedIndex: Int) {
        
    }
}
