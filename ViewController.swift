//
//  ViewController.swift
//  Lesson3HomeWork2
//
//  Created by Mac on 01.12.2020.
//

import UIKit

class ViewController: UIViewController {

//    var totalScore: Int = 0
    @IBOutlet var tapGestureRecogniser: UITapGestureRecognizer!
    var scoreLabel: UILabel!
    var tapView: UIView!
//    var labelTopAnhcor:NSLayoutConstraint?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //scoreLabel = UILabel()
        //
        //addMyLabel()
        //addView()
        scoreLabel = UILabel()
        scoreLabel.addMyLabel(to: view)
        tapView = UIView()
        tapView.addMyView(to: view, with: scoreLabel)
    }
    



}

extension UILabel {
    func updateScore(to totalScore: Int) {
        
    }
    func addMyLabel(to view:UIView ) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .right
        self.text = "Score"
        view.addSubview(self)
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            self.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
extension UIView {
    func addMyView(to view:UIView, with label: UILabel) {
        view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemOrange
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            self.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
