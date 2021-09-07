//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Fedor Boriskin on 10.08.2021.
//

import UIKit

class HabitViewController: UIViewController {
  
    var habitView = HabitView()
    
    public var habit: Habit? {
        didSet {
            editHabit()
        }
    }
       
    func editHabit() {
        if let editHabit = habit {
            habitView.nameHabitTextField.text = editHabit.name
            habitView.nameHabitTextField.textColor = editHabit.color
            habitView.nameHabitTextField.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            habitView.colorHabitButton.backgroundColor = editHabit.color
            habitView.timeHabitPicker.date = editHabit.date
            habitView.timeSelectedHabitTextLabel.text = "\(editHabit.date)"
            navigationItem.title = "Править"
            habitView.deleteButton.isHidden = false
    } else {
            navigationItem.title = "Создать"
            habitView.deleteButton.isHidden = true
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        editHabit()
        setupHabitView()
        setButtoonsNavigationItem()
        tapCollorAddTarget()
        addActionTimeHabitPicker()
        addActiondeleteHabitButton()
        timeFormatt()
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
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.init(named: "purple")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(createHabitAndEdit))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.init(named: "purple")
    }

    @objc func closeHabitViewController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func createHabitAndEdit() {
        if let changedHabit = self.habit {
            changedHabit.name = habitView.nameHabitTextField.text ?? ""
            changedHabit.date = habitView.timeHabitPicker.date
            changedHabit.color = habitView.colorHabitButton.backgroundColor ?? .white
            HabitsStore.shared.save()
        } else {
            let newHabit = Habit(name: "\(habitView.nameHabitTextField.text ?? "")",
                            date: habitView.timeHabitPicker.date,
                            color: (habitView.colorHabitButton.backgroundColor ?? .magenta))
        
            let store = HabitsStore.shared
            store.habits.append(newHabit)
            print(store.habits.count)
        }
        self.dismiss(animated: true, completion: nil)
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
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .none
        habitView.timeSelectedHabitTextLabel.text = dateFormatter.string(from: habitView.timeHabitPicker.date)
    }
    
    @objc func selectedDateAction() {
        chooseTime()
    }
    
    func addActiondeleteHabitButton() {
        habitView.deleteButton.addTarget(self, action: #selector(alertController), for: .touchUpInside)
    }
    
    @objc func alertController() {
        if let deleteHabit = habit {
        let alertController = UIAlertController(title: "Удалить привычку?", message: "Вы хотите удалить привычку \(deleteHabit.name)", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { _ in
            
            self.deleteHabit()
            self.dismiss(animated: true, completion: nil)
            }
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
    func deleteHabit() {
        if let index = HabitsStore.shared.habits.firstIndex(of: self.habit!) {
            HabitsStore.shared.habits.remove(at: index)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "openHabitsVC"), object: nil)
        }
    }
    
    
    func timeFormatt() {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        timeFormatter.dateStyle = .none
        habitView.timeSelectedHabitTextLabel.text = timeFormatter.string(from: habitView.timeHabitPicker.date)
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
