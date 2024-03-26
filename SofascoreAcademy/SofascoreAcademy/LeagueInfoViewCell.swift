import UIKit
import SnapKit
class LeagueInfoViewCell: UITableViewCell {
        
    let leagueInfoView = LeagueInfoView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            addViews()
            setupConstraints()
        }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func update(countryName: String, leagueName: String, leagueLogo: String) {
        leagueInfoView.update(countryName: countryName, leagueName: leagueName, leagueLogo: leagueLogo)
    }
    
    func addViews() {
        contentView.addSubview(leagueInfoView)
    }

    func setupConstraints() {
        leagueInfoView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(56)
        }
    }
}
