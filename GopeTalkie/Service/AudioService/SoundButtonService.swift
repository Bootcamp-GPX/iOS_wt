//
//  SoundButtonService.swift
//  GopeTalkie
//
//  Created by Gopenux on 31/07/25.
//

import Foundation
import AVFoundation

final class SoundButtonService {
    private var audioPlayer: AVAudioPlayer?

    func playSound(named name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: nil) else {
            print("⚠️ No se encontró el sonido: \(name)")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("❌ Error al reproducir el sonido: \(error)")
        }
    }
}
