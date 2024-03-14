//
//  LeagueNameView.swift
//  SofascoreAcademy
//
//  Created by Akademija on 12.03.2024..
//

import Foundation
import SnapKit
import UIKit
import SofaAcademic

class TimeStatusStackView: BaseView {
    
    let matchTime: String
    let matchStatus: String
    let fontColor: UIColor
    
    let timeView = UILabel()
    let statusView = UILabel()
    
    init(matchTime: TimeInterval, status: matchStatus) {
        
        self.matchTime = convertTimestampToTime(timeStamp: matchTime)
        self.matchStatus = determineMatchStatus(matchStatus: status)
        switch status {
        case .inProgress:
            self.fontColor = .red
        default:
            self.fontColor = lightGrey
        }
        super.init()
    }
    
    override func addViews() {
        
        addSubview(timeView)
        addSubview(statusView)
    }

    override func styleViews() {
        
        timeView.text = matchTime
        timeView.font = RobotoCondensedRegularMicro
        timeView.textColor = lightGrey
        timeView.textAlignment = .center
        
        statusView.text = matchStatus
        statusView.font = RobotoCondensedRegularMicro
        statusView.textColor = fontColor
        statusView.textAlignment = .center
    }

    override func setupConstraints() {
        
        timeView.snp.makeConstraints() {
            $0.height.equalTo(16)
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        statusView.snp.makeConstraints() {
            $0.height.equalTo(16)
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()       
        }
    }
}
