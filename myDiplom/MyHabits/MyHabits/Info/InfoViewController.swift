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
        infoTextLabel.font = UIFont(name: "SFProText-Regular", size: 17)
        infoTextLabel.textColor = .black
        return infoTextLabel
    }()

    var infoText1Label: UILabel = {
        let infoText1 = UILabel()
        infoText1.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:"
        infoText1.font = UIFont(name: "SFProText-Regular", size: 17)
        infoText1.textColor = .black
        infoText1.numberOfLines = 0
        return infoText1
    } ()

    var infoText2Label: UILabel = {
        let infoText2 = UILabel()
        infoText2.text = "1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага."
        infoText2.font = UIFont(name: "SFProText-Regular", size: 17)
        infoText2.textColor = .black
        infoText2.numberOfLines = 0
        return infoText2
    } ()
    
    var infoText3Label: UILabel = {
        let infoText3 = UILabel()
        infoText3.text = "2. Выдержать 2 дня в прежнем состоянии самоконтроля."
        infoText3.font = UIFont(name: "SFProText-Regular", size: 17)
        infoText3.textColor = .black
        infoText3.numberOfLines = 0
        return infoText3
    } ()
    
    var infoText4Label: UILabel = {
        let infoText4 = UILabel()
        infoText4.text = "3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче, с чем еще предстоит серьезно бороться."
        infoText4.font = UIFont(name: "SFProText-Regular", size: 17)
        infoText4.textColor = .black
        infoText4.numberOfLines = 0
        return infoText4
    } ()
    
    var infoText5Label: UILabel = {
        let infoText5 = UILabel()
        infoText5.text = "4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств."
        infoText5.font = UIFont(name: "SFProText-Regular", size: 17)
        infoText5.textColor = .black
        infoText5.numberOfLines = 0
        return infoText5
    } ()
    
    var infoText6Label: UILabel = {
        let infoText6 = UILabel()
        infoText6.text = "5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой."
        infoText6.font = UIFont(name: "SFProText-Regular", size: 17)
        infoText6.textColor = .black
        infoText6.numberOfLines = 0
        return infoText6
    } ()
    
    var infoText7Label: UILabel = {
        let infoText7 = UILabel()
        infoText7.text = "6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся."
        infoText7.font = UIFont(name: "SFProText-Regular", size: 17)
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
        informationView.addSubview(infoText1Label)
        informationView.addSubview(infoText2Label)
        informationView.addSubview(infoText3Label)
        informationView.addSubview(infoText4Label)
        informationView.addSubview(infoText5Label)
        informationView.addSubview(infoText6Label)
        informationView.addSubview(infoText7Label)

        informationView.translatesAutoresizingMaskIntoConstraints = false
        infoTextLabel.translatesAutoresizingMaskIntoConstraints = false
        infoText1Label.translatesAutoresizingMaskIntoConstraints = false
        infoText2Label.translatesAutoresizingMaskIntoConstraints = false
        infoText3Label.translatesAutoresizingMaskIntoConstraints = false
        infoText4Label.translatesAutoresizingMaskIntoConstraints = false
        infoText5Label.translatesAutoresizingMaskIntoConstraints = false
        infoText6Label.translatesAutoresizingMaskIntoConstraints = false
        infoText7Label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            informationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            informationView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            informationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            informationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            infoTextLabel.topAnchor.constraint(equalTo: informationView.topAnchor, constant: 22),
            infoTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            infoText1Label.topAnchor.constraint(equalTo: infoTextLabel.bottomAnchor, constant: 16),
            infoText1Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoText1Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            infoText2Label.topAnchor.constraint(equalTo: infoText1Label.bottomAnchor, constant: 12),
            infoText2Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoText2Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            infoText3Label.topAnchor.constraint(equalTo: infoText2Label.bottomAnchor, constant: 12),
            infoText3Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoText3Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            infoText4Label.topAnchor.constraint(equalTo: infoText3Label.bottomAnchor, constant: 12),
            infoText4Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoText4Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            infoText5Label.topAnchor.constraint(equalTo: infoText4Label.bottomAnchor, constant: 12),
            infoText5Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoText5Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            infoText6Label.topAnchor.constraint(equalTo: infoText5Label.bottomAnchor, constant: 12),
            infoText6Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoText6Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            infoText7Label.topAnchor.constraint(equalTo: infoText6Label.bottomAnchor, constant: 12),
            infoText7Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoText7Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            infoText7Label.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: -16)
        ])
    }
}
