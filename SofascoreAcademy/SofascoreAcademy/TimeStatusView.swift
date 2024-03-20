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

class TimeStatusView: BaseView {
    
    private let matchTime: String
    private let matchStatus: String
    private let fontColor: UIColor
    
    private let timeView = UILabel()
    private let statusView = UILabel()
    
    init(matchTime: TimeInterval, status: matchStatus) {
        self.matchTime = convertTimestampToTime(timeStamp: matchTime)
        self.matchStatus = determineMatchStatus(matchStatus: status)
        switch status {
        case .inProgress:
            self.fontColor = .red
        default:
            self.fontColor = surfaceLv2
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
        timeView.textColor = surfaceLv2
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
