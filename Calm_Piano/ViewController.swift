//
//  ViewController.swift
//  Calm_Piano
//
//  Created by Kevin Abram on 15/05/19.
//  Copyright © 2019 Kevin Abram. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIGestureRecognizerDelegate, AVAudioPlayerDelegate{
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet var tapInteraction: UITapGestureRecognizer!
    
    var noteButton: UIButton? // Just for testing purpose
    
    var backgroundPlayer: AVAudioPlayer?
    
    var treeRustlePlayer: AVAudioPlayer?
    
    var backgroundMusicPlayer: AVAudioPlayer?
    
    var treeRustleArray = [AVAudioPlayer]()
    
    var increment: Int = 0
    
    let cell = CAEmitterCell()
    
    let particleEmitter = CAEmitterLayer()
    
    @IBOutlet weak var instrumentSlider: UISlider!
    
    @IBOutlet weak var ambienceSlider: UISlider!
    
    @IBOutlet weak var pianoImageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        leafFallParticles()
        ambienceSlider.value = 25
        playSound()
        
//        let treeRustlePlayer1 = AVAudioPlayer()
//        let treeRustlePlayer2 = AVAudioPlayer()
//        let treeRustlePlayer3 = AVAudioPlayer()
//        let treeRustlePlayer4 = AVAudioPlayer()
//        let treeRustlePlayer5 = AVAudioPlayer()
        
       // treeRustleArray = [treeRustlePlayer1, treeRustlePlayer2, treeRustlePlayer3, treeRustlePlayer4, treeRustlePlayer5]
        
     //   createNoteParticle(Xposition: 100, tag: 1, delay: 10)
        
        createNoteParticles()
        
    }
    
    @IBAction func longPressAction(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began
        {
            playTreeRustleSingle()
            //particleEmitter.setValue(0, forKey: "emitterCells.leaf.birthRate")
           // particleEmitter.emitterCells![0].velocity += 1000
            
          //  print(particleEmitter.emitterCells![0].velocity)
            
           // particleEmitter.setValue(0, forKeyPath: "emitterCells.leaf.birthRate")
            
          //  print(particleEmitter.velocity)
            
         //   particleEmitter.velocity = particleEmitter.velocity + 1
        }
        else if sender.state == .ended
        {
            treeRustlePlayer?.stop()
        }
    }

    
    func leafFallParticles() {
        particleEmitter.emitterPosition = CGPoint(x: view.frame.width / 2.0, y: -50)
        particleEmitter.emitterShape = .line
        particleEmitter.emitterSize = CGSize(width: view.frame.width, height: 1)
        particleEmitter.renderMode = .additive
        
        cell.name = "leaf"
        cell.birthRate = 3
        cell.lifetime = 10
        cell.velocity = 100
        cell.velocityRange = 50
        cell.emissionLongitude = .pi
        cell.spinRange = 5
        cell.scale = 0.5
        cell.scaleRange = 0.25
        cell.color = UIColor.init(white: 1, alpha: 1).cgColor
        cell.alphaSpeed = -0.025
        cell.contents = UIImage(named: "Leaf")?.cgImage
        
        particleEmitter.emitterCells = [cell]
        
      //  self.view.layer.addSublayer(particleEmitter)
       // self.view.sendSubviewToBack(self.view!.layer)
    }
    
    func leafTouchParticles()
    {
        let particleEmitter = CAEmitterLayer()
        
        particleEmitter.emitterPosition = CGPoint(x: 189, y: 396)
        particleEmitter.emitterShape = .line
        particleEmitter.emitterSize = CGSize(width: view.frame.width, height: 1)
        particleEmitter.renderMode = .additive
        
        cell.birthRate = 3
        cell.lifetime = 10
        cell.velocity = 100
    }
    
    func playSound()
    {
        let url = Bundle.main.url(forResource: "Ambience", withExtension: "mp3")!
        
        do {
            backgroundPlayer = try AVAudioPlayer(contentsOf: url)
            guard let player = backgroundPlayer else { return }
            
            player.prepareToPlay()
            player.delegate = self
            player.numberOfLoops = -1
            player.volume = ambienceSlider.value/200
            player.play()
            
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    func playTreeRustleSingle()
    {
        if treeRustlePlayer?.isPlaying == true
        {
            
        }
        else
        {
        let url = Bundle.main.url(forResource: "TreeRustle", withExtension: "mp3")!
        
        do {
            treeRustlePlayer = try AVAudioPlayer(contentsOf: url)
            guard let player = treeRustlePlayer else { return }
            
            player.prepareToPlay()
            player.delegate = self
            player.numberOfLoops = -1
            player.play()
            
        } catch let error as NSError {
            print(error.description)
            }
            
        }
    }
    
    func createNoteParticle(Xposition: Int, tag: Int, delay: Int)
    {
        noteButton = UIButton(type: .system)
        noteButton!.setImage(UIImage(named: "Circle"), for: .normal)
        noteButton!.frame.size = CGSize.init(width: 75, height: 75)
        noteButton!.center = CGPoint(x: Xposition, y: 50)
        noteButton!.tintColor = UIColor.green
        noteButton!.restorationIdentifier = "1"
        noteButton!.alpha = 1
        noteButton!.isUserInteractionEnabled = true

        self.backgroundView.addSubview(noteButton!)

        UIView.animate(withDuration: 20, delay: 0, options: [.curveLinear, .allowUserInteraction] ,animations:
            {
                self.noteButton!.alpha = 1
                self.noteButton!.center = CGPoint(x: Xposition, y: 1000)
        })
    }
    
    func createNoteParticles()
    {
        var incrementNote = 0
        for note in noteArray
        {
            let newButton = buttonArray[incrementNote]
            newButton.setImage(UIImage(named: "Circle"), for: .normal)
            newButton.frame.size = CGSize.init(width: 75, height: 75)
            newButton.tintColor = UIColor.green
            newButton.restorationIdentifier = "1"
            newButton.alpha = 1
            newButton.isUserInteractionEnabled = true
            newButton.center = CGPoint(x: note.Xposition!, y: -100)
            self.backgroundView.addSubview(newButton)
            
            UIView.animate(withDuration: 15, delay: note.secondStartPoint!, options: [.curveLinear, .allowUserInteraction] ,animations:
                {
                   // note.button?.alpha = 0
                   // note.button?.center = CGPoint(x: note.Xposition!, y: 1000)
                    newButton.center = CGPoint(x: note.Xposition!, y: 1000)
            })
            
            incrementNote += 1
        }
        
        print("Number of notes found: \(noteArray.count)")
    }
    
    func noteClickDismiss()
    {
        UIView.animate(withDuration: 2, delay: 0, options: [.curveLinear], animations:
        {
            self.noteButton?.frame.size.width += 25
            self.noteButton?.frame.size.height += 25
            self.noteButton?.alpha = 0
        })
        
        playNote(resource: "Melody1", playerNumber: 0)
    }
    
    func noteClickDismiss(arrayNumber: Int)
    {
        UIView.animate(withDuration: 2, delay: 0, options: [.curveLinear], animations:
            {
//                self..frame.size.width += 25
//                self.noteButton?.frame.size.height += 25
//                self.noteButton?.alpha = 0
                buttonArray[arrayNumber].frame.size.width += 25
                buttonArray[arrayNumber].frame.size.height += 25
                buttonArray[arrayNumber].alpha = 0
        })
        
        //playNote(resource: "Melody\(arrayNumber + 1)", playerNumber: arrayNumber)
        playNote(playerNumber: arrayNumber)
    }
    
    func playBackgroundMusic()
    {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 14, execute:
//            {
//                let url = Bundle.main.url(forResource: "BackgroundMelodyFull", withExtension: "mp3")!
//
//                do {
//                    self.backgroundMusicPlayer = try AVAudioPlayer(contentsOf: url)
//                    let player = self.backgroundMusicPlayer
//
//                    player!.prepareToPlay()
//                    player!.play()
//
//                } catch let error as NSError {
//                    print(error.description)
//                }
//            }
//            )
    }

    @IBAction func ambienceChange(_ sender: UISlider) {
        backgroundPlayer?.volume = ambienceSlider.value/200
    }
    
    @IBAction func tapInteraction(_ sender: UITapGestureRecognizer) {
        switch sender.view?.tag
     {

     case .none:
         break
    case .some(_):
//            let Xcoordinate = noteButton?.layer.presentation()?.frame.midX
//            let Ycoordinate = noteButton?.layer.presentation()?.frame.midY
//
//            let YcoordinateInt = Int(Ycoordinate!)
//
//            print("something is clicked")
//            print(sender.location(in: backgroundView))
//            print("Frame: \(noteButton?.layer.presentation()?.frame ?? CGRect(x: 0, y: 0, width: 0, height: 0))")
//            print("X location: \(Xcoordinate ?? CGFloat(0))")
//            print("Y location: \(Ycoordinate ?? CGFloat(0))")
//
//            switch YcoordinateInt
//            {
//            case 370...430:
//                noteClickDismiss()
//            default:
//                break
//            }
        
            var buttonArrayIncrement = 0
            
            for button in buttonArray
            {
                    let Ycoordinate = button.layer.presentation()?.frame.midY
                
                    let YcoordinateInt = Int(Ycoordinate!)
                
                        switch YcoordinateInt
                        {
                        case 370...430:
                            noteClickDismiss(arrayNumber: buttonArrayIncrement)
                        default:
                            break
                        }
                buttonArrayIncrement += 1
            }
     }
    }
}

//UIButton
//        self.setImage(UIImage(named: "Note"), for: .normal)
//        // self.tintColor = UIColor.init(red: 32/255, green: 199/255, blue: 0, alpha: 1)
//        self.setTitle("", for: .normal)
//        //   self.frame.size = CGSize(width: 50, height: 50)
//        self.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        //noteButton.frame = CGRect(x: Xposition, y: -50, width: 50, height: 50)

//unused code here

//    func createParticles() {
//        let particleEmitter = CAEmitterLayer()
//
//        //particleEmitter.emitterPosition = CGPoint(x: view.frame.width / 2.0, y: -50)
//        particleEmitter.emitterPosition = CGPoint(x: 186, y: 416)
//        particleEmitter.emitterShape = .line
//        //particleEmitter.emitterSize = CGSize(width: view.frame.width, height: 1)
//        particleEmitter.emitterSize = CGSize(width: 1, height: 1)
//        particleEmitter.renderMode = .additive
//       // particleEmitter.lifetime = 1
//
//        let cell = CAEmitterCell()
//        cell.birthRate = 10
//        cell.emissionRange = .pi * 2
//        cell.velocity = 100
//        cell.scale = 0.5
//        cell.scaleRange = 1
//        cell.color = UIColor.green.cgColor
//        cell.alphaSpeed = -0.025
//        cell.alphaRange = 0.5
//        cell.contents = UIImage(named: "Circle")?.cgImage
//        cell.lifetime = 10
//        //particleEmitter.emitterCells = [cell]
//        particleEmitter.emitterCells = [cell]
//    pianoImageView.layer.addSublayer(particleEmitter)
//
//    }
//
//    private func generateEmitterCells() -> [CAEmitterCell] {
//
//        var cells:[CAEmitterCell] = [CAEmitterCell]()
//        for _ in 0..<16 {
//            let cell = CAEmitterCell()
//            cell.birthRate = 4.0
//            //cell.lifetime = 1.0
//            cell.lifetimeRange = 0
//            cell.velocity = 100
//            cell.velocityRange = 0
//            cell.emissionLongitude = CGFloat(Double.pi)
//            cell.emissionRange = 0.5
//            cell.spin = 3.5
//            cell.spinRange = 0
//            cell.scaleRange = 0.25
//            cell.scale = 0.1
//           // cell.name = "cell\(index)" // cell name
//            cell.contents = UIImage(named: "Circle")?.cgImage
//            cells.append(cell)
//        }
//        return cells
//    }
//
//
//    func touchParticle()
//    {
//    let emitter = CAEmitterLayer()
//    emitter.emitterPosition = CGPoint(x: 100, y: 100)
//    emitter.emitterSize = CGSize(width: 50, height: 50)
//    emitter.renderMode = .additive
//    let cell = CAEmitterCell()
//    cell.color = UIColor.red.cgColor
//    cell.contents = UIImage(named: "Circle")?.cgImage
//    cell.emissionLongitude = (2 * .pi)
//    cell.birthRate = 45
//    cell.lifetime = 1.5
//    cell.velocity = 100
//    cell.scale = 0.3
//    cell.yAcceleration = 350
//    cell.emissionRange = .pi/7
//    cell.alphaSpeed = -0.7
//    cell.scaleSpeed = -0.1
//    cell.scaleRange = 0.1
//    cell.beginTime = 0.01
//    cell.duration = 5
//    emitter.emitterCells = [cell]
//
//    pianoImageView.layer.addSublayer(emitter)
//
//
//    }


//    func playTreeRustle()
//    {
//        var playerIncrement = 0
//
//        if playerIncrement == treeRustleArray.count - 1
//        {
//        }
//        else
//        {
//
//            let url = Bundle.main.url(forResource: "TreeRustle", withExtension: "mp3")!
//
//            do {
//                treeRustleArray[playerIncrement] = try AVAudioPlayer(contentsOf: url)
//                let player = treeRustleArray[playerIncrement]
//
//                player.prepareToPlay()
//                player.delegate = self
//                player.numberOfLoops = 0
//                player.play()
//
//            } catch let error as NSError {
//                print(error.description)
//            }
//        }
//    }

//    func createNoteParticle(tag: Int, delay: Double)
//    {
//        let duration: Double = 5
//
//        let noteButton = UIButton(type: .custom)
//        noteButton.setImage(UIImage(named: "Circle"), for: .normal)
//        let randomX = Int.random(in: 0...314)
//        let randomY = Int.random(in: 0...796)
//        noteButton.frame = CGRect(x: randomX, y: randomY, width: 100, height: 100)
//
//        self.view.addSubview(noteButton)
//
//        noteButton.alpha = 0
//
////        UIView.animate(withDuration: duration, delay: delay, animations:
////            {
////                print("This animation runs")
////               noteButton.alpha = 1
////            })
//
//        UIView.animate(withDuration: duration, delay: delay + duration, animations:
//            {
//                noteButton.alpha = 1
//                print("The delay plus duration is \(delay + duration)")
//        })
//    }

//    @objc func handleTap(_ sender: UITapGestureRecognizer) {
//        print("Hello World")
//    }
//
//    @objc func buttonAction(sender: UIButton!) {
//        print("Button tapped")
//    }
