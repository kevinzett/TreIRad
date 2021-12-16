//
//  GameViewController.swift
//  TreIRad
//
//  Created by Kevin Zetterlind on 2021-12-05.
//

import UIKit

class GameViewController: UIViewController {
    
    let segueToScoreViewController = "segueToScoreViewController"
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
    let waysToWin : [[Int]] = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2,5,8], [3,6,9], [1,5,9], [3, 5, 7]]
    let waysToEven = [1, 1, 1, 1, 1, 1, 1, 1]
    var spotTaken : [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var playerOne = Player(name: "PlayerOne", marker: "applelog", playerScore: [11])
    var playerTwo = Player(name: "PlayerTwo", marker: "androidlog", playerScore: [22])
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startingPlayerAndAddingImages()
    }
    
    
    
    func startingPlayerAndAddingImages() {
        currentPlayerLabel.text = playerOne.name
        arrayOfImages  = [UIImageView](arrayLiteral: iwOne, iwTwo, iwThree, iwFour, iwFive, iwSix, iwSeven, iwEigth, iwNine)
    }
 
    @IBAction func iwTapped(_ sender: UITapGestureRecognizer) {
        let tag = sender.view!.tag - 1
        if currentPlayerLabel.text == playerOne.name && spotTaken[tag] == 0 {
            arrayOfImages[tag].image = UIImage(named: playerOne.marker)
            currentPlayerLabel.text = playerTwo.name
            spotTaken[tag] = 1
            playerOne.playerScore.append(tag + 1)
            checkWin(sender: playerOne.playerScore)
            checkEven(sender: waysToEven)
        } else if currentPlayerLabel.text == playerTwo.name && spotTaken[tag] == 0 {
            arrayOfImages[tag].image = UIImage(named: playerTwo.marker)
            currentPlayerLabel.text = playerOne.name
            spotTaken[tag] = 1
            playerTwo.playerScore.append(tag + 1)
            checkWin(sender: playerTwo.playerScore)
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


