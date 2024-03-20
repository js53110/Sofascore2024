//
//  LeagueView.swift
//  SofascoreAcademy
//
//  Created by Akademija on 12.03.2024..
//

import Foundation
import UIKit
import SofaAcademic

class LeagueView: BaseView {
    
    private let stackView = UIStackView()
    private let leagueData: Array<matchData>
    private let LeagueInfoView: LeagueInfoView = .init(countryName: "Spain", leagueName: "LaLiga", leagueLogo: "leagueLogo")
    
    private var matchViews: [MatchView] = []
    
    func updateScore(matchId: Int, score: Int, side: teamSide) {
        let matchToChange = matchViews.first(where: {
            $0.matchId == matchId
        })
        matchToChange?.updateScore(score: score, side: side)
    }
    
    func updateMatchStatus(matchId: Int, status: matchStatus) {
        let matchToChange = matchViews.first(where: {
            $0.matchId == matchId
        })
        matchToChange?.updateMatchStatus(status: status)
    }
    
    func updateMatchTime(matchId: Int, time: Int) {
        let matchToChange = matchViews.first(where: {
            $0.matchId == matchId
        })
        matchToChange?.updateMatchTime(time: time)
    }
    
    init(leagueData: Array<matchData>) {
        self.leagueData = leagueData
        
        for (_, data) in leagueData.enumerated() {
            let matchView = MatchView(matchId: data.matchId, homeTeam: data.homeTeam, homeTeamLogo: data.homeLogo, awayTeam: data.awayTeam, awayTeamLogo: data.awayLogo, matchStatus: data.status, matchTime: data.timeStamp)
            self.matchViews.append(matchView)
        }
        
        super.init()
        }
    
    override func addViews() {
        addSubview(stackView)
        
        for (_, matchView) in matchViews.enumerated() {
            stackView.addArrangedSubview(matchView)
        }
    
        addSubview(LeagueInfoView)
    }
    
    override func styleViews() {
        stackView.axis = .vertical
    }

    override func setupConstraints() {
        LeagueInfoView.snp.makeConstraints() {
            $0.leading.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(LeagueInfoView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        for (_, matchView) in matchViews.enumerated() {                    
            matchView.snp.makeConstraints {
                $0.height.equalTo(56)
                $0.leading.trailing.equalToSuperview()
            }
        }
    }
}
