//
//  NoteParticlesConfiguration.swift
//  Calm_Piano
//
//  Created by Kevin Abram on 23/05/19.
//  Copyright © 2019 Kevin Abram. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

//This class handles the note
class note
{
    var name: String?
    var secondStartPoint: Double?
    var Xposition: Int?
    var button: UIButton?
//    var player: AVAudioPlayer?
    
    init(name: String, secondStartPoint: Double, Xposition: Int, button: UIButton)
    {
        self.name = name
        self.secondStartPoint = secondStartPoint
        self.Xposition = Xposition
        self.button = button
     //   self.player = player
    }
}

var notePlayer: AVAudioPlayer?

var noteArray = [note]()

var buttonArray = [UIButton]()

var playerArray = [AVAudioPlayer]()

func playNote(resource: String, playerNumber: Int)
{
    let url = Bundle.main.url(forResource: resource, withExtension: "mp3")!

    do {
        playerArray[playerNumber] = try AVAudioPlayer(contentsOf: url)
        let player = playerArray[playerNumber]

        player.prepareToPlay()
        player.play()

    } catch let error as NSError {
        print(error.description)
    }
}

func playNote(playerNumber: Int)
{
    playerArray[playerNumber].play()
}

func prepareNote(resource: String, playerNumber: Int)
{
    let url = Bundle.main.url(forResource: resource, withExtension: "mp3")!
    
    do
    {
    playerArray[playerNumber] = try AVAudioPlayer(contentsOf: url)
    playerArray[playerNumber].prepareToPlay()
    
    }
    catch let error as NSError {
        print(error.description)
    }
}

func initializeNotes()
{
    let newButton = UIButton(type: .system)
    newButton.setImage(UIImage(named: "Circle"), for: .normal)
    newButton.frame.size = CGSize.init(width: 75, height: 75)
    newButton.tintColor = UIColor.green
    newButton.restorationIdentifier = "1"
    newButton.alpha = 1
    newButton.isUserInteractionEnabled = true
    
    let melody1 = note(name: "melody1", secondStartPoint: 0, Xposition: 100, button: newButton)
    let melody2 = note(name: "melody2", secondStartPoint: 4, Xposition: 200, button: newButton)
    let melody3 = note(name: "melody3", secondStartPoint: 9, Xposition: 250, button: newButton)
    let melody4 = note(name: "melody4", secondStartPoint: 14, Xposition: 300, button: newButton)
    let melody5 = note(name: "melody5", secondStartPoint: 18, Xposition: 200, button: newButton)
    let melody6 = note(name: "melody6", secondStartPoint: 23, Xposition: 300, button: newButton)
    let melody7 = note(name: "melody7", secondStartPoint: 27, Xposition: 100, button: newButton)
    let melody8 = note(name: "melody8", secondStartPoint: 31, Xposition: 300, button: newButton)
    let melody9 = note(name: "melody9", secondStartPoint: 36, Xposition: 200, button: newButton)
    let melody10 = note(name: "melody10", secondStartPoint: 45, Xposition: 150, button: newButton)
    let melody11 = note(name: "melody11", secondStartPoint: 54, Xposition: 300, button: newButton)
    let melody12 = note(name: "melody12", secondStartPoint: 63, Xposition: 200, button: newButton)
    let melody13 = note(name: "melody13", secondStartPoint: 72, Xposition: 100, button: newButton)
    
    noteArray.append(melody1)
    noteArray.append(melody2)
    noteArray.append(melody3)
    noteArray.append(melody4)
    noteArray.append(melody5)
    noteArray.append(melody6)
    noteArray.append(melody7)
    noteArray.append(melody8)
    noteArray.append(melody9)
    noteArray.append(melody10)
    noteArray.append(melody11)
    noteArray.append(melody12)
    noteArray.append(melody13)
    
    let button1 = UIButton(type: .system)
    let button2 = UIButton(type: .system)
    let button3 = UIButton(type: .system)
    let button4 = UIButton(type: .system)
    let button5 = UIButton(type: .system)
    let button6 = UIButton(type: .system)
    let button7 = UIButton(type: .system)
    let button8 = UIButton(type: .system)
    let button9 = UIButton(type: .system)
    let button10 = UIButton(type: .system)
    let button11 = UIButton(type: .system)
    let button12 = UIButton(type: .system)
    let button13 = UIButton(type: .system)
    
    buttonArray.append(button1)
    buttonArray.append(button2)
    buttonArray.append(button3)
    buttonArray.append(button4)
    buttonArray.append(button5)
    buttonArray.append(button6)
    buttonArray.append(button7)
    buttonArray.append(button8)
    buttonArray.append(button9)
    buttonArray.append(button10)
    buttonArray.append(button11)
    buttonArray.append(button12)
    buttonArray.append(button13)
    
    let player1 = AVAudioPlayer()
    let player2 = AVAudioPlayer()
    let player3 = AVAudioPlayer()
    let player4 = AVAudioPlayer()
    let player5 = AVAudioPlayer()
    let player6 = AVAudioPlayer()
    let player7 = AVAudioPlayer()
    let player8 = AVAudioPlayer()
    let player9 = AVAudioPlayer()
    let player10 = AVAudioPlayer()
    let player11 = AVAudioPlayer()
    let player12 = AVAudioPlayer()
    let player13 = AVAudioPlayer()
    
    playerArray.append(player1)
    playerArray.append(player2)
    playerArray.append(player3)
    playerArray.append(player4)
    playerArray.append(player5)
    playerArray.append(player6)
    playerArray.append(player7)
    playerArray.append(player8)
    playerArray.append(player9)
    playerArray.append(player10)
    playerArray.append(player11)
    playerArray.append(player12)
    playerArray.append(player13)
    
    prepareNote(resource: "Melody1", playerNumber: 0)
    prepareNote(resource: "Melody2", playerNumber: 1)
    prepareNote(resource: "Melody3", playerNumber: 2)
    prepareNote(resource: "Melody4", playerNumber: 3)
    prepareNote(resource: "Melody5", playerNumber: 4)
    prepareNote(resource: "Melody6", playerNumber: 5)
    prepareNote(resource: "Melody7", playerNumber: 6)
    prepareNote(resource: "Melody8", playerNumber: 7)
    prepareNote(resource: "Melody9", playerNumber: 8)
    prepareNote(resource: "Melody10", playerNumber: 9)
    prepareNote(resource: "Melody11", playerNumber: 10)
    prepareNote(resource: "Melody12", playerNumber: 11)
    prepareNote(resource: "Melody13", playerNumber: 12)
}



