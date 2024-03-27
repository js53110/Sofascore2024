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
    
    private var homeTeam: String?
    private var homeTeamLogo: String?
    private var awayTeam: String?
    private var awayTeamLogo: String?
    var matchId: Int = 0

    private var homeTeamLabel = TeamNameLogoView()
    private var awayTeamLabel = TeamNameLogoView()
    private var timeStatusView = TimeStatusView()
    
    private var homeResult = ScoreLabel()
    private var awayResult = ScoreLabel()
    
    private var divider = UIView()
    private var timeRect = UIView()
    
    func update(data: matchData) {
        matchId = data.matchId
        
        let matchStatus = helpers.getMatchStatus(matchId: matchId)
        
        homeTeamLabel.update(
            teamName: data.homeTeam,
            teamLogo: data.homeLogo, 
            color: helpers.determineHomeTeamTextColorBasedOnMatchStatus(matchStatus: matchStatus)
        )
        awayTeamLabel.update(
            teamName: data.awayTeam,
            teamLogo: data.awayLogo,
            color: helpers.determineAwayTeamTextColorBasedOnMatchStatus(matchStatus: matchStatus)
        )
        homeResult.update(
            matchId: data.matchId,
            status: data.status,
            score: data.homeTeamScore,
            color: helpers.determineHomeTeamScoreColorBasedOnMatchStatus(matchStatus: matchStatus)
        )
        awayResult.update(
            matchId: data.matchId,
            status: data.status,
            score: data.awayTeamScore,
            color: helpers.determineAwayTeamScoreColorBasedOnMatchStatus(matchStatus: matchStatus)
        )
        timeStatusView.update(matchTime: data.timeStamp, status: data.status)
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
        snp.makeConstraints() {
            $0.height.equalTo(56)
        }
        
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

extension MatchView {
    func updateScore(score: Int, side: teamSide){
        if(side == .home) {
            homeResult.updateScore(score: score)
        }
        else if(side == .away) {
            awayResult.updateScore(score: score)
        }
    }
    
    func updateMatchTime(time: Int) {
        timeStatusView.updateMatchTime(time: time)
    }
}
