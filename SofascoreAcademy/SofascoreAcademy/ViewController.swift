//
//  ViewController.swift
//  SofascoreAcademy
//
//  Created by Akademija on 08.03.2024..
//

import UIKit
import Foundation
import SnapKit

enum matchStatus {
    
    case upcoming
    case inProgress
    case finished
}

struct matchData{
    
    let matchId: Int
    let homeTeam: String
    let awayTeam: String
    let homeLogo: String
    let awayLogo: String
    let status: matchStatus
    let timeStamp: TimeInterval
    let homeTeamScore: Int?
    let awayTeamScore: Int?
}

func updateScore(matchId: Int) -> (Int, Int)? {
    if let match = leagueData.first(where: { $0.matchId == matchId }) {
        if let homeScore = match.homeTeamScore, let awayScore = match.awayTeamScore {
            return (homeScore, awayScore)
        }
    }
    return nil 
}

func updateStatus(matchId: Int) -> matchStatus {
    if let match = leagueData.first(where: { $0.matchId == matchId }) {
        let matchStatus = match.status
        return matchStatus
    }
    return matchStatus.upcoming
}




func determineMatchStatus(matchStatus: matchStatus) -> String {
    
    switch matchStatus {
    case .finished:
        return "FT"
    case .inProgress:
        return "37'" // tu kasnije mogu dodat funkciju za dinamicko izracunavanje vremena
    default:
        return "-"
    }
}

func convertTimestampToTime(timeStamp: TimeInterval) -> String {
    
    let date = Date(timeIntervalSince1970: timeStamp)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    let timeString = dateFormatter.string(from: date)
    return timeString
}

let matchData1 = matchData(matchId: 1, homeTeam: "Manchester United", awayTeam: "Barcelona", homeLogo: "mutd_logo", awayLogo: "fcb_logo", status: .finished, timeStamp: 1710331200, homeTeamScore: 1, awayTeamScore: 2)

let matchData2 = matchData(matchId: 2, homeTeam: "Manchester United", awayTeam: "Barcelona", homeLogo: "mutd_logo", awayLogo: "fcb_logo", status: .inProgress, timeStamp: 1710342000, homeTeamScore: 0, awayTeamScore: 1)

let matchData3 = matchData(matchId: 3, homeTeam: "Manchester United", awayTeam: "Barcelona", homeLogo: "mutd_logo", awayLogo: "fcb_logo", status: .upcoming, timeStamp: 1710349200, homeTeamScore: nil, awayTeamScore: nil)

let matchData4 = matchData(matchId: 4, homeTeam: "Manchester United", awayTeam: "Barcelona", homeLogo: "mutd_logo", awayLogo: "fcb_logo", status: .upcoming, timeStamp: 1710354600, homeTeamScore: nil, awayTeamScore: nil)

let leagueData: Array<matchData> = [matchData1, matchData2, matchData3, matchData4]

class ViewController: UIViewController {

    let leagueView: LeagueView = .init(leagueData: leagueData)
    
    override func viewDidLoad() {
                
        super.viewDidLoad()
        
        view.backgroundColor = .white
                
        view.addSubview(leagueView)
        
        leagueView.snp.makeConstraints() {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

