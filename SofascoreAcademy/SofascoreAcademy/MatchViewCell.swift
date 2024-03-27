import UIKit
import SnapKit
class MatchViewCell: UITableViewCell {
        
    let matchView = MatchView()
    var matchId: Int = 0

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            addViews()
            setupConstraints()
        }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func update(data: matchData) {
        matchId = data.matchId
        matchView.update(data: data)
    }
    
    func addViews() {
        contentView.addSubview(matchView)
    }

    func setupConstraints() {
        matchView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(56)
        }
    }
}

extension MatchViewCell {
    func updateScore(score: Int, side: teamSide){
        matchView.updateScore(score: score, side: side)
    }
    
//    func updateMatchStatus(status: matchStatus) {
//        homeResult.updateMatchStatus(status: status)
//        awayResult.updateMatchStatus(status: status)
//        timeStatusView.updateMatchStatus(status: status)
//    }
//    
//    func updateMatchTime(time: Int) {
//        timeStatusView.updateMatchTime(time: time)
//    }
}
