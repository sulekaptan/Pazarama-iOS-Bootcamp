//
//  StatsTableViewCell.swift
//  Pokemon
//
//  Created by Emincan Antalyalı on 3.11.2023.
//

import UIKit

final class StatsTableViewCell: UITableViewCell {

    static let identifier = "StatsTableViewCell"
    var stat: Stat? {
        didSet {
            statNameLabel.text = stat?.stat?.name?.capitalized.replacingOccurrences(of: "-", with: " ")
            if let statBar = stat?.baseStat {
                let progress = Float(statBar) / 100
                progressView.setProgress(progress, animated: false)
            }
        }
    }
    var color: UIColor? {
        didSet {
            progressView.tintColor = color
            statNameLabel.textColor = color
        }
    }

    private let statNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor(named: "bulbasourColor")
        return label
    }()
    private var progressView: UIProgressView = {
        let progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.setProgress(0.4, animated: false)
        progress.tintColor = .orange
        return progress
    }()

    private let hStackview: UIStackView = {
        let sView = UIStackView()
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.axis = .horizontal
        sView.distribution = .fillEqually
        sView.alignment = .center
        return sView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        stat = nil
    }

    private func setupView() {
        contentView.addSubview(hStackview)
        hStackview.addArrangedSubview(statNameLabel)
        hStackview.addArrangedSubview(progressView)
        self.hStackview.frame = bounds

        NSLayoutConstraint.activate([
            hStackview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            hStackview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            hStackview.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            hStackview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
