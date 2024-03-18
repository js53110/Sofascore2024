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
    
    private let score: Int
    private let scoreString: String
    private let matchStatus: matchStatus
    private let matchId: Int
    
    private let scoreLabel = UILabel()
    private let textColor: UIColor

    init(matchId: Int, score: Int, matchStatus: matchStatus) {
        
        self.matchId = matchId
        self.score = score
        self.matchStatus = matchStatus
        switch matchStatus {
        case .inProgress:
            textColor = .red
        default:
            textColor = .black
        }
        self.scoreString = String(score)
        
//        var a: matchData? = leagueData.first(where: {$0.matchId == matchId})
//        print(a?.homeTeam)
//        print(a?.homeTeamScore)
        
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
    }

    override func setupConstraints() {
        
        snp.makeConstraints() {
            $0.height.equalTo(16)
            $0.width.equalTo(32)
        }
        
        scoreLabel.snp.makeConstraints() {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }
}
