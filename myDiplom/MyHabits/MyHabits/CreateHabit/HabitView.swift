//
//  HabitView.swift
//  MyHabits
//
//  Created by Fedor Boriskin on 10.08.2021.
//

import UIKit

class HabitView: UIView {
    
    var nameHabitLabel: UILabel = {
        let nameHabitLabel = UILabel()
        nameHabitLabel.text = "НАЗВАНИЕ"
        nameHabitLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        nameHabitLabel.textColor = .black
        return nameHabitLabel
    }()
    
    var nameHabitText: UITextField = {
        let nameHabitText = UITextField()
        nameHabitText.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        nameHabitText.textColor = .black
        nameHabitText.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        return nameHabitText
    }()
    
    var colorHabitLabel: UILabel = {
        let colorHabitLabel = UILabel()
        colorHabitLabel.text = "ЦВЕТ"
        colorHabitLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        colorHabitLabel.textColor = .black
        return colorHabitLabel
    }()
    
    var colorHabitButton: UIButton = {
        var colorHabitButton = UIButton()
        colorHabitButton.backgroundColor = .red
        colorHabitButton.layer.cornerRadius = 15
        return colorHabitButton
    }()
 
    var timeHabitLabel: UILabel = {
        let timeHabitLabel = UILabel()
        timeHabitLabel.text = "ВРЕМЯ"
        timeHabitLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        timeHabitLabel.textColor = .black
        return timeHabitLabel
    }()
    
    var timeHabitText: UILabel = {
        let timeHabitText = UILabel()
        timeHabitText.text = "Каждый день в "
        timeHabitText.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        timeHabitText.textColor = .black
        return timeHabitText
    }()
    
    var timeSelectedHabitText: UILabel = {
        let timeSelectedHabitText = UILabel()
        timeSelectedHabitText.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        timeSelectedHabitText.textColor = UIColor(named: "purple")
        return timeSelectedHabitText
    }()
    
    var timeHabitPicker: UIDatePicker = {
        let timeHabitPocker = UIDatePicker()
        timeHabitPocker.datePickerMode = .time
        timeHabitPocker.preferredDatePickerStyle = .wheels
        return timeHabitPocker
    }()
    
    var deleteButton: UIButton = {
        var deleteButton = UIButton()
        deleteButton.setTitle("Удалить привычку", for: .normal)
        deleteButton.setTitleColor(.red, for: .normal)
        deleteButton.titleLabel!.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return deleteButton
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupView()
    }
    
    func setupView() {
        addSubview(nameHabitLabel)
        addSubview(nameHabitText)
        addSubview(colorHabitLabel)
        addSubview(colorHabitButton)
        addSubview(timeHabitLabel)
        addSubview(timeHabitText)
        addSubview(timeHabitPicker)
        addSubview(deleteButton)
        addSubview(timeSelectedHabitText)
        
        nameHabitLabel.translatesAutoresizingMaskIntoConstraints = false
        nameHabitText.translatesAutoresizingMaskIntoConstraints = false
        colorHabitLabel.translatesAutoresizingMaskIntoConstraints = false
        colorHabitButton.translatesAutoresizingMaskIntoConstraints = false
        timeHabitLabel.translatesAutoresizingMaskIntoConstraints = false
        timeHabitText.translatesAutoresizingMaskIntoConstraints = false
        timeHabitPicker.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        timeSelectedHabitText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            nameHabitLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 21),
            nameHabitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameHabitLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            nameHabitText.topAnchor.constraint(equalTo: nameHabitLabel.bottomAnchor, constant: 7),
            nameHabitText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameHabitText.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            colorHabitLabel.topAnchor.constraint(equalTo: nameHabitText.bottomAnchor, constant: 15),
            colorHabitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            colorHabitLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            colorHabitButton.topAnchor.constraint(equalTo: colorHabitLabel.bottomAnchor, constant: 7),
            colorHabitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            colorHabitButton.widthAnchor.constraint(equalToConstant: 30),
            colorHabitButton.heightAnchor.constraint(equalTo: colorHabitButton.widthAnchor),
            
            timeHabitLabel.topAnchor.constraint(equalTo: colorHabitButton.bottomAnchor, constant: 15),
            timeHabitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            timeHabitLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            timeHabitText.topAnchor.constraint(equalTo: timeHabitLabel.bottomAnchor, constant: 7),
            timeHabitText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            timeSelectedHabitText.topAnchor.constraint(equalTo: timeHabitLabel.bottomAnchor, constant: 7),
            timeSelectedHabitText.leadingAnchor.constraint(equalTo: timeHabitText.trailingAnchor, constant: 1),

            timeHabitPicker.topAnchor.constraint(equalTo: timeHabitText.bottomAnchor, constant: 15),
            timeHabitPicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            timeHabitPicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            deleteButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -52),
            deleteButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        ])
    }

}
