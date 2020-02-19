import UIKit
import AVFoundation


class ViewController: UIViewController {
	
	var players: [AVAudioPlayer] = []
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func keyPressed(_ sender: UIButton) {
		sender.alpha = 0.5
		playSound(filename: sender.currentTitle!)
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
			sender.alpha = 1
		}
	}
	
	func playSound(filename: String) {
		let url = Bundle.main.url(forResource: filename, withExtension: "wav")
		let player = try! AVAudioPlayer(contentsOf: url!)
		players.append(player)
		player.play()
		
		for pl in players {
			if !pl.isPlaying {
				if let index = players.firstIndex(of: pl) {
					players.remove(at: index)
				}
			}
		}
		
	}
	
}


