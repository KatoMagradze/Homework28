//
//  ViewController.swift
//  Homework28
//
//  Created by Kato on 5/27/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit


class Beach {
    var image = UIImage()
    var item = ""
}

class ViewController: UIViewController {
    
    var beachArr = [Beach]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        tableView.delegate = self
        tableView.dataSource = self
        
        let beachGames = Beach()
        beachGames.item = "Beach games"
        beachGames.image = UIImage(named: "sandbox_icon")!
        
        let surfingBoard = Beach()
        surfingBoard.item = "Surfing board"
        surfingBoard.image = UIImage(named: "surfing_icon")!
        
        let cocktailMood = Beach()
        cocktailMood.item = "Cocktail mood"
        cocktailMood.image = UIImage(named: "cocktail_icon")!
        
        let beachBall = Beach()
        beachBall.item = "Beach ball"
        beachBall.image = UIImage(named: "ball_icon")!
        
        beachArr.append(beachGames)
        beachArr.append(surfingBoard)
        beachArr.append(cocktailMood)
        beachArr.append(beachBall)
        
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beachArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "beach_cell", for: indexPath) as! BeachCell
        
        cell.beachItemImage.image = beachArr[indexPath.row].image
        cell.beachItemLabel.text = beachArr[indexPath.row].item
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let beachItemPopUp = UIImageView(frame: CGRect(x: (view.frame.width/2)-80, y: view.frame.height, width: 150, height: 150))
        
        let addImage = beachArr[indexPath.row].image
        beachItemPopUp.image = addImage
        
        beachItemPopUp.backgroundColor = .darkGray
        beachItemPopUp.alpha = 0.8
        beachItemPopUp.layer.cornerRadius = 10
        
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.50, initialSpringVelocity: 0.10, options: [], animations: {
            
            self.view.addSubview(beachItemPopUp)
            beachItemPopUp.frame.origin.y -= 300
            beachItemPopUp.transform = CGAffineTransform(scaleX: 1, y: 1)
            
        }) { (finished) in
            
            //print(finished)
        
            UIView.transition(with: beachItemPopUp, duration: 0.5, options: .transitionFlipFromBottom, animations: nil, completion: nil)

            UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
                    
                beachItemPopUp.alpha = 0.0
                    
            }) { (finished) in
                    //print(finished)
                }
            }
    
    }
}


