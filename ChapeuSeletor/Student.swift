//
//  Student.swift
//  ChapéuSeletor
//
//  Created by Rafael Forbeck on 29/07/19.
//  Copyright © 2019 Rafael Forbeck. All rights reserved.
//

import AVFoundation
import UIKit

class Student {
    
    var name: String
    var audio: AVAudioPlayer
    var picture: UIImage
    var period: Period
    var played = false
    
    init (name: String, period: Period) {
        self.name = name
        self.audio = AudioLoader.loader(audioName: name)
        self.picture = UIImage(named: name)!
        self.period = period
    }
}

enum Period {
    case morning
    case afternoon
}
