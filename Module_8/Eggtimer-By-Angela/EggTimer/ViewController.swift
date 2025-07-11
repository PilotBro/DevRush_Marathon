//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var label: UILabel!
    
    var player: AVAudioPlayer!
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        progressBar.progress = 0.0
        secondsPassed = 0
        timer.invalidate()
        label.text = "Cooking..."
        
        totalTime = eggTimes[sender.currentTitle!]!
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        
    }
    
    @objc func countdown() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let persentageProgress = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = persentageProgress
            print(persentageProgress)
        } else {
            label.text = "DONE!"
            timer.invalidate()
            playAlarm()
        }
    }
    
    func playAlarm() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        var player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
