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

func determineScore(matchId: Int, side: teamSide) -> (String)? {
    if let match = leagueData.first(where: { $0.matchId == matchId }) {
        if let homeScore = match.homeTeamScore, let awayScore = match.awayTeamScore {
            if side == teamSide.home {
                return String(homeScore)
            }
            else if side == teamSide.away {
                return String(awayScore)
            }
        }
    }
    return nil
}

class ScoreLabel: BaseView {
    
    private var score: String?
    private var matchStatus: matchStatus
    private var textColor: UIColor

    private let matchId: Int

    private let scoreLabel = UILabel()
    
    func updateScore(score: Int) {
        self.score = String(score)
        scoreLabel.text = self.score
    }
    
    func updateMatchStatus(status: matchStatus) {
        self.matchStatus = status
        switch self.matchStatus {
        case .inProgress:
            textColor = .red
        default:
            textColor = .black
        }
        scoreLabel.textColor = textColor
    }
    
    init(matchId: Int, side: teamSide) {
        self.matchId = matchId
        self.matchStatus = helpers.getMatchStatus(matchId: matchId)
        
        switch self.matchStatus {
        case .inProgress:
            textColor = .red
        default:
            textColor = .black
        }
        
        self.score = determineScore(matchId: matchId, side: side)
        
        super.init()
    }
    
    override func addViews() {
        addSubview(scoreLabel)
    }

    override func styleViews() {
        scoreLabel.text = score
        scoreLabel.textColor = textColor
        scoreLabel.textAlignment = .right
        scoreLabel.font = fonts.RobotoRegular14
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
