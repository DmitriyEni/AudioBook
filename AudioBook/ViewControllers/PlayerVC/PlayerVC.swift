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
    
    public var position = 0
    public var book: [Book] = []
    
    @IBOutlet weak var holder: UIView!
    
    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBOutlet weak var numberOfChaptersLabel: UILabel!
    @IBOutlet weak var runningTimeLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var coverImage: UIImageView!

    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
//        numberOfChaptersLabel.text = book.name
//        nameLabel.text = book.albomName
//        coverImage.image = UIImage(named: book.imageName)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 0 {
            configure()
        }
    }
    
    func configure() {
        // set up player
        let song = book[position]
        print("\(song)")
        
        let urlString = Bundle.main.path(forResource: song.tackName, ofType: "mp3")
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString
            else {

                return
            }
            print("\(urlString)")

            
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            
            guard let player = player else {
                return
            }
            
            player.play()

        }
        catch {
            print("Error")
        }
        // set up user interface elements
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
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
