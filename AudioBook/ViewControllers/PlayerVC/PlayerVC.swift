//
//  PlayerVC.swift
//  AudioBook
//
//  Created by Dmitriy Eni on 07.06.2022.
//

import UIKit
import AVFoundation

class PlayerVC: UIViewController {

    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBOutlet weak var numberOfChaptersLabel: UILabel!
    @IBOutlet weak var runningTimeLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var coverImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func playPauseButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func goForwardAction(_ sender: Any) {
        
    }
    
    @IBAction func goBackwardButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func nextChapterButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func previousChapterButtonAction(_ sender: Any) {
        
    }
}
