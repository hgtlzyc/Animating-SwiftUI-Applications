import Foundation
import AVFoundation

var player: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
        player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
        player?.play()
        
        } catch {
            print("Could not load audio file")
        }
    }
}
