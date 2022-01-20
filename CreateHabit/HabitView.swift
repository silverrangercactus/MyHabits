//
//  HabitView.swift
//  MyHabits
//
//  Created by Fedor Boriskin on 10.08.2021.
//

import UIKit

class HabitView: UIView {
    
    var stackView = UIStackView()
    
    var nameHabitLabel: UILabel = {
        let nameHabitLabel = UILabel()
        nameHabitLabel.text = "НАЗВАНИЕ"
        nameHabitLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        nameHabitLabel.textColor = .black
        return nameHabitLabel
    }()
    
    var nameHabitTextField: UITextField = {
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
    
    var timeHabitTextLabel: UILabel = {
        let timeHabitText = UILabel()
        timeHabitText.text = "Каждый день в "
        timeHabitText.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        timeHabitText.textColor = .black
        return timeHabitText
    }()
    
    var timeSelectedHabitTextLabel: UILabel = {
        let timeSelectedHabitText = UILabel()
        timeSelectedHabitText.font = UIFont.systemFont(ofSize: 17, weight: .regular)
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
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .top
        stackView.distribution = .fill
        
        stackView.addArrangedSubview(nameHabitLabel)
        stackView.addArrangedSubview(nameHabitTextField)
        stackView.addArrangedSubview(colorHabitLabel)
        stackView.addArrangedSubview(colorHabitButton)
        stackView.addArrangedSubview(timeHabitLabel)
        stackView.addArrangedSubview(timeHabitTextLabel)
        stackView.addArrangedSubview(timeHabitPicker)
        addSubview(timeSelectedHabitTextLabel)
        addSubview(deleteButton)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        timeSelectedHabitTextLabel.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.setCustomSpacing(7, after: nameHabitLabel)
        stackView.setCustomSpacing(7, after: colorHabitLabel)
        stackView.setCustomSpacing(7, after: timeHabitLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 21),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            colorHabitButton.widthAnchor.constraint(equalToConstant: 30),
            colorHabitButton.heightAnchor.constraint(equalTo: colorHabitButton.widthAnchor),
            
            timeHabitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            timeSelectedHabitTextLabel.leadingAnchor.constraint(equalTo: timeHabitTextLabel.trailingAnchor, constant: 1),
            timeSelectedHabitTextLabel.topAnchor.constraint(equalTo: timeHabitLabel.bottomAnchor, constant: 7),

            timeHabitPicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            timeHabitPicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            deleteButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18),
            deleteButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}











