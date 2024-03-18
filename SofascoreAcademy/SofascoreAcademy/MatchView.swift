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
    
    private let homeTeam: String
    private let homeTeamLogo: String
    private let homeTeamScore: Int?
    private let awayTeam: String
    private let awayTeamLogo: String
    private let awayTeamScore: Int?
    private let matchStatus: matchStatus
    private let matchTime: TimeInterval
    
    private let homeTeamLabel: TeamNameLogoVeiw
    private let awayTeamLabel: TeamNameLogoVeiw
    private let timeStatusView: TimeStatusView
    
    private let divider = UIView()
    private let timeRect = UIView()

    init(homeTeam:String, homeTeamLogo: String, homeTeamScore:Int?, awayTeam:String, awayTeamLogo: String, awayTeamScore: Int?, matchStatus: matchStatus, matchTime: TimeInterval) {
        
        self.homeTeam = homeTeam
        self.homeTeamLogo = homeTeamLogo
        self.homeTeamScore = homeTeamScore
        self.awayTeam = awayTeam
        self.awayTeamLogo = awayTeamLogo
        self.awayTeamScore = awayTeamScore
        self.matchStatus = matchStatus
        self.matchTime = matchTime
        
        self.homeTeamLabel = TeamNameLogoVeiw(teamName: homeTeam, teamLogo: homeTeamLogo)
        self.awayTeamLabel = TeamNameLogoVeiw(teamName: awayTeam, teamLogo: awayTeamLogo)
        self.timeStatusView = TimeStatusView(matchTime: matchTime, status: matchStatus)
        
        super.init()
        setupScores()
    }
    
    override func addViews() {
        
        addSubview(timeRect)
        timeRect.addSubview(divider)
        timeRect.addSubview(timeStatusView)
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
            $0.leading.equalToSuperview()
        }
        timeStatusView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(4)
            $0.trailing.equalToSuperview().inset(4)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        homeTeamLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(timeRect.snp.trailing).offset(16)
        }
        
        awayTeamLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalTo(timeRect.snp.trailing).offset(16)
        }
    }
    
    private func setupScores() {
        
        if let homeScore = homeTeamScore {
            let homeResult = ScoreLabel(score: homeScore, matchStatus: matchStatus)
            addSubview(homeResult)
            homeResult.snp.makeConstraints() {
                $0.top.equalToSuperview().offset(10)
                $0.trailing.equalToSuperview().inset(16)
            }
        }

        if let awayScore = awayTeamScore {
            let awayResult = ScoreLabel(score: awayScore, matchStatus: matchStatus)
            addSubview(awayResult)
            awayResult.snp.makeConstraints() {
                $0.top.equalToSuperview().offset(30)
                $0.trailing.equalToSuperview().inset(16)
            }
        }
    }
}
