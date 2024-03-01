//
//  OperatorsView.swift
//  BakcellApp
//
//  Created by Sevar Jafarli on 26.02.24.
//

import UIKit
import BakcellUIKit

class OperatorsView: UIView {
    
//    
//    lazy var roamingSegmentedControl: SegmentedControl = {
//        
//        let segmentedControl = SegmentedControl()
//        
//        segmentedControl.backgroundColor = adaptiveColor(.greyBg)
//        segmentedControl.selectionBoxStyle = .default
//        segmentedControl.selectionBoxColor = adaptiveColor(.appWhite)
//        segmentedControl.selectionBoxCornerRadius = 10
//        segmentedControl.layoutPolicy = .fixed
//        segmentedControl.segmentSpacing = 0
//        segmentedControl.selectionBoxHeight = 32
//        segmentedControl.selectionHorizontalPadding = 8
//        
//        segmentedControl.contentInset = .zero
//        segmentedControl.clipsToBounds = true
//        
//        return segmentedControl
//    }()
    
    
    lazy var operatorsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.register(OperatorViewCell.self, forCellReuseIdentifier: OperatorViewCell.reuseIdentifier)
        return tableView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()

    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.addSubview(self.operatorsTableView)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()

        self.operatorsTableView.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
//    
//    func setSegmentedControl() {
//        
//        let titleStrings = ["Öncədən ödənişli", "Fakturalı"]
//        let titles: [NSAttributedString] = {
//            let attributes: [NSAttributedString.Key: Any] = [.font:  AppFonts.SFRegularSubheadline.fontStyle, .foregroundColor: adaptiveColor(.blackHigh)]
//            var titles = [NSAttributedString]()
//            for titleString in titleStrings {
//                let title = NSAttributedString(string: titleString, attributes: attributes)
//                titles.append(title)
//            }
//            return titles
//        }()
//        
//        let selectedTitles: [NSAttributedString] = {
//            let attributes: [NSAttributedString.Key: Any] =  [.font:  AppFonts.SFRegularSubheadline.fontStyle, .foregroundColor: adaptiveColor(.blackHigh)]
//            var selectedTitles = [NSAttributedString]()
//            for titleString in titleStrings {
//                let selectedTitle = NSAttributedString(string: titleString, attributes: attributes)
//                selectedTitles.append(selectedTitle)
//            }
//            return selectedTitles
//        }()
//        
//        self.roamingSegmentedControl.setTitles(titles, selectedTitles: selectedTitles)
//        
//    }
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

