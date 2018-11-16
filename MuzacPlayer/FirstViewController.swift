//
//  FirstViewController.swift
//  MuzacPlayer
//
//  Created by Alex Abdulla on 2018-11-16.
//  Copyright © 2018 Alex Abdulla. All rights reserved.
//

import UIKit
import AVFoundation

var songs : [String] = []
var audioPlayer = AVAudioPlayer()
var audioStuffed = false
var thisSong = 0

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = songs[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        do
        {
            let audioPath = Bundle.main.path(forResource: songs[indexPath.row], ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            
            let string = songs[thisSong]
            let utterance = AVSpeechUtterance(string: string)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            let synth = AVSpeechSynthesizer()
            synth.speak(utterance)
            
            audioPlayer.play()
            thisSong = indexPath.row
            audioStuffed = true
        }
        catch
        {
            print ("ERROR")
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        gettingSongNames()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //FUNCTION THAT GETS THE NAME OF THE SONGS
    func gettingSongNames()
    {
        print("in song fx")
        let folderURL = URL(fileURLWithPath:Bundle.main.resourcePath!)
        
        do
        {
            let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            //loop through the found urls
            for song in songPath
            {
                var mySong = song.absoluteString
                print(mySong)
                
                if mySong.contains(".mp3")
                {
                    let findString = mySong.components(separatedBy: "/")
                    mySong = findString[findString.count-1]
                    mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                    mySong = mySong.replacingOccurrences(of: ".mp3", with: "")
                    songs.append(mySong)
                }
                
            }
            
            myTableView.reloadData()
        }
        catch
        {
            print ("ERROR")
        }
    }
}

