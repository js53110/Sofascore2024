//
//  LeagueNameView.swift
//  SofascoreAcademy
//
//  Created by Akademija on 12.03.2024..
//

import Foundation
import SnapKit
import UIKit


class MatchView: UIView {
    
    let homeTeam: String
    let homeTeamLogo: String
    let homeTeamScore: Int?
    let awayTeam: String
    let awayTeamLogo: String
    let awayTeamScore: Int?
    let matchStatus: matchStatus
    let matchTime: TimeInterval

    init(homeTeam:String, homeTeamLogo: String, homeTeamScore:Int?, awayTeam:String, awayTeamLogo: String, awayTeamScore: Int?, matchStatus: matchStatus, matchTime: TimeInterval) {
        self.homeTeam = homeTeam
        self.homeTeamLogo = homeTeamLogo
        self.homeTeamScore = homeTeamScore
        self.awayTeam = awayTeam
        self.awayTeamLogo = awayTeamLogo
        self.awayTeamScore = awayTeamScore
        self.matchStatus = matchStatus
        self.matchTime = matchTime
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        let timeRect = UIView()
        addSubview(timeRect)
        
        let divider = UIView()
        timeRect.addSubview(divider)
        
        divider.backgroundColor = UIColor(white: 18.0 / 255.0, alpha: 0.1)
        
        divider.snp.makeConstraints() {
            $0.leading.equalToSuperview().offset(63)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().inset(8)
            
        }

        let timeStackView = TimeStatusStackView(matchTime: matchTime, status: matchStatus)
        timeRect.addSubview(timeStackView)
                
        let homeTeam = TeamLabel(teamName: homeTeam, teamLogo: homeTeamLogo)
        let awayTeam = TeamLabel(teamName: awayTeam, teamLogo: awayTeamLogo)
        
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
        
        addSubview(homeTeam)
        addSubview(awayTeam)
          
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
        
        homeTeam.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(80)
        }
        
        awayTeam.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().offset(80)
        }
    }
}
