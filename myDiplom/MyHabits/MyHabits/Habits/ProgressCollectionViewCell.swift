//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Fedor Boriskin on 12.08.2021.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
 
    var progress: Habit? {
        didSet {
            progressPercent.text = String(Int(HabitsStore.shared.todayProgress * 100)) + "%"
            progressView.progress = HabitsStore.shared.todayProgress
        }}
    
    var progressView: UIProgressView = {
        let progressView = UIProgressView()
        return progressView
    }()
    
    var progressLabel: UILabel = {
        let progressLabel = UILabel()
        progressLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        progressLabel.text = "Всё получиться!"
        progressLabel.numberOfLines = 1
        progressLabel.textColor = .gray
        return progressLabel
    }()
    
    var progressPercent: UILabel = {
        let progressPercent = UILabel()
        progressPercent.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        progressPercent.text = ""
        progressPercent.numberOfLines = 1
        progressPercent.textColor = .gray
        return progressPercent
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.backgroundColor = .white
        contentView.roundCornersWithRadius(12)
        contentView.addSubview(progressLabel)
        contentView.addSubview(progressView)
        contentView.addSubview(progressPercent)
        
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressPercent.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            progressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            progressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            progressView.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 10),
            progressView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            progressView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progressView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            progressView.heightAnchor.constraint(equalToConstant: 7),
            
            progressPercent.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            progressPercent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])
    }
}
