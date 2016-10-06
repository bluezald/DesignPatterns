//
//  AdapterPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 06/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 
 Intent:
 Convert the interface of a class into another interface clients expect. 
 Adapter lets classes work together that couldn't otherwise because 
 of incompatible interfaces.
 
 Wrap an existing class with a new interface.
 
 Impedance match an old component to a new system
 
 */

class AdapterPattern: NSObject {

}

// Create an interface that your legacy code will implement
protocol MediaPlayer {
    func play(audioType: String, fileName: String)
}

protocol AdvancedMediaPlayer {
    func playVLC(fileName: String)
    func playMp4(fileName: String)
}

class VLCPlayer: AdvancedMediaPlayer {
    func playVLC(fileName: String) {
        print("Playing VLC File. Name: \(fileName)")
    }
    
    func playMp4(fileName: String) {
        
    }
}

class Mp4Player: AdvancedMediaPlayer {
    func playVLC(fileName: String) {
        // do nothing
    }
    
    func playMp4(fileName: String) {
        print("Playing mp4 File. Name: \(fileName)")
    }
}


// MARK: The Adapter

class MediaAdapter: MediaPlayer {
    
    var advancedMusicPlayer: AdvancedMediaPlayer?
    
    init(audioType: String) {
        if audioType.lowercased() == "vlc" {
            advancedMusicPlayer = VLCPlayer()
        } else if audioType.lowercased() == "mp4" {
            advancedMusicPlayer = Mp4Player()
        }
    }
    
    func play(audioType: String, fileName: String) {
        if audioType.lowercased() == "vlc" {
            advancedMusicPlayer?.playVLC(fileName: fileName)
        } else if audioType.lowercased() == "mp4" {
            advancedMusicPlayer?.playMp4(fileName: fileName)
        }
    }
    
}

class AudioPlayer: MediaPlayer {
    var adapter: MediaAdapter?
    
    func play(audioType: String, fileName: String) {
        
        if audioType.lowercased() == "mp3" {
            print("Playing mp3 File. Name: \(fileName)")
        } else if audioType.lowercased() == "vlc" || audioType.lowercased() == "mp4" {
            adapter = MediaAdapter(audioType: audioType)
            adapter?.play(audioType: audioType, fileName: fileName)
        } else {
            print("Invalid media \(audioType). Format not supported")
        }
        
    }
}



/**
 
 Examples:
 Converting Legacy Code to match with the new interface
 
 */
