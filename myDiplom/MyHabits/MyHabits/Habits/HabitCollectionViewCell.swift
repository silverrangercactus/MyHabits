//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Fedor Boriskin on 11.08.2021.
//

import UIKit


protocol ReloadDataDelegate: AnyObject {
    func reloadData()
}


class HabitCollectionViewCell: UICollectionViewCell {
        
    weak var dataDelegate: ReloadDataDelegate?
    
    var habit: Habit? {
        didSet {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "H:mm"
           
            habitLabelCellLabel.text = habit?.name
            habitLabelCellLabel.textColor = habit?.color
            habitDescriptionCellLabel.text = "Каждый день в " + String(describing: dateFormatter.string(from: habit!.date))
            habitCountCellLabel.text = "Счетчик: " + String(describing: (habit?.trackDates.count ?? 0))
            habitDoneCellButton.layer.borderColor = habit?.color.cgColor
            
            if habit?.isAlreadyTakenToday == true {
                habitDoneCellButton.backgroundColor = habit?.color
                habitDoneCellButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
                habitDoneCellButton.tintColor = .white
            } else {
                habitDoneCellButton.backgroundColor = .white
                habitDoneCellButton.setBackgroundImage(.none, for: .normal)
            }
        }
    }
    
    var habitLabelCellLabel: UILabel = {
        let habitLabelCell = UILabel()
        habitLabelCell.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        habitLabelCell.numberOfLines = 2
        habitLabelCell.textColor = .black
        return habitLabelCell
    }()
    
    var habitDescriptionCellLabel: UILabel = {
        let habitDescriptionCell = UILabel()
        habitDescriptionCell.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        habitDescriptionCell.numberOfLines = 1
        habitDescriptionCell.textColor = .lightGray
        return habitDescriptionCell
    }()
    
    var habitCountCellLabel: UILabel = {
        let habitCountCell = UILabel()
        habitCountCell.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        habitCountCell.numberOfLines = 1
        habitCountCell.textColor = .gray
        return habitCountCell
    }()
    
    var habitDoneCellButton: UIButton = {
        let habitDoneCell = UIButton()
        habitDoneCell.layer.cornerRadius = 18
        habitDoneCell.layer.masksToBounds = true
        habitDoneCell.layer.borderWidth = 2
        habitDoneCell.layer.borderColor = UIColor.yellow.cgColor
        return habitDoneCell
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func tapHabitDoneCell() {
        habitDoneCellButton.setBackgroundImage(UIImage(systemName: "checkmark"), for: .selected)
        dataDelegate?.reloadData()
        if habit?.isAlreadyTakenToday == false {
            HabitsStore.shared.track(habit!)
        } else {
            return
        }
    }
    
    
    func setupViews() {
        contentView.backgroundColor = .white
        contentView.roundCornersWithRadius(12)
        contentView.addSubview(habitLabelCellLabel)
        contentView.addSubview(habitDescriptionCellLabel)
        contentView.addSubview(habitCountCellLabel)
        contentView.addSubview(habitDoneCellButton)
        
        habitDoneCellButton.addTarget(self, action: #selector(tapHabitDoneCell), for: .touchUpInside)

        habitLabelCellLabel.translatesAutoresizingMaskIntoConstraints = false
        habitDescriptionCellLabel.translatesAutoresizingMaskIntoConstraints = false
        habitCountCellLabel.translatesAutoresizingMaskIntoConstraints = false
        habitDoneCellButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            habitLabelCellLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            habitLabelCellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            habitLabelCellLabel.widthAnchor.constraint(equalToConstant: 220),
            
            habitDescriptionCellLabel.topAnchor.constraint(equalTo: habitLabelCellLabel.bottomAnchor, constant: 4),
            habitDescriptionCellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            habitCountCellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            habitCountCellLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            habitDoneCellButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 47),
            habitDoneCellButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            habitDoneCellButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -47),
            habitDoneCellButton.widthAnchor.constraint(equalToConstant: 36),
            habitDoneCellButton.heightAnchor.constraint(equalTo: habitDoneCellButton.widthAnchor)
        ])
    }
}

extension UIView {
    
    func roundCornersWithRadius(_ radius: CGFloat, top: Bool? = true, bottom: Bool? = true, shadowEnabled: Bool = true) {
        var maskedCorners = CACornerMask()
        
        switch(top, bottom) {
        case (true, false):
            maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        case (false, true):
            maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        case (true, true):
            maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        default:
            break
        }
        layer.cornerRadius = radius
        layer.maskedCorners = maskedCorners
    }
}
