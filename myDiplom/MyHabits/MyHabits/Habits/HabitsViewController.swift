//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Fedor Boriskin on 09.08.2021.
//

import UIKit

class HabitsViewController: UIViewController {
    
    private lazy var habitsViewCollectian: UICollectionView = {
        let layuot = UICollectionViewFlowLayout()
        let habitsViewCollectian = UICollectionView(frame: .zero, collectionViewLayout: layuot)
        habitsViewCollectian.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: HabitCollectionViewCell.self))
        habitsViewCollectian.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: ProgressCollectionViewCell.self))
        habitsViewCollectian.backgroundColor = .systemGray6
        habitsViewCollectian.dataSource = self
        habitsViewCollectian.delegate = self
        return habitsViewCollectian
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        setHabitsCollectionView()        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        habitsViewCollectian.reloadData()
        
    }
    
   
    func setHabitsCollectionView() {
        view.addSubview(habitsViewCollectian)
        
        habitsViewCollectian.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            habitsViewCollectian.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            habitsViewCollectian.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            habitsViewCollectian.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            habitsViewCollectian.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
}



extension HabitsViewController: UICollectionViewDataSource {
      
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProgressCollectionViewCell.self), for: indexPath) as! ProgressCollectionViewCell
            cell.setupProgress(progress: HabitsStore.shared.todayProgress)
            return cell
        } else {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing:
                HabitCollectionViewCell.self), for: indexPath) as! HabitCollectionViewCell
            cell.habit = HabitsStore.shared.habits[indexPath.item]
            cell.dataDelegate = self
        return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return HabitsStore.shared.habits.count
        }
    }
}



extension HabitsViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
        return UIEdgeInsets(top: 20, left: 0, bottom: 0 , right: 0)
        } else {
            return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width - 32, height: 60)
        } else {
            return CGSize(width: collectionView.frame.width - 32, height: 130)
        }
    }
}


extension HabitsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let habit = HabitsStore.shared.habits[indexPath.row]
            let vc = HabitDetailsViewController(habit: habit)
            vc.title = HabitsStore.shared.habits[indexPath.row].name
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}



extension HabitsViewController: ReloadDataDelegate {
    func reloadData() {
        habitsViewCollectian.reloadData()
    }
}
