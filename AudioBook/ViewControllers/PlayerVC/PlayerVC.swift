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
    
    var player: AVAudioPlayer?
    
    //    User Interface elements
    
    private let albumImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let songNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 // line wrap
        return label
    }()
    
    let playPauseButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            try AVAudioSession.sharedInstance().setMode(.gameChat)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                print("urlstring is nil")
                return
            }
            print("\(urlString)")
            
            
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            
            guard let player = player else {
                print("player is nil")
                return
            }
            player.volume = 0.5
            
            player.play()
            
        }
        catch {
            print("error occurred")
        }
        // set up user interface elements
        
        // album cover
        albumImageView.frame = CGRect(x: holder.frame.size.width * 0.1,
                                      y: 50,
                                      width: holder.frame.size.width * 0.8,
                                      height: holder.frame.size.width * 0.8)
        albumImageView.image = UIImage(named: song.imageName)
        
        holder.addSubview(albumImageView)
        
        // Labels: Song name, album, artist
        songNameLabel.frame = CGRect(x: 10,
                                     y: holder.frame.size.height / 2 - 10,
                                     width: holder.frame.size.width-20,
                                     height: 70)
   
        
        songNameLabel.text = song.tackName
      
        
        holder.addSubview(songNameLabel)
      
        
        // Player controls
        let nextButton = UIButton()
        let backButton = UIButton()
        let dismisButton = UIButton()
        
        // Frame
        let yPosition = songNameLabel.frame.origin.y + 70 + 20
        let size: CGFloat = 60
        
        playPauseButton.frame = CGRect(x: (holder.frame.size.width - size) / 2.0,
                                       y: yPosition,
                                       width: size,
                                       height: size)
        
        nextButton.frame = CGRect(x: holder.frame.size.width - size - 50,
                                  y: yPosition,
                                  width: size,
                                  height: size)
        
        backButton.frame = CGRect(x: 50,
                                  y: yPosition,
                                  width: size,
                                  height: size)
        
        dismisButton.frame = CGRect(x: holder.frame.size.width / 2 - 25,
                                    y: 10,
                                    width: 50,
                                    height: 15)
        
        // Add actions
        playPauseButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        dismisButton.addTarget(self, action: #selector(didTapDismasAction), for: .touchUpInside)
        
        // Styling
        
        playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        backButton.setBackgroundImage(UIImage(systemName: "gobackward.30"), for: .normal)
        nextButton.setBackgroundImage(UIImage(systemName: "goforward.30"), for: .normal)
        dismisButton.setBackgroundImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
        
        playPauseButton.tintColor = .label
        backButton.tintColor = .label
        nextButton.tintColor = .label
        dismisButton.tintColor = .label
        
        holder.addSubview(playPauseButton)
        holder.addSubview(nextButton)
        holder.addSubview(backButton)
        holder.addSubview(dismisButton)
        
        // slider
        let slider = UISlider(frame: CGRect(x: 20,
                                            y: holder.frame.size.height-60,
                                            width: holder.frame.size.width-40,
                                            height: 50))
        slider.value = 0.5
        slider.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
        holder.addSubview(slider)
    }
    @objc func didTapBackButton() {
        if position > 0 {
            position = position - 1
            player?.stop()
            for subview in holder.subviews {
                subview.removeFromSuperview()
            }
            configure()
            Haptic.impact(.soft).generate()
            
        }
    }
    
    @objc func didTapNextButton() {
        if position < (book.count - 1) {
            position = position + 1
            player?.stop()
            for subview in holder.subviews {
                subview.removeFromSuperview()
            }
            configure()
            Haptic.impact(.soft).generate()
            
        }
    }
    
    @objc func didTapPlayPauseButton() {
        if player?.isPlaying == true {
            Haptic.impact(.soft).generate()
            
            // pause
            player?.pause()
            // show play button
            playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
            
            // shrink image
            UIView.animate(withDuration: 0.3, animations: {
                self.albumImageView.frame = CGRect(x: self.holder.frame.size.width * 0.15,
                                                   y: self.holder.frame.size.width * 0.075 + 50,
                                                   width: self.holder.frame.size.width * 0.7,
                                                   height: self.holder.frame.size.width * 0.7)
            })
        }
        else {
            Haptic.impact(.soft).generate()
            
            // play
            player?.play()
            playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
            
            // increase image size
            UIView.animate(withDuration: 0.3, animations: {
                self.albumImageView.frame = CGRect(x: self.holder.frame.size.width * 0.1,
                                                   y: 55,
                                                   width: self.holder.frame.size.width * 0.8,
                                                   height: self.holder.frame.size.width * 0.8)
            })
        }
    }
    
    @objc func didTapDismasAction() {
        Haptic.impact(.soft).generate()
        print("tapDismiss")
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func didSlideSlider(_ slider: UISlider) {
        let value = slider.value
        player?.volume = value
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
}
