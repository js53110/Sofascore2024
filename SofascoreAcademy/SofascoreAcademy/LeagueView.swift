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
    private let leagueInfoView = LeagueInfoView()
    private var matchViews: [MatchView] = []
    
    func update(data: [matchData]){
        stackView.clear()
        matchViews = []
        leagueInfoView.update(countryName: "Spain", leagueName: "LaLiga", leagueLogo: "leagueLogo")
        for matchData in data {
            let matchView = MatchView()
            matchView.update(data: matchData)
            stackView.addArrangedSubview(matchView)
            matchViews.append(matchView)
        }
    }
    
    override init() {
        super.init()
    }
    
    override func addViews() {
        addSubview(leagueInfoView)
        addSubview(stackView)
    }
    
    override func styleViews() {
        stackView.axis = .vertical
    }

    override func setupConstraints() {
        leagueInfoView.snp.makeConstraints() {
            $0.leading.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(leagueInfoView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

extension LeagueView {
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
}

extension UIStackView {
    func clear() {
        for arrangedSubview in arrangedSubviews {
            removeArrangedSubview(arrangedSubview)
            arrangedSubview.removeFromSuperview()
        }
    }
}
