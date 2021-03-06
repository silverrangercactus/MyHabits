//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Fedor Boriskin on 16.08.2021.
//

import UIKit

class HabitDetailsViewController: UIViewController {
    
    var tableView = UITableView(frame: .zero, style: .grouped)
    var cellID = "cellID"
       
    let habit: Habit
       
    init(habit: Habit) {
        self.habit = habit
        super.init(nibName: nil, bundle: nil)
    }
       
    required init(coder: NSCoder) {
        fatalError()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        view.backgroundColor = .white
        
        setupTableView()
        setButtoonsNavigationItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationItem.title = habit.name
    }
    
    @objc func openHabitsVC() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func setupTableView(){
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setButtoonsNavigationItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .done, target: self, action: #selector(editTap))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.init(named: "purple")
    }
    
    
    @objc func editTap() {
        let habitViewController = HabitViewController()
        habitViewController.habit = habit
    
        let habitViewController1 = UINavigationController(rootViewController: habitViewController)
        habitViewController1.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        habitViewController1.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(habitViewController1, animated: true)
        habitViewController.reloadDelegate = self
    }
}

extension HabitDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HabitsStore.shared.dates.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Активность"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let indexDates = HabitsStore.shared.dates.count - indexPath.row - 1
        cell.textLabel?.text = HabitsStore.shared.trackDateString(forIndex: indexDates)
            
        if HabitsStore.shared.habit(habit, isTrackedIn: HabitsStore.shared.dates[indexDates]) == true {
            cell.accessoryType = .checkmark
            cell.tintColor = UIColor.init(named: "purple")
        } else {
            cell.accessoryType = .none
        }
       return cell
    }
}

extension HabitDetailsViewController: ReopenVcDelegate {
    func reopenVC() {
        navigationController?.popToRootViewController(animated: true)
    }
}



