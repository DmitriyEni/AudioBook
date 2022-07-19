//
//  PlayerVC.swift
//  AudioBook
//
//  Created by Dmitriy Eni on 07.06.2022.
//

import UIKit
import AVFoundation
import Haptica
import ID3TagEditor
import MobileCoreServices


class PlayerVC: UIViewController {
    
    public var position = 0
    public var book: [Book] = []
    
    @IBOutlet weak var holder: UIView!
    
    let id3TagEditor = ID3TagEditor()
    var player: AVAudioPlayer?
    //    User Interface elements
    
    private let albumImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let slider : UISlider = {
        let slider = UISlider()
        slider.minimumTrackTintColor = .label
        slider.maximumTrackTintColor = .systemGray
        slider.setThumbImage(UIImage(named: "thumbImage")?.withTintColor(.label), for: .normal)
        return slider
    }()
    
    private let songNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 // line wrap
        return label
    }()
    
    private let currentTime: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0 // line wrap
        label.textColor = .lightGray
        label.font = label.font.withSize(13)
        return label
    }()
    
    private let durationTime: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.numberOfLines = 0 // line wrap
        label.textColor = .lightGray
        label.font = label.font.withSize(13)
        return label
    }()
    
    let playPauseButton = UIButton()
    
    var timer:Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 0 {
            configure()
        }
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == .down {
            self.dismiss(animated: true, completion: nil)
        }
    }
    func configure() {
        slider.value = 0
        
        // set up player
        let song = book[position]
        
        let urlString = Bundle.main.path(forResource: song.tackName, ofType: "mp3")
        do {
            guard let urlString = urlString else { return }
//            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)

            player = try AVAudioPlayer(contentsOf: song.pathcs)
            
            guard let player = player else { return }
            let stringurl = song.pathcs.absoluteURL.absoluteString
            if let id3Tag = try? id3TagEditor.read(from: stringurl ) {
                let tagContentReader = ID3TagContentReader(id3Tag: id3Tag)
                
                
                
                let imagedata = tagContentReader.attachedPictures()[0].picture

                // ...use the tag...
                // For example to read the title, album and artist content you can do something similar
                print("album: \(tagContentReader.album() ?? "")")
                print("title: \(tagContentReader.title() ?? "")")
                print("albumArtist: \(tagContentReader.albumArtist() ?? "")")
                print("composer: \(tagContentReader.composer() ?? "")")
                print("conductor: \(tagContentReader.conductor() ?? "")")
                print("contentGrouping: \(tagContentReader.contentGrouping() ?? "")")
                print("encodedBy: \(tagContentReader.encodedBy() ?? "")")
                print("encoderSettings: \(tagContentReader.encoderSettings() ?? "")")
                print("lyricist: \(tagContentReader.lyricist() ?? "")")
                print("subtitle: \(tagContentReader.subtitle() ?? "")")
                print("originalFilename: \(tagContentReader.originalFilename() ?? "")")
                print("copyright: \(tagContentReader.copyright() ?? "")")
                print("copyright: \(tagContentReader.copyright() ?? "")")
                print("copyright: \(tagContentReader.copyright() ?? "")")

                
                
print("ПОЛУЧИЛОСЬ ПОЛУЧИТЬ ПУТЬ")
            } else {
                print("НЕЕЕЕ ПОЛУЧИЛОСЬ ПОЛУЧИТЬ ПУТЬ")

            }
            
//            let imagedata = tagContentReader.attachedPictures()[0].picture
//
//            // ...use the tag...
//            // For example to read the title, album and artist content you can do something similar
//            print("album: \(tagContentReader.album() ?? "")")
//            print("title: \(tagContentReader.title() ?? "")")
//            print("albumArtist: \(tagContentReader.albumArtist() ?? "")")
//            print("composer: \(tagContentReader.composer() ?? "")")
//            print("conductor: \(tagContentReader.conductor() ?? "")")
//            print("contentGrouping: \(tagContentReader.contentGrouping() ?? "")")
//            print("encodedBy: \(tagContentReader.encodedBy() ?? "")")
//            print("encoderSettings: \(tagContentReader.encoderSettings() ?? "")")
//            print("lyricist: \(tagContentReader.lyricist() ?? "")")
//            print("subtitle: \(tagContentReader.subtitle() ?? "")")
//            print("originalFilename: \(tagContentReader.originalFilename() ?? "")")
//            print("copyright: \(tagContentReader.copyright() ?? "")")
//            print("copyright: \(tagContentReader.copyright() ?? "")")
//            print("copyright: \(tagContentReader.copyright() ?? "")")

            player.play()
        }
        catch {
            print("error occurred")
        }
        
        
//        guard let urlString = urlString else { return }
        guard let id3Tag = try? id3TagEditor.read(from: String(contentsOf: song.pathcs)) else { return }
        let tagContentReader = ID3TagContentReader(id3Tag: id3Tag)
        
        let imagedata = tagContentReader.attachedPictures()[0].picture
        
        // ...use the tag...
        // For example to read the title, album and artist content you can do something similar
        print("album: \(tagContentReader.album() ?? "")")
        print("title: \(tagContentReader.title() ?? "")")
        print("albumArtist: \(tagContentReader.albumArtist() ?? "")")
        print("composer: \(tagContentReader.composer() ?? "")")
        print("conductor: \(tagContentReader.conductor() ?? "")")
        print("contentGrouping: \(tagContentReader.contentGrouping() ?? "")")
        print("encodedBy: \(tagContentReader.encodedBy() ?? "")")
        print("encoderSettings: \(tagContentReader.encoderSettings() ?? "")")
        print("lyricist: \(tagContentReader.lyricist() ?? "")")
        print("subtitle: \(tagContentReader.subtitle() ?? "")")
        print("originalFilename: \(tagContentReader.originalFilename() ?? "")")
        print("copyright: \(tagContentReader.copyright() ?? "")")
        print("copyright: \(tagContentReader.copyright() ?? "")")
        print("copyright: \(tagContentReader.copyright() ?? "")")


        
        //        var picture = id3Tag.frames[.attachedPicture(.frontCover)]?
        
        
        // set up user interface elements
        
        // album cover
        albumImageView.frame = CGRect(x: 20,
                                      y: 40,
                                      width: holder.frame.size.width - 40,
                                      height: holder.frame.size.width - 40)
        albumImageView.layer.cornerRadius = 8.0
        albumImageView.clipsToBounds = true
        albumImageView.image = UIImage(data: imagedata)
        
        holder.addSubview(albumImageView)
        
        // Labels: Book chapter, current time, duration
        songNameLabel.frame = CGRect(x: 50,
                                     y: albumImageView.frame.maxY + 10,
                                     width: holder.frame.size.width - 100,
                                     height: 45)
        songNameLabel.text = (id3Tag.frames[.title] as?  ID3FrameWithStringContent)?.content ?? ""
        holder.addSubview(songNameLabel)
        
        // slider
        slider.frame = CGRect(x: 20,
                              y: songNameLabel.frame.maxY + 10,
                              width: holder.frame.size.width - 40,
                              height: 20)
        
        slider.maximumValue = Float(player?.duration ?? 0)
        slider.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
        slider.isContinuous = false
        holder.addSubview(slider)
        
        // current time
        currentTime.frame = CGRect(x: 20,
                                   y: slider.frame.maxY + 5,
                                   width: holder.frame.size.width-40,
                                   height: 20)
        holder.addSubview(currentTime)
        currentTime.text = "00:00"
        
        // set time
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        
        durationTime.frame = CGRect(x: 20,
                                    y: slider.frame.maxY + 5,
                                    width: holder.frame.size.width-40,
                                    height: 20)
        holder.addSubview(durationTime)
        
        guard let player = player else { return }
        let seconds = Int(player.duration)
        let time = secondsToHoursMinutesSeconds(seconds: seconds)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        durationTime.text = timeString
        
        // Player controls
        let gobackward15Button = UIButton()
        let goforward15Button = UIButton()
        let nextButton = UIButton()
        let backButton = UIButton()
        let dismisButton = UIButton()
        
        // Frame
        let yPosition = slider.frame.maxY + 100
        let size: CGFloat = 50
        
        playPauseButton.frame = CGRect(x: (holder.frame.size.width - size - 10) / 2.0,
                                       y: yPosition - 5,
                                       width: size + 10,
                                       height: size + 10)
        
        nextButton.frame = CGRect(x: holder.frame.size.width - 30 - 20,
                                  y: albumImageView.frame.maxY + 25,
                                  width: 30,
                                  height: 20)
        
        backButton.frame = CGRect(x: 20,
                                  y: albumImageView.frame.maxY + 25,
                                  width: 30,
                                  height: 20)
        
        goforward15Button.frame = CGRect(x: holder.frame.size.width - size - 60,
                                         y: yPosition,
                                         width: size,
                                         height: size)
        
        gobackward15Button.frame = CGRect(x: 60,
                                          y: yPosition,
                                          width: size,
                                          height: size)
        
        dismisButton.frame = CGRect(x: holder.frame.size.width / 2 - 25,
                                    y: 10,
                                    width: 50,
                                    height: 15)
        
        
        
        // Styling
        playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        backButton.setBackgroundImage(UIImage(systemName: "chevron.backward.2"), for: .normal)
        nextButton.setBackgroundImage(UIImage(systemName: "chevron.forward.2"), for: .normal)
        gobackward15Button.setBackgroundImage(UIImage(systemName: "gobackward.15"), for: .normal)
        goforward15Button.setBackgroundImage(UIImage(systemName: "goforward.15"), for: .normal)
        dismisButton.setBackgroundImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
        
        playPauseButton.tintColor = .label
        gobackward15Button.tintColor = .label
        goforward15Button.tintColor = .label
        backButton.tintColor = .label
        nextButton.tintColor = .label
        dismisButton.tintColor = .label
        
        holder.addSubview(playPauseButton)
        holder.addSubview(nextButton)
        holder.addSubview(backButton)
        holder.addSubview(dismisButton)
        holder.addSubview(gobackward15Button)
        holder.addSubview(goforward15Button)
        
        // Add actions
        playPauseButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        dismisButton.addTarget(self, action: #selector(didTapDismasAction), for: .touchUpInside)
        goforward15Button.addTarget(self, action: #selector(goforward15Action), for: .touchUpInside)
        gobackward15Button.addTarget(self, action: #selector(gobackward15Action), for: .touchUpInside)
        
        
    }
    
    @objc func goforward15Action() {
        guard let player = player else { return }
        
        if (player.currentTime + 15.0) >= player.duration {
            didTapNextButton()
        } else {
            player.currentTime += 15
            timerCounter()
        }
    }
    
    @objc func gobackward15Action() {
        guard let player = player else { return }
        
        if (player.currentTime - 15.0) < 0 {
            didTapBackButton()
        } else {
            player.currentTime -= 15
            timerCounter()
        }
    }
    
    
    func timeInInteger() -> Int {
        let countdur = player?.currentTime
        let time3 = countdur ?? 0
        let time2 = round(time3)
        
        let count = Int(time2)
        
        return count
    }
    
    @objc func timerCounter() {
        let count = timeInInteger()
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        currentTime.text = timeString
        setTimetoSlider()
        if player?.isPlaying == false {
            didTapNextButton()
        }
    }
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60),((seconds % 3600) % 60))
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds : Int) -> String {
        var timeString = ""
        if hours != 0 {
            timeString += String(format: "%02d", hours)
            timeString += ":"
            timeString += String(format: "%02d", minutes)
            timeString += ":"
            timeString += String(format: "%02d", seconds)
        } else {
            timeString += String(format: "%02d", minutes)
            timeString += ":"
            timeString += String(format: "%02d", seconds)
        }
        return timeString
    }
    
    @objc func didSlideSlider(_ slider: UISlider) {
        guard let player13 = player else { return }
        
        player13.currentTime = TimeInterval(slider.value)
    }
    
    func setTimetoSlider() {
        let value = timeInInteger()
        slider.value = Float(value)
    }
    
    @objc func didTapBackButton() {
        Haptic.impact(.soft).generate()
        
        if position > 0 {
            position = position - 1
            player?.stop()
            for subview in holder.subviews {
                subview.removeFromSuperview()
            }
            configure()
        }
    }
    
    @objc func didTapNextButton() {
        Haptic.impact(.soft).generate()
        
        if position < (book.count - 1) {
            position = position + 1
            player?.stop()
            for subview in holder.subviews {
                subview.removeFromSuperview()
            }
            configure()
        }
    }
    
    @objc func didTapPlayPauseButton() {
        Haptic.impact(.soft).generate()
        
        if player?.isPlaying == true {
            // pause
            player?.pause()
            // show play button
            playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
            // shrink image
            UIView.animate(withDuration: 0.4, animations: {
                self.albumImageView.frame = CGRect(x: 50,
                                                   y: 70,
                                                   width: self.holder.frame.size.width - 100,
                                                   height: self.holder.frame.size.width - 100)
            })
        } else {
            // play
            player?.play()
            playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
            // increase image size
            UIView.animate(withDuration: 0.3, animations: {
                self.albumImageView.frame = CGRect(x: 20,
                                                   y: 40,
                                                   width: self.holder.frame.size.width - 40,
                                                   height: self.holder.frame.size.width - 40)
            })
        }
    }
    
    @objc func didTapDismasAction() {
        Haptic.impact(.soft).generate()
        player?.stop()
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
}
