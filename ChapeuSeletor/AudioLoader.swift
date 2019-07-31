//
//  AudioLoader.swift
//  ChapéuSeletor
//
//  Created by Rafael Forbeck on 29/07/19.
//  Copyright © 2019 Rafael Forbeck. All rights reserved.
//

import AVFoundation

class AudioLoader {
    
    static func loader(audioName: String) -> AVAudioPlayer{
        
        var player: AVAudioPlayer
        let path = Bundle.main.path(forResource: "\(audioName)", ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            return player
        } catch {
            fatalError("Não foi possível carregar o arquivo de áudio")
        }
    }
}
