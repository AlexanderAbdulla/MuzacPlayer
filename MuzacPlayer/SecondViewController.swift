//
//  SecondViewController.swift
//  MuzacPlayer
//
//  Created by Alex Abdulla on 2018-11-16.
//  Copyright © 2018 Alex Abdulla. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    var timer = Timer();
    
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var timeRemaining: UILabel!
    @IBOutlet weak var timePlayed: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
 
    
    @IBAction func fourTImesSpeed(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer.prepareToPlay()
        audioPlayer.enableRate = true
        audioPlayer.rate = 4.0
        audioPlayer.play()
        
    }
    @IBAction func twoTimesSpeed(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer.prepareToPlay()
        audioPlayer.enableRate = true
        audioPlayer.rate = 2.0
        audioPlayer.play()
        
    }
    
    @IBAction func halfSpeed(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer.prepareToPlay()
        audioPlayer.enableRate = true
        audioPlayer.rate = 0.5
        audioPlayer.play()
        
    }
    
    @IBAction func fullSPeed(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer.prepareToPlay()
        audioPlayer.enableRate = true
        audioPlayer.rate = 1.0
        audioPlayer.play()
        
    }
    
    @IBAction func playSong(_ sender: Any) {
        if audioStuffed == true && audioPlayer.isPlaying == false
        {
            audioPlayer.play()
        }
        
    }
    
    @IBAction func pauseSong(_ sender: Any) {
        if audioStuffed == true && audioPlayer.isPlaying
        {
            audioPlayer.pause()
        }
        
    }
    
    @IBAction func prevSong(_ sender: Any) {
        if thisSong != 0 && audioStuffed == true
        {
            playThis(thisOne: songs[thisSong-1])
            thisSong -= 1
            songLabel.text = songs[thisSong]
        }
        else
        {
            
        }
        
    }
    
    @IBAction func nextSong(_ sender: Any) {
        if thisSong < songs.count-1 && audioStuffed == true
        {
            playThis(thisOne: songs[thisSong+1])
            thisSong += 1
           songLabel.text = songs[thisSong]
        }
        else
        {
            
        }
        
    }
    
    func playThis(thisOne:String)
    {
        do
        {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
           // updateTimes()
        }
        catch
        {
            print ("ERROR")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduledTimerWithTimeInterval()
        
    }

    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounting(){
        let r = Double(round(100 * (audioPlayer.duration - audioPlayer.currentTime))/100)
        let t = Double(round(100 * (audioPlayer.currentTime ))/100)
        timeRemaining.text = "Time Left: " + String(r) + "s"
        timePlayed.text = "Time Played: " + String(t) + "s"
        let p = Double(round(100 * (audioPlayer.currentTime / audioPlayer.duration))/100)
        progressBar.setProgress(Float(p), animated: true)
    }
    
}

