//
//  ViewController.swift
//  SofascoreAcademy
//
//  Created by Akademija on 08.03.2024..
//

import UIKit
import Foundation
import SnapKit

func convertTimestampToTime(timeStamp: TimeInterval) -> String {
    let date = Date(timeIntervalSince1970: timeStamp)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    let timeString = dateFormatter.string(from: date)
    return timeString
}

enum matchStatus {
    case upcoming
    case inProgress
    case finished
}

func determineMatchStatus(matchStatus: matchStatus) -> String {
    switch matchStatus {
    case .finished:
        return "FT"
    case .inProgress:
        return "37'"
    default:
        return "-"
    }
}

var RobotoBold = UIFont(name: "Roboto-Bold", size: 14)
let RobotoRegular14 = UIFont(name: "Roboto-Regular", size: 14)
let RobotoRegular12 = UIFont(name: "Roboto-Regular", size: 12)
let RobotoCondensedRegularMicro = UIFont(name: "RobotoCondensed-Regular", size: 12)

var lightGrey = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
var red = UIColor.red


struct matchData{
    
    let homeTeam: String
    let awayTeam: String
    let homeLogo: String
    let awayLogo: String
    let status: matchStatus
    let timeStamp: TimeInterval
    let homeTeamScore: Int?
    let awayTeamScore: Int?
}

let matchData1 = matchData(homeTeam: "Manchester United", awayTeam: "Barcelona", homeLogo: "mutd_logo", awayLogo: "fcb_logo", status: .finished, timeStamp: 1710331200, homeTeamScore: 1, awayTeamScore: 2)

let matchData2 = matchData(homeTeam: "Manchester United", awayTeam: "Barcelona", homeLogo: "mutd_logo", awayLogo: "fcb_logo", status: .inProgress, timeStamp: 1710342000, homeTeamScore: 0, awayTeamScore: 1)

let matchData3 = matchData(homeTeam: "Manchester United", awayTeam: "Barcelona", homeLogo: "mutd_logo", awayLogo: "fcb_logo", status: .upcoming, timeStamp: 1710349200, homeTeamScore: nil, awayTeamScore: nil)

let matchData4 = matchData(homeTeam: "Manchester United", awayTeam: "Barcelona", homeLogo: "mutd_logo", awayLogo: "fcb_logo", status: .upcoming, timeStamp: 1710354600, homeTeamScore: nil, awayTeamScore: nil)

let leagueData:Array<matchData> = [matchData1, matchData2, matchData3, matchData4]

class ViewController: UIViewController {

    let leagueView: LeagueView = .init(leagueData: leagueData)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
                
        view.addSubview(leagueView)
        
        leagueView.snp.makeConstraints() {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            $0.leading.trailing.equalToSuperview() // Match leading and trailing edges of parent
            
        }
    }
}

