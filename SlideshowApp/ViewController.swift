//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 佐々木駿 on 2019/07/20.
//  Copyright © 2019 shun.sasaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //ボタンの有効/無効の配列
    @IBOutlet var exclusiveButton: [UIButton]!
    @IBOutlet var slideLabelText: [UIButton]!
    
    //表示する画像の配列
    let imageArrayString = ["DWYL_Glay.jpg", "DWYL_Navy.jpg", "DWYL_neon.jpg"]
    //表示番号の初期値
    var imageNum = 0
    //リピートタイマー
    var timer: Timer!
    var timer_sec: Float = 0
    //再生/停止ボタンのカウント
    var tappedCount: Int = 0
    
    @IBOutlet weak var displayImage: UIImageView!
    
    //進むボタンをお
    @IBAction func nextButton(_ sender: UIButton) {
        //最初の画像から進む
        if imageNum == 0 {
            imageNum += 1
            let initImage = UIImage(named: imageArrayString[imageNum])
            displayImage.image = initImage
        //最後の画像の場合は最初の画像に戻る
        } else if imageNum == 2 {
            imageNum = 0
            let initImage = UIImage(named: imageArrayString[imageNum])
            displayImage.image = initImage
        //それ以外は進む
        } else {
            imageNum += 1
            let initImage = UIImage(named: imageArrayString[imageNum])
            displayImage.image = initImage
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        //最後の画像からBackする
        if imageNum == 2 {
            imageNum -= 1
            let initImage = UIImage(named: imageArrayString[imageNum])
            displayImage.image = initImage
        //最初のページの場合は最後のページを表示する
        } else if imageNum == 0 {
            imageNum = 2
            let initImage = UIImage(named: imageArrayString[imageNum])
            displayImage.image = initImage
        //それ以外はBackする
        } else {
            imageNum -= 1
            let initImage = UIImage(named: imageArrayString[imageNum])
            displayImage.image = initImage
        }
    }
    
    @IBAction func startStopButton(_ sender: UIButton) {
        sender.setTitle("再生", for: .normal)
        //再生ボタンの挙動
        if tappedCount == 0 {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            tappedCount += 1
            //他のボタンを無効化
            for button in exclusiveButton {
                button.isEnabled = false
            }
            sender.setTitle("停止", for: .normal)
        //停止ボタンの挙動
        } else {
            self.timer.invalidate()
            tappedCount = 0
            self.timer_sec = 0
            //他のボタンを再有効
            for button in exclusiveButton {
                button.isEnabled = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //タップを許可する
        displayImage.isUserInteractionEnabled = true
        //初期表示する画像
        let initImage = UIImage(named: imageArrayString[imageNum])
        displayImage.image = initImage
    }
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 1.0
        //最初の画像から進む
        if imageNum == 0 {
            imageNum += 1
            let initImage = UIImage(named: imageArrayString[imageNum])
            displayImage.image = initImage
            //最後の画像の場合は最初の画像に戻る
        } else if imageNum == 2 {
            imageNum = 0
            let initImage = UIImage(named: imageArrayString[imageNum])
            displayImage.image = initImage
            //それ以外は進む
        } else {
            imageNum += 1
            let initImage = UIImage(named: imageArrayString[imageNum])
            displayImage.image = initImage
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let expandViewController: ExpandViewController = segue.destination as! ExpandViewController
        if displayImage.image == displayImage.image {
            if timer == nil {
                expandViewController.image = displayImage.image!
            }else {
                timer.invalidate()
            }
            expandViewController.image = displayImage.image!
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        for button in exclusiveButton {
            button.isEnabled = true
        }
        for slideText in slideLabelText {
            slideText.setTitle("再生", for: .normal)
        }
        tappedCount = 0
        
    }
}

