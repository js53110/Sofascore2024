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

public enum teamSide {
    case home
    case away
}

class MatchView: BaseView {
    
    private let homeTeam: String
    private let homeTeamLogo: String
    private let awayTeam: String
    private let awayTeamLogo: String
    private let matchStatus: matchStatus
    private let matchTime: TimeInterval
    let matchId: Int
    
    private let homeTeamLabel: TeamNameLogoVeiw
    private let awayTeamLabel: TeamNameLogoVeiw
    private let timeStatusView: TimeStatusView
    
    private let homeResult: ScoreLabel
    private let awayResult: ScoreLabel
    
    private let divider = UIView()
    private let timeRect = UIView()
    
    func updateScore(score: Int, side: teamSide){
        if(side == .home) {
            homeResult.updateScore(score: score)
        }
        else if(side == .away) {
            awayResult.updateScore(score: score)
        }
    }
    
    func updateMatchStatus(status: matchStatus) {
        homeResult.updateMatchStatus(status: status)
        awayResult.updateMatchStatus(status: status)
        timeStatusView.updateMatchStatus(status: status)
    }
    
    func updateMatchTime(time: Int) {
        timeStatusView.updateMatchTime(time: time)
    }
    
    init(matchId: Int, homeTeam:String, homeTeamLogo: String, awayTeam:String, awayTeamLogo: String, matchStatus: matchStatus, matchTime: TimeInterval) {
        
        self.homeTeam = homeTeam
        self.homeTeamLogo = homeTeamLogo
        self.awayTeam = awayTeam
        self.awayTeamLogo = awayTeamLogo
        self.matchTime = matchTime
        self.matchId = matchId
        
        self.matchStatus = helpers.getMatchStatus(matchId: matchId)
        
        self.homeTeamLabel = TeamNameLogoVeiw(teamName: homeTeam, teamLogo: homeTeamLogo)
        self.awayTeamLabel = TeamNameLogoVeiw(teamName: awayTeam, teamLogo: awayTeamLogo)
        self.timeStatusView = TimeStatusView(matchTime: matchTime, status: matchStatus)
        
        self.homeResult = ScoreLabel(matchId: matchId, side: .home)
        self.awayResult = ScoreLabel(matchId: matchId, side: .away)
        

        super.init()
    }
    
    override func addViews() {
        addSubview(timeRect)
        timeRect.addSubview(divider)
        timeRect.addSubview(timeStatusView)
        addSubview(homeTeamLabel)
        addSubview(awayTeamLabel)
        addSubview(homeResult)
        addSubview(awayResult)
    }

    override func styleViews() {
        divider.backgroundColor = colors.surfaceLv4
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
            $0.top.equalTo(homeTeamLabel.snp.bottom).offset(4)
            $0.leading.equalTo(timeRect.snp.trailing).offset(16)
        }
        
        homeResult.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
    
        awayResult.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}
