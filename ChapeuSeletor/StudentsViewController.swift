//
//  StudentsViewController.swift
//  ChapeuSeletor
//
//  Created by Rafael Forbeck on 29/07/19.
//  Copyright © 2019 Rafael Forbeck. All rights reserved.
//

import UIKit
import AVFoundation

class StudentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AVAudioPlayerDelegate {
    
    @IBOutlet weak var studentTable: UITableView!
    @IBOutlet weak var rew: UIButton!
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var playerName: UILabel!
    
    private var students = Model.shared.getStudents()
    private var currentIndex: Int = -1
    private var isPlaying = false
    
    private var defaultColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    private var playedColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
    private var selectedColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
    private var playingColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    private var noPlyingColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        studentTable.delegate = self
        studentTable.dataSource = self
        
        playerName.isHidden = true
        play.isEnabled = false
        rew.isEnabled = false
        
        view.backgroundColor = noPlyingColor
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let student = students[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudentTableViewCell
        
        cell.picture.image = student.picture
        cell.name.text = student.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if let studentCell = cell as? StudentTableViewCell {
            let student = students[indexPath.row]
            if currentIndex == indexPath.row {
                studentCell.backgrounCell.backgroundColor = selectedColor
            } else if student.played {
                studentCell.backgrounCell.backgroundColor = playedColor
            } else {
                studentCell.backgrounCell.backgroundColor = defaultColor
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        setupPlayer(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        setupStop()
    }
    
    func setupPlayer(index: Int) {
        if currentIndex != -1 {
            if students[currentIndex].audio.isPlaying {
                return
            }
        }
        
        if let cell = studentTable.cellForRow(at: IndexPath(item: currentIndex, section: 0)) as? StudentTableViewCell {
            if students[currentIndex].played {
                cell.backgrounCell.backgroundColor = playedColor
            } else {
                cell.backgrounCell.backgroundColor = defaultColor
            }
        }
        currentIndex = index
        if let cell = studentTable.cellForRow(at: IndexPath(item: currentIndex, section: 0)) as? StudentTableViewCell {
            cell.backgrounCell.backgroundColor = selectedColor
        }
        playerName.isHidden = false
        play.isEnabled = true
        rew.isEnabled = true
        
        let student = students[index]
        playerName.text = student.name
    }
    
    func setupPlay(_ student: Student) {
        play.setImage(#imageLiteral(resourceName: "img-pause"), for: .normal)
        view.backgroundColor = playingColor
        if !student.played {
            student.played = true
            if let cell = studentTable.cellForRow(at: IndexPath(item: currentIndex, section: 0)) as? StudentTableViewCell {
                cell.backgrounCell.backgroundColor = playingColor
            }
        }
        isPlaying = true
    }
    
    func setupStop() {
        play.setImage(#imageLiteral(resourceName: "img-play"), for: .normal)
        isPlaying = false
        view.backgroundColor = noPlyingColor
    }
    
    @IBAction func stopPressed(_ sender: Any) {
        let audio = students[currentIndex].audio
        audio.stop()
        audio.currentTime = 0
        setupStop()
    }
    
    @IBAction func playPressed(_ sender: Any) {
        let student = students[currentIndex]
        if isPlaying {
            student.audio.pause()
            setupStop()
        } else {
            student.audio.play()
            student.audio.delegate = self
            setupPlay(student)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if currentIndex == -1 {
            return
        }
        students[currentIndex].audio.stop()
    }
}
