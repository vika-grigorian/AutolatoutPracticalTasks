//
//  Task2.swift
//  AutolatoutPracticalTasks
//
//  Created by Kakhaberi Kiknadze on 20.03.25.
//

import UIKit

// Build a UI programmatically with a UIButton positioned below a UILabel.
// The button should be centered horizontally and have a fixed distance from the label.
// Adjust the layout to handle different screen sizes.
final class Task2ViewController: UIViewController {
    
    let label = UILabel()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        
        label.text = "Wellcome!"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Let's start", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    }
}

#Preview {
    Task2ViewController()
}
