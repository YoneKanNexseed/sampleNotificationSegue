import UIKit
import AVFoundation

class NextViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        playMusic()
    }
    
    @IBAction func didTapBtn(_ sender: Any) {
        stopMusic()
        performSegue(withIdentifier: "toTop", sender: nil)
    }
    
}

// 音源再生機能はこちら
extension NextViewController: AVAudioPlayerDelegate {
    func playMusic() {
        if let music = NSDataAsset(name: "music3") {
            audioPlayer = try? AVAudioPlayer(data: music.data)
            audioPlayer.delegate = self
            audioPlayer.play()
        }
    }
    
    func stopMusic() {
        if audioPlayer.isPlaying {
            audioPlayer.stop()
        }
    }
}
