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
    
    private let tableView = UITableView()
    private var matchViews: [MatchViewCell] = []
    
    func update(data: [matchData]){
        matchViews = []
    }
    
    override init() {
        super.init()
        tableView.register(MatchViewCell.self, forCellReuseIdentifier: "MatchViewCell")
        tableView.register(LeagueInfoViewCell.self, forCellReuseIdentifier: "sectionHeader")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.reloadData()
    }
    
    override func addViews() {
        addSubview(tableView)
    }
    
    override func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

//extension LeagueView {
//    func updateScore(matchId: Int, score: Int, side: teamSide) {
//        let matchToChange = matchViews.first(where: {
//            $0.matchId == matchId
//        })
//        matchToChange?.updateScore(score: score, side: side)
//    }
//    
//    func updateMatchStatus(matchId: Int, status: matchStatus) {
//        let matchToChange = matchViews.first(where: {
//            $0.matchId == matchId
//        })
//        matchToChange?.updateMatchStatus(status: status)
//    }
//    
//    func updateMatchTime(matchId: Int, time: Int) {
//        let matchToChange = matchViews.first(where: {
//            $0.matchId == matchId
//        })
//        matchToChange?.updateMatchTime(time: time)
//    }
//}

extension UIStackView {
    func clear() {
        for arrangedSubview in arrangedSubviews {
            removeArrangedSubview(arrangedSubview)
            arrangedSubview.removeFromSuperview()
        }
    }
}

extension LeagueView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return leaguesData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaguesData[section].matches.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            let headerView = tableView.dequeueReusableCell(withIdentifier: "sectionHeader", for: indexPath) as! LeagueInfoViewCell
            headerView.update(
                countryName: leaguesData[indexPath.section].countryName,
                leagueName: leaguesData[indexPath.section].leagueName,
                leagueLogo: leaguesData[indexPath.section].leagueLogo)
            return headerView
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchViewCell", for: indexPath) as! MatchViewCell
        
        let dataForRow = leaguesData[indexPath.section].matches[indexPath.row - 1]
        cell.update(data: dataForRow)
        
        return cell
    }
}


extension LeagueView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
}


