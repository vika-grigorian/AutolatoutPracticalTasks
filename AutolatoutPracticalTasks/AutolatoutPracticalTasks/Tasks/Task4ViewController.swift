//
//  Task4ViewController.swift
//  AutolatoutPracticalTasks
//
//  Created by Kakhaberi Kiknadze on 20.03.25.
//

import UIKit

// Create a view with two subviews aligned vertically when in Compact width, Regular height mode.
// If the orientation changes to Compact-Compact, same 2 subviews should be aligned horizontally.
// You can use iPhone 16 simulator for testing.
final class Task4ViewController: UIViewController {
    
    private var stackView = UIStackView()
    private var square1 = UIView()
    private var square2 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        registerForTraitChanges()
        updateLayout()
    }
    
    private func setupViews() {
        square1.backgroundColor = .systemOrange
        square2.backgroundColor = .systemGreen
        
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(square1)
        stackView.addArrangedSubview(square2)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            square1.widthAnchor.constraint(equalToConstant: 100),
            square1.heightAnchor.constraint(equalToConstant: 100),
            square2.widthAnchor.constraint(equalToConstant: 100),
            square2.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func registerForTraitChanges() {
        let sizeTraits: [UITrait] = [UITraitVerticalSizeClass.self, UITraitHorizontalSizeClass.self]
        registerForTraitChanges(sizeTraits) { (self: Self, previousTraitCollection: UITraitCollection) in
            self.updateLayout()
        }
    }
    
    private func updateLayout() {
        let horizontalClass = traitCollection.horizontalSizeClass
        let verticalClass = traitCollection.verticalSizeClass
        
        let newAxis: NSLayoutConstraint.Axis
        
        switch (horizontalClass, verticalClass) {
        case (.compact, .regular):
            newAxis = .vertical
        case (.regular, .compact), (.compact, .compact):
            newAxis = .horizontal
        default:
            newAxis = view.bounds.width > view.bounds.height ? .horizontal : .vertical
        }
        
        if stackView.axis != newAxis {
            stackView.axis = newAxis
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
}

#Preview {
    Task4ViewController()
}
