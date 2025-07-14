//
//  ViewController.swift
//  Color Mixing
//
//  Created by Никита Грицунов on 05.07.2025.
//

import UIKit



class ViewController: UIViewController, UIColorPickerViewControllerDelegate {
    
    var colorPicker: UIColorPickerViewController!
    var activeButtonTag: Int?
    
    lazy var mixColorButtonOne: UIButton = {
        let mixColorButtonOne = UIButton(type: .system)
        mixColorButtonOne.backgroundColor = .white
        mixColorButtonOne.layer.cornerRadius = 10
        mixColorButtonOne.layer.borderWidth = 1
        mixColorButtonOne.layer.borderColor = CGColor(gray: 0.7, alpha: 1)
        mixColorButtonOne.tag = 0
        mixColorButtonOne.translatesAutoresizingMaskIntoConstraints = false
        mixColorButtonOne.addTarget(self, action: #selector(presentColorPicker), for: .touchUpInside)
        return mixColorButtonOne
    }()
    
    lazy var mixColorButtonTwo: UIButton = {
        let mixColorButtonTwo = UIButton(type: .system)
        mixColorButtonTwo.backgroundColor = .white
        mixColorButtonTwo.layer.cornerRadius = 10
        mixColorButtonTwo.layer.borderWidth = 1
        mixColorButtonTwo.layer.borderColor = CGColor(gray: 0.7, alpha: 1)
        mixColorButtonTwo.tag = 1
        mixColorButtonTwo.translatesAutoresizingMaskIntoConstraints = false
        mixColorButtonTwo.addTarget(self, action: #selector(presentColorPicker), for: .touchUpInside)
        return mixColorButtonTwo
    }()
    
    let resultColorImage: UIImageView = {
        let resultColorImage = UIImageView()
        resultColorImage.backgroundColor = .white
        resultColorImage.layer.cornerRadius = 10
        resultColorImage.layer.borderWidth = 1
        resultColorImage.layer.borderColor = CGColor(gray: 0.7, alpha: 1)
        resultColorImage.translatesAutoresizingMaskIntoConstraints = false
        return resultColorImage
    }()
    
    let mixColorLabelOne: UILabel = {
        let mixColorLabelOne = UILabel()
        mixColorLabelOne.text = "select color"
        mixColorLabelOne.font = .systemFont(ofSize: 30)
        mixColorLabelOne.textColor = .darkGray
        mixColorLabelOne.translatesAutoresizingMaskIntoConstraints = false
        return mixColorLabelOne
    }()
    
    let mixColorLabelTwo: UILabel = {
        let mixColorLabelTwo = UILabel()
        mixColorLabelTwo.text = "select color"
        mixColorLabelTwo.font = .systemFont(ofSize: 30)
        mixColorLabelTwo.textColor = .darkGray
        mixColorLabelTwo.translatesAutoresizingMaskIntoConstraints = false
        return mixColorLabelTwo
    }()
    
    let resultColorLabelTwo: UILabel = {
        let resultColorLabelTwo = UILabel()
        resultColorLabelTwo.text = "white"
        resultColorLabelTwo.font = .systemFont(ofSize: 30)
        resultColorLabelTwo.textColor = .darkGray
        resultColorLabelTwo.translatesAutoresizingMaskIntoConstraints = false
        return resultColorLabelTwo
    }()
    
    let plusLabel: UILabel = {
        let plusLabel = UILabel()
        plusLabel.text = "+"
        plusLabel.font = .systemFont(ofSize: 40)
        plusLabel.translatesAutoresizingMaskIntoConstraints = false
        plusLabel.textColor = .gray
        return plusLabel
    }()
    
    let equalLabel: UILabel = {
        let equalLabel = UILabel()
        equalLabel.text = "="
        equalLabel.font = .systemFont(ofSize: 40)
        equalLabel.textColor = .gray
        equalLabel.translatesAutoresizingMaskIntoConstraints = false
        return equalLabel
    }()
    
    let buttonBaseOne: UIImageView = {
        let buttonBaseOne = UIImageView(image: .buttonCover)
        buttonBaseOne.translatesAutoresizingMaskIntoConstraints = false
        return buttonBaseOne
    }()
    
    let buttonBaseTwo: UIImageView = {
        let buttonBaseTwo = UIImageView(image: .buttonCover)
        buttonBaseTwo.translatesAutoresizingMaskIntoConstraints = false
        return buttonBaseTwo
    }()
    
    let buttonBaseThree: UIImageView = {
        let buttonBaseThree = UIImageView(image: .buttonCover)
        buttonBaseThree.translatesAutoresizingMaskIntoConstraints = false
        return buttonBaseThree
    }()
    
    let languageSwitcher: UISegmentedControl = {
        let control = UISegmentedControl(items: ["ENG", "RU"])
        control.selectedSegmentIndex = 0
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray2
        
        view.addSubview(mixColorLabelOne)
        
        mixColorLabelOne.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mixColorLabelOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        
        view.addSubview(mixColorButtonOne)
        
        mixColorButtonOne.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mixColorButtonOne.topAnchor.constraint(equalTo: mixColorLabelOne.bottomAnchor, constant: 20).isActive = true
        mixColorButtonOne.heightAnchor.constraint(equalToConstant: 80).isActive = true
        mixColorButtonOne.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        view.addSubview(buttonBaseOne)
        
        buttonBaseOne.centerXAnchor.constraint(equalTo: mixColorButtonOne.centerXAnchor).isActive = true
        buttonBaseOne.centerYAnchor.constraint(equalTo: mixColorButtonOne.centerYAnchor).isActive = true
        buttonBaseOne.heightAnchor.constraint(equalToConstant: 105).isActive = true
        buttonBaseOne.widthAnchor.constraint(equalToConstant: 105).isActive = true
        
        view.addSubview(plusLabel)
        
        plusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        plusLabel.topAnchor.constraint(equalTo: mixColorButtonOne.bottomAnchor, constant: 30).isActive = true
        
        view.addSubview(mixColorLabelTwo)

        mixColorLabelTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mixColorLabelTwo.topAnchor.constraint(equalTo: plusLabel.bottomAnchor, constant: 30).isActive = true
        
        view.addSubview(mixColorButtonTwo)
        
        mixColorButtonTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mixColorButtonTwo.topAnchor.constraint(equalTo: mixColorLabelTwo.bottomAnchor, constant: 20).isActive = true
        mixColorButtonTwo.heightAnchor.constraint(equalToConstant: 80).isActive = true
        mixColorButtonTwo.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        view.addSubview(buttonBaseTwo)
        
        buttonBaseTwo.centerXAnchor.constraint(equalTo: mixColorButtonTwo.centerXAnchor).isActive = true
        buttonBaseTwo.centerYAnchor.constraint(equalTo: mixColorButtonTwo.centerYAnchor).isActive = true
        buttonBaseTwo.heightAnchor.constraint(equalToConstant: 105).isActive = true
        buttonBaseTwo.widthAnchor.constraint(equalToConstant: 105).isActive = true
        
        view.addSubview(equalLabel)
        
        equalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        equalLabel.topAnchor.constraint(equalTo: mixColorButtonTwo.bottomAnchor, constant: 30).isActive = true
        
        view.addSubview(resultColorLabelTwo)

        resultColorLabelTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultColorLabelTwo.topAnchor.constraint(equalTo: equalLabel.bottomAnchor, constant: 30).isActive = true
        
        view.addSubview(resultColorImage)
        
        resultColorImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultColorImage.topAnchor.constraint(equalTo: resultColorLabelTwo.bottomAnchor, constant: 20).isActive = true
        resultColorImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        resultColorImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        view.addSubview(buttonBaseThree)
        
        buttonBaseThree.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonBaseThree.centerYAnchor.constraint(equalTo: resultColorImage.centerYAnchor).isActive = true
        buttonBaseThree.heightAnchor.constraint(equalToConstant: 105).isActive = true
        buttonBaseThree.widthAnchor.constraint(equalToConstant: 105).isActive = true
        
        view.addSubview(languageSwitcher)
        
        languageSwitcher.topAnchor.constraint(equalTo: buttonBaseThree.bottomAnchor, constant: 10).isActive = true
        languageSwitcher.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    
     }
    
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {

        if activeButtonTag == 0 {
            mixColorButtonOne.backgroundColor = color
            mixColorLabelOne.text = color.accessibilityName.lowercased()
        } else {
            mixColorButtonTwo.backgroundColor = color
            mixColorLabelTwo.text = color.accessibilityName
        }
        
        
        let resultColor = UIColor().mixed(color1: mixColorButtonOne.backgroundColor!, color2: mixColorButtonTwo.backgroundColor!)
        resultColorImage.backgroundColor = resultColor
        resultColorLabelTwo.text = resultColor.accessibilityName
        
//
    }
    
    
    @objc func presentColorPicker(_ sender: UIButton) {
        let feedBackGenerator = UIImpactFeedbackGenerator(style: .rigid)
        activeButtonTag = sender.tag
        sender.pulsate()
        buttonBaseOne.pulsate()
        feedBackGenerator.impactOccurred()
        
        self.colorPicker = UIColorPickerViewController()
        colorPicker.title = "MIX Color"
        colorPicker.supportsAlpha = false
        colorPicker.delegate = self
        
        colorPicker.modalPresentationStyle = .popover
        colorPicker.popoverPresentationController?.sourceItem = self.navigationItem.rightBarButtonItem
        self.present(colorPicker, animated: true)
    }
}



// MARK: Extension UIButton and UIImageVeiw
extension UIButton {
    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.1
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 1
        layer.add(flash, forKey: nil)
    }
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.2
        pulse.fromValue = 0.98
        pulse.toValue = 1
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 1
        layer.add(pulse, forKey: nil)
    }
}

extension UIImageView {
    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.1
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 1
        layer.add(flash, forKey: nil)
    }
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.2
        pulse.fromValue = 0.98
        pulse.toValue = 1
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 1
        layer.add(pulse, forKey: nil)
    }
}

// MARK: UI Color extension

extension UIColor {
    func mixed(color1: UIColor, color2: UIColor) -> UIColor {
        let ratio = 0.5
        var (r1, g1, b1, a1): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        var (r2, g2, b2, a2): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)

        color1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        color2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)

        return UIColor(red: r1 * (1 - ratio) + r2 * ratio,
                       green: g1 * (1 - ratio) + g2 * ratio,
                       blue: b1 * (1 - ratio) + b2 * ratio,
                       alpha: a1 * (1 - ratio) + a2 * ratio)
    }
}
