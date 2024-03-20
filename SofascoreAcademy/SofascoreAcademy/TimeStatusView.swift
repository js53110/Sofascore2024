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
    
    private var matchTime: String
    private var matchStatus: String
    private var fontColor: UIColor
    
    private let timeView = UILabel()
    private let statusView = UILabel()
    
    func updateMatchStatus(status: matchStatus) {
        matchStatus = helpers.determineMatchStatusString(matchStatus: status)
        switch status {
        case .inProgress:
            self.fontColor = .red
        default:
            self.fontColor = colors.surfaceLv2
        }
        statusView.text = matchStatus
        statusView.textColor = fontColor
    }
    
    func updateMatchTime(time: Int) {
        statusView.text = String(time) + "'"
    }
    
    init(matchTime: TimeInterval, status: matchStatus) {
        self.matchTime = helpers.convertTimestampToTime(timeStamp: matchTime)
        self.matchStatus = helpers.determineMatchStatusString(matchStatus: status)
        switch status {
        case .inProgress:
            self.fontColor = .red
        default:
            self.fontColor = colors.surfaceLv2
        }
        super.init()
    }
    
    override func addViews() {
        addSubview(timeView)
        addSubview(statusView)
    }

    override func styleViews() {
        timeView.text = matchTime
        timeView.font = fonts.RobotoCondensedRegularMicro
        timeView.textColor = colors.surfaceLv2
        timeView.textAlignment = .center
        
        statusView.text = matchStatus
        statusView.font = fonts.RobotoCondensedRegularMicro
        statusView.textColor = fontColor
        statusView.textAlignment = .center
    }

    override func setupConstraints() {
        timeView.snp.makeConstraints() {
            $0.height.equalTo(16)
            $0.top.leading.trailing.equalToSuperview()
        }
        
        statusView.snp.makeConstraints() {
            $0.height.equalTo(16)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}
