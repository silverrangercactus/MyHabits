//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Fedor Boriskin on 09.08.2021.
//

import UIKit

class InfoViewController: UIViewController {
    
    var informationView = UIScrollView()

    var infoTextLabel: UILabel = {
       let infoTextLabel = UILabel()
        infoTextLabel.text = "Привычка за 21 день"
        infoTextLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        infoTextLabel.textColor = .black
        return infoTextLabel
    }()

    var infoText1: UILabel = {
        let infoText1 = UILabel()
        infoText1.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:"
        infoText1.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoText1.textColor = .black
        infoText1.numberOfLines = 0
        return infoText1
    } ()

    var infoText2: UILabel = {
        let infoText2 = UILabel()
        infoText2.text = "1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага."
        infoText2.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoText2.textColor = .black
        infoText2.numberOfLines = 0
        return infoText2
    } ()
    
    var infoText3: UILabel = {
        let infoText3 = UILabel()
        infoText3.text = "2. Выдержать 2 дня в прежнем состоянии самоконтроля."
        infoText3.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoText3.textColor = .black
        infoText3.numberOfLines = 0
        return infoText3
    } ()
    
    var infoText4: UILabel = {
        let infoText4 = UILabel()
        infoText4.text = "3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче, с чем еще предстоит серьезно бороться."
        infoText4.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoText4.textColor = .black
        infoText4.numberOfLines = 0
        return infoText4
    } ()
    
    var infoText5: UILabel = {
        let infoText5 = UILabel()
        infoText5.text = "4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств."
        infoText5.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoText5.textColor = .black
        infoText5.numberOfLines = 0
        return infoText5
    } ()
    
    var infoText6: UILabel = {
        let infoText6 = UILabel()
        infoText6.text = "5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой."
        infoText6.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoText6.textColor = .black
        infoText6.numberOfLines = 0
        return infoText6
    } ()
    
    var infoText7: UILabel = {
        let infoText7 = UILabel()
        infoText7.text = "6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся."
        infoText7.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoText7.textColor = .black
        infoText7.numberOfLines = 0
        return infoText7
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInformationView()
    }
    
    
    func setupInformationView() {
        view.addSubview(informationView)
        informationView.addSubview(infoTextLabel)
        informationView.addSubview(infoText1)
        informationView.addSubview(infoText2)
        informationView.addSubview(infoText3)
        informationView.addSubview(infoText4)
        informationView.addSubview(infoText5)
        informationView.addSubview(infoText6)
        informationView.addSubview(infoText7)

        informationView.translatesAutoresizingMaskIntoConstraints = false
        infoTextLabel.translatesAutoresizingMaskIntoConstraints = false
        infoText1.translatesAutoresizingMaskIntoConstraints = false
        infoText2.translatesAutoresizingMaskIntoConstraints = false
        infoText3.translatesAutoresizingMaskIntoConstraints = false
        infoText4.translatesAutoresizingMaskIntoConstraints = false
        infoText5.translatesAutoresizingMaskIntoConstraints = false
        infoText6.translatesAutoresizingMaskIntoConstraints = false
        infoText7.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            informationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            informationView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            informationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            informationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            infoTextLabel.topAnchor.constraint(equalTo: informationView.topAnchor, constant: 22),
            infoTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            infoText1.topAnchor.constraint(equalTo: infoTextLabel.bottomAnchor, constant: 16),
            infoText1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoText1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            infoText2.topAnchor.constraint(equalTo: infoText1.bottomAnchor, constant: 12),
            infoText2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoText2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            infoText3.topAnchor.constraint(equalTo: infoText2.bottomAnchor, constant: 12),
            infoText3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoText3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            infoText4.topAnchor.constraint(equalTo: infoText3.bottomAnchor, constant: 12),
            infoText4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoText4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            infoText5.topAnchor.constraint(equalTo: infoText4.bottomAnchor, constant: 12),
            infoText5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoText5.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            infoText6.topAnchor.constraint(equalTo: infoText5.bottomAnchor, constant: 12),
            infoText6.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoText6.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            infoText7.topAnchor.constraint(equalTo: infoText6.bottomAnchor, constant: 12),
            infoText7.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoText7.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            infoText7.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -16)
        ])
    }
}
