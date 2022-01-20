//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Fedor Boriskin on 09.08.2021.
//

import UIKit

class InfoViewController: UIViewController {
    
    var informationView = UIScrollView()
    var stackView = UIStackView()

    var infoTextLabel: UILabel = {
       let infoTextLabel = UILabel()
        infoTextLabel.text = "Привычка за 21 день"
        infoTextLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        infoTextLabel.textColor = .black
        return infoTextLabel
    }()

    var infoText1Label: UILabel = {
        let infoText1 = UILabel()
        infoText1.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:"
        infoText1.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoText1.textColor = .black
        infoText1.numberOfLines = 0
        return infoText1
    } ()

    var infoText2Label: UILabel = {
        let infoText2 = UILabel()
        infoText2.text = "1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага."
        infoText2.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoText2.textColor = .black
        infoText2.numberOfLines = 0
        return infoText2
    } ()
    
    var infoText3Label: UILabel = {
        let infoText3 = UILabel()
        infoText3.text = "2. Выдержать 2 дня в прежнем состоянии самоконтроля."
        infoText3.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoText3.textColor = .black
        infoText3.numberOfLines = 0
        return infoText3
    } ()
    
    var infoText4Label: UILabel = {
        let infoText4 = UILabel()
        infoText4.text = "3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче, с чем еще предстоит серьезно бороться."
        infoText4.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoText4.textColor = .black
        infoText4.numberOfLines = 0
        return infoText4
    } ()
    
    var infoText5Label: UILabel = {
        let infoText5 = UILabel()
        infoText5.text = "4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств."
        infoText5.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoText5.textColor = .black
        infoText5.numberOfLines = 0
        return infoText5
    } ()
    
    var infoText6Label: UILabel = {
        let infoText6 = UILabel()
        infoText6.text = "5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой."
        infoText6.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoText6.textColor = .black
        infoText6.numberOfLines = 0
        return infoText6
    } ()
    
    var infoText7Label: UILabel = {
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
        informationView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 16
        
        stackView.addArrangedSubview(infoTextLabel)
        stackView.addArrangedSubview(infoText1Label)
        stackView.addArrangedSubview(infoText2Label)
        stackView.addArrangedSubview(infoText3Label)
        stackView.addArrangedSubview(infoText4Label)
        stackView.addArrangedSubview(infoText5Label)
        stackView.addArrangedSubview(infoText6Label)
        stackView.addArrangedSubview(infoText7Label)

        informationView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            informationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            informationView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            informationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            informationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: informationView.topAnchor, constant: 22),
            stackView.bottomAnchor.constraint(equalTo: informationView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
