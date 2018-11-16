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

    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var songImage: UIImageView!
    
    
    @IBAction func fourTImesSpeed(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer.prepareToPlay()
        audioPlayer.enableRate = true
        audioPlayer.rate = 4.0
        audioPlayer.play()
        
    }
    @IBAction func twoTimesSpeed(_ sender: Any) {
        audioPlayer.stop()        audioPlayer.prepareToPlay()
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
        }
        catch
        {
            print ("ERROR")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

