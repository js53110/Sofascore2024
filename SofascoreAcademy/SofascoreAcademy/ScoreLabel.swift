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

class ScoreLabel: BaseView {
    
    private let score: Int?
    private let scoreString: String
    private let matchStatus: String
    private let matchId: Int
    
    private let scoreLabel = UILabel()
    private let textColor: UIColor

    init(matchId: Int, score: Int?, status: matchStatus) {
        self.matchId = matchId
        self.score = score
        self.matchStatus = determineMatchStatus(matchStatus: updateStatus(matchId: matchId))
        switch status {
        case .inProgress:
            textColor = .red
        default:
            textColor = .black
        }
        self.scoreString = score != nil ? String(score!) : ""
        super.init()
    }
    
    override func addViews() {
        addSubview(scoreLabel)
    }

    override func styleViews() {
        scoreLabel.text = String(scoreString)
        scoreLabel.textColor = textColor
        scoreLabel.textAlignment = .right
        scoreLabel.font = RobotoRegular14
        scoreLabel.contentMode = .center
    }

    override func setupConstraints() {
        snp.makeConstraints() {
            $0.width.equalTo(32)
            $0.height.equalTo(16)
        }
        
        scoreLabel.snp.makeConstraints() {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }
}
