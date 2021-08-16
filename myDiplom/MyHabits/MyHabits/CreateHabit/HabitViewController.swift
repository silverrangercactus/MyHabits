//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Fedor Boriskin on 10.08.2021.
//

import UIKit

class HabitViewController: UIViewController {
  
    var habitView = HabitView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Создать"
        
        setupHabitView()
        setButtoonsNavigationItem()
        tapCollorAddTarget()
        addActionTimeHabitPicker()
    }
    
    
    func  setupHabitView() {
        view.addSubview(habitView)
        habitView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            habitView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            habitView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            habitView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            habitView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    func setButtoonsNavigationItem() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(closeHabitViewController))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Создать", style: .done, target: self, action: #selector(createHabit))
    }

    @objc func closeHabitViewController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func createHabit() {
        let newHabit = Habit(name: "\(habitView.nameHabitText.text ?? "")", date: habitView.timeHabitPicker.date, color: (habitView.colorHabitButton.backgroundColor ?? .magenta))
        let store = HabitsStore.shared
        store.habits.append(newHabit)
//        dump(store.habits)
        print(store.habits.count)
        self.closeHabitViewController()
    }
    
    
    func tapCollorAddTarget() {
        habitView.colorHabitButton.addTarget(self, action: #selector(didTapSelectColor), for: .touchUpInside)
    }
    
    @objc func didTapSelectColor() {
        let selectColor = UIColorPickerViewController()
        selectColor.delegate = self
        present(selectColor, animated: true, completion: nil)
    }
    
    
    func addActionTimeHabitPicker() {
        habitView.timeHabitPicker.addTarget(self, action: #selector(selectedDateAction), for: .valueChanged)
    }
    
    func chooseTime() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let selectedDate = dateFormatter.string(from: habitView.timeHabitPicker.date)
        habitView.timeHabitText.text = "Каждый день в " + "\(selectedDate)"
    }
    
    @objc func selectedDateAction() {
        chooseTime()
    }
   
}

extension HabitViewController: UIColorPickerViewControllerDelegate {
   
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        habitView.colorHabitButton.backgroundColor = color
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        habitView.colorHabitButton.backgroundColor = color
    }
}
