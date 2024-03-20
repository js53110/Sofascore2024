import Foundation

public enum helpers {

    static func getMatchStatus(matchId: Int) -> matchStatus {
        if let match = leagueData.first(where: { $0.matchId == matchId }) {
            let matchStatus = match.status
            return matchStatus
        }
        return .upcoming
    }

    static func determineMatchStatusString(matchStatus: matchStatus) -> String {
        switch matchStatus {
        case .finished:
            return "FT"
        case .inProgress:
            return "37'" // Updating time in ViewController
        default:
            return "-"
        }
    }

    static func convertTimestampToTime(timeStamp: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timeStamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let timeString = dateFormatter.string(from: date)
        return timeString
    }
}
