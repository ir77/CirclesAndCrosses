//
//  ViewController.swift
//  CirclesAndCrosses
//
//  Created by yuchimur on 2016/12/24.
//  Copyright © 2016年 内村　祐之. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet fileprivate var buttons: [CellButton]! 
    let gameManager = GameManager.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameManager.delegate = self
    }

    @IBAction private func buttonAction(_ sender: CellButton) {
        guard sender.status == .None else { return }
        
        sender.changeStatusTo(status: gameManager.turn(board: buttons.map { $0.status }))
        gameManager.checkGameOver(board: buttons.map { $0.status })
    }    
}

extension ViewController: GameDelegate {
    func gameOver(turn: Status) {
        buttons.toDisable()
        
        let alert = UIAlertController.simpleAlertController(title: turn.title, message: "の勝利です！！！")
        self.present(alert, animated: true, completion: nil)
    }
}
