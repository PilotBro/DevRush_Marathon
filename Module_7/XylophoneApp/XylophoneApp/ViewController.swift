//
//  ViewController.swift
//  XylophoneApp
//
//  Created by Никита Грицунов on 09.07.2025.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    private var nameButtons = ["C", "D", "E", "F", "G", "A", "B"]
    private var buttonStackView = UIStackView()
    private var player: AVPlayer?
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
        createButtons()
        
    }
    
    private func createButtons() {
        for (index, nameButton) in nameButtons.enumerated() {
            let multiplierWidth = 0.97 - (0.03 * Double(index))
            createButton(name: nameButton, width: multiplierWidth)
            
        }
    }
    
    private func createButton(name: String, width: Double) {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(name, for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 45)
        button.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        
        buttonStackView.addArrangedSubview(button)
        
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.widthAnchor.constraint(equalTo: view .widthAnchor, multiplier: width).isActive = true
        button.backgroundColor = getColor(for: name)
    }
    
    private func getColor(for name: String) -> UIColor {
        switch name {
        case "A": return .systemRed
        case "C": return .systemOrange
        case "B": return .systemYellow
        case "F": return .systemGreen
        case "G": return .systemIndigo
        case "E": return .systemBlue
        case "D": return .systemPurple
        default: return .white
        }
    }
    
    @objc private func buttonsTapped(_ sender: UIButton) {
        toggleButtonAlpha(sender)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2)  {
            self.toggleButtonAlpha(sender)

        }
        guard let buttonText = sender.currentTitle else { return }
        playSound(buttonText)
    }
    
    private func toggleButtonAlpha(_ button: UIButton ) {
        button.alpha = button.alpha == 1 ? 0.5 : 1
     }
    
    func playSound(_ buttonText: String) {
        guard let url = Bundle.main.url(forResource: buttonText, withExtension: "wav") else {return}
        player = try? AVPlayer(url: url)
        player?.play()
                
    }

}

extension ViewController {
    
    private func setViews() {
        view.backgroundColor = .white
        view.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .vertical
        buttonStackView.alignment = .center
        buttonStackView.spacing = 10
        buttonStackView.distribution = .fillEqually
        
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
