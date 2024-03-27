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
    
    private var textColor: UIColor = .black

    private var scoreLabel = UILabel()
    
    func update(matchId: Int, status: matchStatus, score: Int?, color: UIColor) {
        if let score = score {
            scoreLabel.text = String(score)
            scoreLabel.textColor = color
        }
//        updateMatchStatus(status: status)
    }

    override func addViews() {
        addSubview(scoreLabel)
    }

    override func styleViews() {
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

extension ScoreLabel {
    func updateScore(score: Int) {
        scoreLabel.text = String(score)
    }
}
