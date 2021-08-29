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
        nameHabitLabel.font = UIFont(name: "SFProText-Semibold", size: 13)
        nameHabitLabel.textColor = .black
        return nameHabitLabel
    }()
    
    var nameHabitTextField: UITextField = {
        let nameHabitText = UITextField()
        nameHabitText.font = UIFont(name: "SFProText-Regular", size: 17)
        nameHabitText.textColor = .black
        nameHabitText.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        return nameHabitText
    }()
    
    var colorHabitLabel: UILabel = {
        let colorHabitLabel = UILabel()
        colorHabitLabel.text = "ЦВЕТ"
        colorHabitLabel.font = UIFont(name: "SFProText-Semibold", size: 13)
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
        timeHabitLabel.font = UIFont(name: "SFProText-Semibold", size: 13)
        timeHabitLabel.textColor = .black
        return timeHabitLabel
    }()
    
    var timeHabitTextLabel: UILabel = {
        let timeHabitText = UILabel()
        timeHabitText.text = "Каждый день в "
        timeHabitText.font = UIFont(name: "SFProText-Regular", size: 17)
        timeHabitText.textColor = .black
        return timeHabitText
    }()
    
    var timeSelectedHabitTextLabel: UILabel = {
        let timeSelectedHabitText = UILabel()
        timeSelectedHabitText.font = UIFont(name: "SFProText-Regular", size: 17)
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
        deleteButton.titleLabel!.font = UIFont(name: "SFProText-Regular", size: 17)
        return deleteButton
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupView()
    }
    
    func setupView() {
        addSubview(nameHabitLabel)
        addSubview(nameHabitTextField)
        addSubview(colorHabitLabel)
        addSubview(colorHabitButton)
        addSubview(timeHabitLabel)
        addSubview(timeHabitTextLabel)
        addSubview(timeHabitPicker)
        addSubview(deleteButton)
        addSubview(timeSelectedHabitTextLabel)
        
        nameHabitLabel.translatesAutoresizingMaskIntoConstraints = false
        nameHabitTextField.translatesAutoresizingMaskIntoConstraints = false
        colorHabitLabel.translatesAutoresizingMaskIntoConstraints = false
        colorHabitButton.translatesAutoresizingMaskIntoConstraints = false
        timeHabitLabel.translatesAutoresizingMaskIntoConstraints = false
        timeHabitTextLabel.translatesAutoresizingMaskIntoConstraints = false
        timeHabitPicker.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        timeSelectedHabitTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            nameHabitLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 21),
            nameHabitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameHabitLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            nameHabitTextField.topAnchor.constraint(equalTo: nameHabitLabel.bottomAnchor, constant: 7),
            nameHabitTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameHabitTextField.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            colorHabitLabel.topAnchor.constraint(equalTo: nameHabitTextField.bottomAnchor, constant: 15),
            colorHabitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            colorHabitLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            colorHabitButton.topAnchor.constraint(equalTo: colorHabitLabel.bottomAnchor, constant: 7),
            colorHabitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            colorHabitButton.widthAnchor.constraint(equalToConstant: 30),
            colorHabitButton.heightAnchor.constraint(equalTo: colorHabitButton.widthAnchor),
            
            timeHabitLabel.topAnchor.constraint(equalTo: colorHabitButton.bottomAnchor, constant: 15),
            timeHabitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            timeHabitLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            timeHabitTextLabel.topAnchor.constraint(equalTo: timeHabitLabel.bottomAnchor, constant: 7),
            timeHabitTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            timeSelectedHabitTextLabel.topAnchor.constraint(equalTo: timeHabitLabel.bottomAnchor, constant: 7),
            timeSelectedHabitTextLabel.leadingAnchor.constraint(equalTo: timeHabitTextLabel.trailingAnchor, constant: 1),

            timeHabitPicker.topAnchor.constraint(equalTo: timeHabitTextLabel.bottomAnchor, constant: 15),
            timeHabitPicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            timeHabitPicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            deleteButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -52),
            deleteButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        ])
    }

}
