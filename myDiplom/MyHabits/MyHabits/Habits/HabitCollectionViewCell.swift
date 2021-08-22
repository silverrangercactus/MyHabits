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
            
            habitLabelCell.text = habit?.name
            habitLabelCell.textColor = habit?.color
            habitDescriptionCell.text = "Каждый день в " + String(describing: dateFormatter.string(from: habit!.date))
            habitCountCell.text = "Счетчик: " + String(describing: habit!.trackDates.count)
            habitDoneCell.layer.borderColor = habit?.color.cgColor
            
            if habit?.isAlreadyTakenToday == true {
                habitDoneCell.backgroundColor = habit?.color
                habitDoneCell.setBackgroundImage(UIImage(systemName: "checkmark"), for: .normal)
            } else {
                habitDoneCell.backgroundColor = .white
                habitDoneCell.setBackgroundImage(.none, for: .normal)
            }
        }
    }
    
    var habitLabelCell: UILabel = {
        let habitLabelCell = UILabel()
        habitLabelCell.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        habitLabelCell.numberOfLines = 2
        habitLabelCell.textColor = .black
        return habitLabelCell
    }()
    
    var habitDescriptionCell: UILabel = {
        let habitDescriptionCell = UILabel()
        habitDescriptionCell.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        habitDescriptionCell.numberOfLines = 1
        habitDescriptionCell.textColor = .lightGray
        return habitDescriptionCell
    }()
    
    var habitCountCell: UILabel = {
        let habitCountCell = UILabel()
        habitCountCell.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        habitCountCell.numberOfLines = 1
        habitCountCell.textColor = .gray
        return habitCountCell
    }()
    
    var habitDoneCell: UIButton = {
        let habitDoneCell = UIButton()
        habitDoneCell.layer.cornerRadius = 18
        habitDoneCell.layer.masksToBounds = true
        habitDoneCell.layer.borderWidth = 2
        habitDoneCell.layer.borderColor = UIColor.yellow.cgColor
        return habitDoneCell
    }()
    
    @objc func tapHabitDoneCell() {
//        if habitDoneCell.isSelected {
//            habitDoneCell.isSelected = false
//            habitDoneCell.backgroundColor = .white
//            habitDoneCell.setBackgroundImage(.none, for: .normal)
//        } else {
//            habitDoneCell.isSelected = true
//            habitDoneCell.backgroundColor = habit?.color
            habitDoneCell.setBackgroundImage(UIImage(systemName: "checkmark"), for: .selected)
            dataDelegate?.reloadData()
                if habit?.isAlreadyTakenToday == false {
                    HabitsStore.shared.track(habit!)
                } else {
                    return
                }
          //  }
    }
    
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
        contentView.addSubview(habitLabelCell)
        contentView.addSubview(habitDescriptionCell)
        contentView.addSubview(habitCountCell)
        contentView.addSubview(habitDoneCell)
        
        habitDoneCell.addTarget(self, action: #selector(tapHabitDoneCell), for: .touchUpInside)

        
        habitLabelCell.translatesAutoresizingMaskIntoConstraints = false
        habitDescriptionCell.translatesAutoresizingMaskIntoConstraints = false
        habitCountCell.translatesAutoresizingMaskIntoConstraints = false
        habitDoneCell.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            habitLabelCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            habitLabelCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            habitLabelCell.widthAnchor.constraint(equalToConstant: 220),
            
            habitDescriptionCell.topAnchor.constraint(equalTo: habitLabelCell.bottomAnchor, constant: 4),
            habitDescriptionCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
           // habitCountCell.topAnchor.constraint(equalTo: habitDescriptionCell.bottomAnchor, constant: 30),
            habitCountCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            habitCountCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            habitDoneCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 47),
            habitDoneCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            habitDoneCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -47),
            habitDoneCell.widthAnchor.constraint(equalToConstant: 36),
            habitDoneCell.heightAnchor.constraint(equalTo: habitDoneCell.widthAnchor)
        ])
    }
    
}

extension UIView {
    
    func roundCornersWithRadius(_ radius: CGFloat, top: Bool? = true, bottom: Bool? = true, shadowEnabled: Bool = true) {
        var maskedCorners = CACornerMask()
        
        clipsToBounds = true

        if shadowEnabled {
            layer.masksToBounds = false
            layer.shadowOpacity = 0.5
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowRadius = 4
            layer.shadowOffset = CGSize(width: 4, height: 4)
        }
        
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

extension UIButton {
     
    
    
}
