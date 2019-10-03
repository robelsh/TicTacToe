//
//  ViewController.swift
//  tic-tac-toe
//
//  Created by Etienne JEZEQUEL on 01/10/2019.
//  Copyright © 2019 Etienne JEZEQUEL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var game: Game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func handleTouch(_ sender: AnyObject) {
        if let index = sender.tag, game.getGameState() == .running {
            (sender as! UIButton).backgroundColor = game.getCurrentPlayer() == .first ? .red : .green
            game.play(at: index)
        }
    }
}
