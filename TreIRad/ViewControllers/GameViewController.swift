//
//  GameViewController.swift
//  TreIRad
//
//  Created by Kevin Zetterlind on 2021-12-05.
//

import UIKit

class GameViewController: UIViewController {
    
    let segueToScoreViewController = "segueToScoreViewController"
    
    var apple = "applelog"
    var android = "androidlog"
    var playerOne = "PlayerOne"
    var playerTwo = "PlayerTwo"
    
    var playerWon = "hej"
    
    
    @IBOutlet weak var iwOne: UIImageView!
    @IBOutlet weak var iwTwo: UIImageView!
    @IBOutlet weak var iwThree: UIImageView!
    @IBOutlet weak var iwFour: UIImageView!
    @IBOutlet weak var iwFive: UIImageView!
    @IBOutlet weak var iwSix: UIImageView!
    @IBOutlet weak var iwSeven: UIImageView!
    @IBOutlet weak var iwEigth: UIImageView!
    @IBOutlet weak var iwNine: UIImageView!
    @IBOutlet weak var currentPlayerLabel: UILabel!
    
    var arrayOfImages : [UIImageView] = []
    
    var playerOneScore : [Int] = [11]
    var playerTwoScore : [Int] = [22]
    
    let waysToWin : [[Int]] = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2,5,8], [3,6,9], [1,5,9], [3, 5, 7]]
    let waysToEven = [1, 1, 1, 1, 1, 1, 1, 1]
    var spotTaken : [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
        arrayOfImages  = [UIImageView](arrayLiteral: iwOne, iwTwo, iwThree, iwFour, iwFive, iwSix, iwSeven, iwEigth, iwNine)
        
        startingPlayer()
    }
    
    
    
    func startingPlayer() {
        currentPlayerLabel.text = playerOne
    }
 
    @IBAction func iwTapped(_ sender: UITapGestureRecognizer) {
        let tag = sender.view!.tag - 1
        if currentPlayerLabel.text == playerOne && spotTaken[tag] == 0 {
            arrayOfImages[tag].image = UIImage(named: apple)
            currentPlayerLabel.text = playerTwo
            spotTaken[tag] = 1
            playerOneScore.append(tag + 1)
            checkWin(sender: playerOneScore)
            checkEven(sender: waysToEven)
        } else if currentPlayerLabel.text == playerTwo && spotTaken[tag] == 0 {
            arrayOfImages[tag].image = UIImage(named: android)
            currentPlayerLabel.text = playerOne
            spotTaken[tag] = 1
            playerTwoScore.append(tag + 1)
            checkWin(sender: playerTwoScore)
            checkEven(sender: waysToEven)
        }
    }

    func checkWin(sender: Array<Int>) {
        if waysToWin[0].allSatisfy(sender.contains) ||
            waysToWin[1].allSatisfy(sender.contains) ||
            waysToWin[2].allSatisfy(sender.contains) ||
            waysToWin[3].allSatisfy(sender.contains) ||
            waysToWin[4].allSatisfy(sender.contains) ||
            waysToWin[5].allSatisfy(sender.contains) ||
            waysToWin[6].allSatisfy(sender.contains) ||
            waysToWin[7].allSatisfy(sender.contains) {
            if sender[0] == 11 {
                playerWon = "Player One Wins!"
                performSegue(withIdentifier: segueToScoreViewController, sender: self)
            } else if sender[0] == 22 {
                playerWon = "Player Two Wins!"
                performSegue(withIdentifier: segueToScoreViewController, sender: self)
            }
        }
    }
    
    func checkEven(sender: Array<Int>) {
        if spotTaken.allSatisfy(sender.contains) {
            playerWon = "Draw!"
            performSegue(withIdentifier: segueToScoreViewController, sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToScoreViewController {
            let destinationVC = segue.destination as? EndViewController
            destinationVC?.playerWon = playerWon
        }
    }
    
}


