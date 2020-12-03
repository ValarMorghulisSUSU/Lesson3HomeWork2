//
//  ViewController.swift
//  Lesson3HomeWork2
//
//  Created by Mac on 01.12.2020.
//

import UIKit

class ViewController: UIViewController {

    var totalScore: Int = 0
    var scoreLabel: UILabel!
    var tapView: UIView!
    
    private var lastTranslation:CGFloat = 0
    private lazy var panGestureRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer (
        target: self, action: #selector(tapViewDidSlide(_:))
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scoreLabel = UILabel()
        tapView = UIView()
        view.addSubview(scoreLabel)
        view.changeMyLabel(scoreLabel)
        view.addSubview(tapView)
        view.changeMyView(tapView, with: scoreLabel)
        tapView.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    
    
    @objc func tapViewDidSlide(_ sender: UIPanGestureRecognizer){
        switch sender.state {
        case .changed:
            let change = sender.translation(in: tapView).y - lastTranslation
            if change < 0 {
                totalScore += 1
            }
            if change > 0 {
                totalScore -= 1
            }
            lastTranslation = sender.translation(in: tapView).y
            scoreLabel.updateScore(to: totalScore)
        default: break
        }
    }

}

extension UILabel {
    func updateScore(to totalScore: Int) {
        self.text = "Число: \(totalScore)"
    }
    
}
extension UIView {
    func changeMyView(_ wich: UIView, with label: UILabel) {
        wich.translatesAutoresizingMaskIntoConstraints = false
        wich.backgroundColor = .systemOrange
        NSLayoutConstraint.activate([
            wich.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40),
            wich.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            wich.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2),
            wich.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -60)
        ])
    }
    func changeMyLabel(_ myLabel: UILabel) {
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.textAlignment = .right
        myLabel.text = "Число: "
        self.addSubview(myLabel)
        NSLayoutConstraint.activate([
            myLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            myLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            myLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
