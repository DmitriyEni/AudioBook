//
//  PlayerVC.swift
//  AudioBook
//
//  Created by Dmitriy Eni on 07.06.2022.
//

import UIKit
import AVFoundation
import Haptica

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
    
    func createPlayer(Cover: String, Name: String, Chapters: String) {
        nameLabel.text = Name
        coverImage.image = UIImage(named: Cover)
        numberOfChaptersLabel.text = Chapters
        
    }
    
    @IBAction func playPauseButtonAction(_ sender: Any) {
        Haptic.impact(.soft).generate()
        
    }
    
    @IBAction func goForwardAction(_ sender: Any) {
        Haptic.impact(.soft).generate()
        
    }
    
    @IBAction func goBackwardButtonAction(_ sender: Any) {
        Haptic.impact(.soft).generate()
        
    }
    
    @IBAction func nextChapterButtonAction(_ sender: Any) {
        Haptic.impact(.soft).generate()
        
    }
    
    @IBAction func previousChapterButtonAction(_ sender: Any) {
        Haptic.impact(.soft).generate()
        
    }
}
