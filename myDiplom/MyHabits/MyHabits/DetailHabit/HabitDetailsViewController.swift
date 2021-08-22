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
        
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .white
        
        setupTableView()
        setButtoonsNavigationItem()
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
    }
    
    
    @objc func editTap() {
        let habitViewController = HabitViewController()
        habitViewController.habitView.habit = habit
        
        let habitViewController1 = UINavigationController(rootViewController: habitViewController)
        habitViewController1.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        habitViewController1.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(habitViewController1, animated: true)
    }
}

extension HabitDetailsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HabitsStore.shared.dates.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Активность"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = HabitsStore.shared.trackDateString(forIndex: indexPath.row)
            if HabitsStore.shared.habit(habit, isTrackedIn: HabitsStore.shared.dates[indexPath.item]) == true {
            cell.accessoryType = .checkmark
        }
       return cell
    }
}




