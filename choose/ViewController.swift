//
//  ViewController.swift
//  choose
//
//  Created by User15 on 2019/06/15.
//  Copyright © 2018 ee. All rights reserved.
//

import UIKit
import GameplayKit
import AVFoundation
var timer: Timer?
var sec = 0

struct Qna{
    var question: String
    var Ansers: [String]
    var Anser: String
    var QImage: String
}

class ViewController: UIViewController {
    
    var qans = [Qna]()
    var number = 0
    var point = 0
    
    @IBOutlet weak var QueLabel: UILabel!
    @IBOutlet var Anss: [UIButton]!
    @IBOutlet weak var Qimage: UIImageView!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var Qnum: UILabel!
    @IBOutlet weak var hints: UIButton!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var Start: UIButton!
    @IBOutlet weak var Startimg: UIImageView!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var qus: UIImageView!
    @IBOutlet var anssimg: [UIImageView]!
    @IBOutlet weak var Qnumimg: UIImageView!
    @IBOutlet var timeLabel: UILabel!
    
    var playagain = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        qans = [Qna(question:"動物園裡每個人必看的是什麼動物？", Ansers:["獅子", "大象", "售票員"], Anser:"售票員", QImage:"售票員"),
                Qna(question:"馬的頭朝南，請問馬的尾巴朝哪裡", Ansers:["北", "南", "下面"], Anser:"下面", QImage:"馬的尾巴"),
                Qna(question:"歐元什麼時候正式誕生？", Ansers:["1999年1月1日", "1999年7月1日", "1999年2月1日"], Anser:"1999年1月1日", QImage:"歐元"),
                Qna(question:"鐵達尼號游輪是哪一年沉沒的？", Ansers:["1910年", "1911年", "1912年"], Anser:"1912年", QImage:"鐵達尼號"),
                Qna(question:"人的五感中那個感覺反應最快？", Ansers:["味覺", "嗅覺", "聽覺"], Anser:"味覺", QImage:"舌頭"),
                Qna(question:"有“世界花城”（花都）之稱的是那個城市？", Ansers:["紐約", "倫敦", "巴黎"], Anser:"巴黎", QImage:"巴黎"),
                Qna(question:"排球1895年始於那個國家？", Ansers:["日本", "美國", "英國"], Anser:"十二段", QImage:"排球"),
                Qna(question:"乒乓球十九世紀始於那個國家？", Ansers:["英國", "中國", "法國"], Anser:"英國", QImage:"乒乓"),
                Qna(question:"企鵝產卵的季節一般是", Ansers:["春季", "夏季", "秋季"], Anser:"秋季", QImage:"企鵝"),
                Qna(question:"吉它有幾根弦？", Ansers:["4根", "５根", "６根"], Anser:"６根", QImage:"吉他"),
                Qna(question:"龍在十二生肖中排行第幾？", Ansers:["３", "４", "５"], Anser:"5", QImage:"龍"),
                Qna(question:"正規圍棋比賽的棋盤大小是", Ansers:["13乘13", "15乘15", "19乘19"], Anser:"19乘19", QImage:"圍期"),
        ]
        qans.shuffle()
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true)
        {(_) in
            if self.number == 9{
                sec = -1
                timer?.invalidate()
            }
            if self.Start.isHidden == true{
                sec = sec + 1
                self.timeLabel.text = String(sec)
            }
        }
        
        for i in 0...11
        {
            qans[i].Ansers.shuffle()
        }
        number = 0
        point = 0
        QueLabel.text = qans[number].question
        for j in 0...2
        {
            Anss[j].setTitle(qans[number].Ansers[j], for: UIControl.State.normal)
        }
        Qimage.image = UIImage(named: qans[number].QImage)
        
        Qnum.text = "第" + String(number+1) + "題"
        points.text = String(point)
        
        
        QueLabel.isHidden = true
        Anss[0].isHidden = true
        Anss[1].isHidden = true
        Anss[2].isHidden = true
        Qimage.isHidden = true
        Qnum.isHidden = true
        points.isHidden = true
        pointLabel.isHidden = true
        pic.isHidden = true
        qus.isHidden = true
        anssimg[0].isHidden = true
        anssimg[1].isHidden = true
        anssimg[2].isHidden = true
        Qnumimg.isHidden = true
        
        if playagain != 0
        {
            Start.isHidden = false
            Startimg.isHidden = false
        }
    }
    
    @IBAction func StartGame(_ sender: UIButton) {
        sender.isHidden = true
        Startimg.isHidden = true
        
        QueLabel.isHidden = false
        Anss[0].isHidden = false
        Anss[1].isHidden = false
        Anss[2].isHidden = false
        Qimage.isHidden = false
        Qnum.isHidden = false
        points.isHidden = false
        pointLabel.isHidden = false
        pic.isHidden = false
        qus.isHidden = false
        anssimg[0].isHidden = false
        anssimg[1].isHidden = false
        anssimg[2].isHidden = false
        Qnumimg.isHidden = false
    }
    
    func endGame(){
        let alertController = UIAlertController(title: "結束遊戲",
                                                message: "得到了" + String(point) + "分！", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "再玩一次", style: .default, handler:
        {
            (action: UIAlertAction!) -> Void in self.viewDidLoad()
            })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        self.view.setNeedsLayout()
        playagain = 1
    }
    
    func press(){
        if number == 9
        {
            endGame()
        }
        else
        {
            number = number + 1
        }
        
        QueLabel.text = qans[number].question
        for i in 0...2
        {
            Anss[i].setTitle(qans[number].Ansers[i], for: UIControl.State.normal)
        }
        Qimage.image = UIImage(named: qans[number].QImage)
        
        Qnum.text = "第" + String(number+1) + "題"
        points.text = String(point)
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3, delay: 0, animations: {
            self.Qimage.alpha = 1
            self.Qimage.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180 * 20)
        }, completion: nil)
    }
    
    @IBAction func pressAns(_ sender: UIButton) {
        let cellect = sender.currentTitle!
        if cellect == qans[number].Anser
        {
            point = point + 10
            
            press()
        }
        else
        {
            press()
        }
    }
    
}


