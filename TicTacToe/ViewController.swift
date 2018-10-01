//
//  ViewController.swift
//  TicTacToe
//
//  Created by Tarek Moubarak on 10/1/18.
//  Copyright © 2018 Tarek Moubarak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playBtnLabel: UIButton!
    
    var activeGame = true
    var player = 0;
    var gameState = [0,0,0,0,0,0,0,0,0] // 0 - empty, 1 - noughts, 2 - crosses
    let winningCompinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winnerLabel.isHidden = true
        playBtnLabel.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - winnerLabel.frame.width, y: winnerLabel.center.y)
        playBtnLabel.center = CGPoint(x: playBtnLabel.center.x - playBtnLabel.frame.width, y: playBtnLabel.center.y)
    }

    @IBAction func noughtPressed(_ sender: AnyObject) {
        let activePosition = sender.tag - 1
        if gameState[activePosition] == 0  && activeGame == true{
            if player == 0{
                gameState[activePosition] = 1
                sender.setImage(UIImage(named: "nought.png"), for: [])
                player = 1
            } else{
                gameState[activePosition] = 2
                sender.setImage(UIImage(named: "cross.png"), for: [])
                player = 0
            }
            for combination in winningCompinations {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                    activeGame = false
                    winnerLabel.isHidden = false
                    playBtnLabel.isHidden = false
                    if gameState[combination[0]] == 1{
                        winnerLabel.text = "Noughts have won!"
                    } else{
                        winnerLabel.text = "Crosses have won!"
                    }
                    UIView.animate(withDuration: 1, animations: {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + self.winnerLabel.frame.width, y: self.winnerLabel.center.y)
                        self.playBtnLabel.center = CGPoint(x: self.playBtnLabel.center.x + self.playBtnLabel.frame.width, y: self.playBtnLabel.center.y)
                    })
                }
            }
        }
    }
    
    @IBAction func playAgainBtn(_ sender: AnyObject) {
        gameState = [0,0,0,0,0,0,0,0,0]
        player = 0
        winnerLabel.isHidden = true
        playBtnLabel.isHidden = true
        activeGame = true
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
        }
    }
}

