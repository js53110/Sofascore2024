import UIKit
import SnapKit
class MatchViewCell: UITableViewCell {
        
    let matchView = MatchView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            addViews()
            setupConstraints()
        }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func update(data: matchData) {
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
