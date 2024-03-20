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
    
    private var score: String = ""
    private var textColor: UIColor = .black

    private var scoreLabel = UILabel()
    
    func updateScore(score: Int) {
        self.score = String(score)
        scoreLabel.text = self.score
    }
    
    func updateMatchStatus(status: matchStatus) {
        let matchStatus = status
        switch matchStatus {
        case .inProgress:
            textColor = .red
        default:
            textColor = .black
        }
        scoreLabel.textColor = textColor
    }
    
    func update(matchId: Int, status: matchStatus, score: Int?) {
        if let score = score {
            self.score = String(score)
        }
        
        updateMatchStatus(status: status)
        
        addViews()
        styleViews()
        setupConstraints()
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
