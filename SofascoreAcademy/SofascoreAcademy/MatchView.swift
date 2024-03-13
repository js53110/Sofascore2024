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

class MatchView: BaseView {
    
    let homeTeam: String
    let homeTeamLogo: String
    let homeTeamScore: Int?
    let awayTeam: String
    let awayTeamLogo: String
    let awayTeamScore: Int?
    let matchStatus: matchStatus
    let matchTime: TimeInterval
    
    let homeTeamLabel: TeamLabel
    let awayTeamLabel: TeamLabel
    let timeStackView: TimeStatusStackView
    
    let divider = UIView()
    let timeRect = UIView()

    init(homeTeam:String, homeTeamLogo: String, homeTeamScore:Int?, awayTeam:String, awayTeamLogo: String, awayTeamScore: Int?, matchStatus: matchStatus, matchTime: TimeInterval) {
        self.homeTeam = homeTeam
        self.homeTeamLogo = homeTeamLogo
        self.homeTeamScore = homeTeamScore
        self.awayTeam = awayTeam
        self.awayTeamLogo = awayTeamLogo
        self.awayTeamScore = awayTeamScore
        self.matchStatus = matchStatus
        self.matchTime = matchTime
        
        self.homeTeamLabel = TeamLabel(teamName: homeTeam, teamLogo: homeTeamLogo)
        self.awayTeamLabel = TeamLabel(teamName: awayTeam, teamLogo: awayTeamLogo)
        self.timeStackView = TimeStatusStackView(matchTime: matchTime, status: matchStatus)
        
        super.init()
        setupScores()
    }
    
    override func addViews() {
        addSubview(timeRect)
        timeRect.addSubview(divider)
        timeRect.addSubview(timeStackView)
        addSubview(homeTeamLabel)
        addSubview(awayTeamLabel)
    }

    override func styleViews() {
        divider.backgroundColor = UIColor(white: 18.0 / 255.0, alpha: 0.1)
    }

    override func setupConstraints() {
        divider.snp.makeConstraints() {
            $0.leading.equalToSuperview().offset(63)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().inset(8)
        }
        
        timeRect.snp.makeConstraints() {
            $0.height.equalTo(56)
            $0.width.equalTo(64)
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
        }
        timeStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(4)
            $0.trailing.equalToSuperview().offset(-4)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        homeTeamLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(80)
        }
        
        awayTeamLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().offset(80)
        }
    }
    
    private func setupScores() {
        if let homeScore = homeTeamScore {
            let homeResult = ScoreLabel(score: homeScore, matchStatus: matchStatus)
            addSubview(homeResult)
            homeResult.snp.makeConstraints() {
                $0.top.equalToSuperview().offset(10)
                $0.right.equalToSuperview().inset(16)
            }
        }

        if let awayScore = awayTeamScore {
            let awayResult = ScoreLabel(score: awayScore, matchStatus: matchStatus)
            addSubview(awayResult)
            awayResult.snp.makeConstraints() {
                $0.top.equalToSuperview().offset(30)
                $0.right.equalToSuperview().inset(16)
            }
        }
    }
}
