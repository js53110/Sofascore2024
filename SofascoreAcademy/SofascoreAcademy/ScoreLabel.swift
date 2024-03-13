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
    
    let score: Int
    let scoreString: String
    let matchStatus: matchStatus
    
    let scoreLabel = UILabel()
    let textColor: UIColor

    init(score: Int, matchStatus: matchStatus) {
        self.score = score
        self.matchStatus = matchStatus
        switch matchStatus {
        case .inProgress:
            textColor = .red
        default:
            textColor = .black
        }
        self.scoreString = String(score)
        super.init()
    }
    
    override func addViews() {
        addSubview(scoreLabel)
    }

    override func styleViews() {
        scoreLabel.text = String(scoreString)
        scoreLabel.textColor = textColor
        scoreLabel.font = RobotoRegular14    }

    override func setupConstraints() {
        snp.makeConstraints() {
            $0.height.equalTo(16)
            $0.width.equalTo(32)
        }
        
        scoreLabel.snp.makeConstraints() {
            $0.top.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
}
