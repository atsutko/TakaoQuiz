//
//  ViewController.swift
//  TakaoQuiz
//
//  Created by TakaoAtsushi on 2017/11/15.
//  Copyright © 2017年 TakaoAtsushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 変数宣言と初期化
    var point: Int = 0
    var quizNumber: Int = 0
    var quizArray: [Quiz] = []
    
    // Storyboard上のパーツについて宣言
    @IBOutlet var quizNumberLabel: UILabel!
    @IBOutlet var quizTextView: UITextView!
    @IBOutlet var option1Button: UIButton!
    @IBOutlet var option2Button: UIButton!
    @IBOutlet var option3Button: UIButton!
    @IBOutlet var option4Button: UIButton!
    @IBOutlet var goodImageView: UIImageView!
    @IBOutlet var goodLabel: UILabel!
    
    
    
    // 画面起動時に呼ばれる
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // クイズのセットアップ
        setUpQuiz()
        
        // クイズ番号、クイズ、各選択肢の表示
        showQuiz()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // クイズのセットアップ
    func setUpQuiz() {
        let quiz1 = Quiz(text: "あっちゃんの生まれた年はいつ？", option1: "1993年", option2: "1994年", option3: "1995年",option4: "1996年", answer: "1995年")
        let quiz2 = Quiz(text: "あっちゃんの生まれた国は？", option1: "日本", option2: "アメリカ", option3: "ドイツ", option4: "イギリス", answer: "ドイツ")
        let quiz3 = Quiz(text: "あっちゃんの育った区はどこ？", option1: "港区", option2: "中央区", option3: "中野区", option4: "杉並区", answer: "中野区")
        let quiz4 = Quiz(text: "あっちゃんの好きなスポーツは何？", option1: "野球", option2: "サッカー", option3: "ゲートボール", option4: "バスケットボール", answer: "サッカー")
        let quiz5 = Quiz(text: "あっちゃんの好きなプログラミング言語は何？", option1: "java", option2: "c+", option3: "Ruby", option4: "swift", answer: "swift")
        let quiz6 = Quiz(text: "あっちゃんの好きなおかずは何？", option1: "肉じゃが", option2: "ハンバーグ", option3: "ポテトサラダ", option4: "唐揚げ", answer: "ポテトサラダ")
        let quiz7 = Quiz(text: "あっちゃんの嫌いな食べ物は何？", option1: "大根おろし", option2: "ピーマン", option3: "アスパラガス", option4: "きゅうり", answer: "大根おろし")
        let quiz8 = Quiz(text: "あっちゃんの好きな果物は何？", option1: "びわ", option2: "スイカ", option3: "バナナ", option4: "りんご", answer: "りんご")
        let quiz9 = Quiz(text: "あっちゃんの嫌いなデザートは何？", option1: "ごま団子", option2: "ナタデココ", option3: "プリン", option4: "ケーキ", answer: "ナタデココ")
        let quiz10 = Quiz(text: "あっちゃんの趣味は何？", option1: "スノーボード", option2: "ダイビング", option3: "バンジージャンプ", option4: "ゴルフ", answer: "スノーボード")
        let quiz11 = Quiz(text: "あっちゃんの好きなラーメンの味は？", option1: "醤油", option2: "塩", option3: "とんこつ", option4: "みそ", answer: "とんこつ")
        let quiz12 = Quiz(text: "あっちゃんの普段の睡眠時間は？", option1: "5時間", option2: "7時間", option3: "9時間", option4: "11時間", answer: "７時間")
        let quiz13 = Quiz(text: "あっちゃんの好きなサッカーチームは？", option1: "バルセロナ", option2: "レアル・マドリード", option3: "ユベントス", option4: "浦和レッズ", answer: "ユベントス")
        let quiz14 = Quiz(text: "あっちゃんの出身高校は？", option1: "海城高校", option2: "開成高校", option3: "麻布高校", option4: "灘高校", answer: "海城高校")
        let quiz15 = Quiz(text: "あっちゃんの使っているMacの種類は？", option1: "MacBook Pro", option2: "MacBook Air", option3: "MacBook", option4: "Mac Mini", answer: "MacBook Pro")
        let quiz16 = Quiz(text: "あっちゃんの尊敬している人は？", option1: "イーロン・マスク", option2: "スティーブ・ジョブズ", option3: "堀江貴文", option4: "白石麻衣", answer: "スティーブ・ジョブズ")
        let quiz17 = Quiz(text: "あっちゃんの好きなアイドルは何？", option1: "AKB48", option2: "ももいろクローバーZ", option3: "Twice", option4: "乃木坂46", answer: "乃木坂46")
        let quiz18 = Quiz(text: "あっちゃんの好きな本は？", option1: "イシューからはじめよ", option2: "多動力", option3: "嫌われる勇気", option4: "アルケミスト", answer: "多動力")
        let quiz19 = Quiz(text: "以下の国で、あっちゃんの行ったことのある国は？", option1: "アメリカ", option2: "カナダ", option3: "メキシコ", option4: "ロシア", answer: "アメリカ")
        let quiz20 = Quiz(text: "以下の国で、あっちゃんの行ったことのない国は？", option1: "韓国", option2: "中国", option3: "シンガポール", option4: "イギリス", answer: "シンガポール")
        let quiz21 = Quiz(text: "あっちゃんの好きな飲み物は何？", option1: "コーラ", option2: "カルピス", option3: "お茶", option4: "水", answer: "カルピス")
        let quiz22 = Quiz(text: "あっちゃんの好きな乃木坂46のメンバーは？", option1: "白石麻衣", option2: "西野七瀬", option3: "齋藤飛鳥", option4: "高山一実", answer: "高山一実")
        let quiz23 = Quiz(text: "あっちゃんの好きな芸人は？", option1: "アンジャッシュ", option2: "フットボールアワー", option3: "ダウンタウン", option4: "千鳥", answer: "アンジャッシュ")
        let quiz24 = Quiz(text: "あっちゃんの嫌いな果物は？", option1: "メロン", option2: "もも", option3: "バナナ", option4: "りんご", answer: "メロン")
        let quiz25 = Quiz(text: "あっちゃんのiPhoneの種類は？", option1: "iPhone6", option2: "iPhone6s", option3: "iPhone7", option4: "iPhone8", answer: "iPhone6s")
        let quiz26 = Quiz(text: "あっちゃんの好きな色は？", option1: "黄色", option2: "水色", option3: "赤色", option4: "青色", answer: "青色")
        let quiz27 = Quiz(text: "あっちゃんの行きたい国は？", option1: "ロシア", option2: "シンガポール", option3: "ベトナム", option4: "カンボジア", answer: "シンガポール")
        let quiz28 = Quiz(text: "あっちゃんの所属大学は？", option1: "東京大学", option2: "早稲田大学", option3: "慶應義塾大学", option4: "東京工業大学", answer: "東京大学")
        let quiz29 = Quiz(text: "あっちゃんの所属学部は？", option1: "法学部", option2: "工学部", option3: "農学部", option4: "経済学部", answer: "農学部")
        let quiz30 = Quiz(text: "あっちゃんの専門は？", option1: "農業", option2: "生命工学", option3: "景観学", option4: "経済学", answer: "景観学")
        
  
        // quizArray配列に問題を追加
        quizArray.append(quiz1)
        quizArray.append(quiz2)
        quizArray.append(quiz3)
        quizArray.append(quiz4)
        quizArray.append(quiz5)
        quizArray.append(quiz6)
        quizArray.append(quiz7)
        quizArray.append(quiz8)
        quizArray.append(quiz9)
        quizArray.append(quiz10)
        quizArray.append(quiz11)
        quizArray.append(quiz12)
        quizArray.append(quiz13)
        quizArray.append(quiz14)
        quizArray.append(quiz15)
        quizArray.append(quiz16)
        quizArray.append(quiz17)
        quizArray.append(quiz18)
        quizArray.append(quiz19)
        quizArray.append(quiz20)
        quizArray.append(quiz21)
        quizArray.append(quiz22)
        quizArray.append(quiz23)
        quizArray.append(quiz24)
        quizArray.append(quiz25)
        quizArray.append(quiz26)
        quizArray.append(quiz27)
        quizArray.append(quiz28)
        quizArray.append(quiz29)
        quizArray.append(quiz30)

        

        
        // quizArrayをシャッフルして、入れ直す
        quizArray = Quiz.shuffle(quizArray: quizArray)
    }
    
    // クイズを各パーツに表示
    func showQuiz() {
        // クイズ番号、クイズ、各選択肢の表示
        quizNumberLabel.text = String(quizNumber + 1) + "問目"
        quizTextView.text = quizArray[quizNumber].text
        option1Button.setTitle(quizArray[quizNumber].option1, for: .normal)
        option2Button.setTitle(quizArray[quizNumber].option2, for: .normal)
        option3Button.setTitle(quizArray[quizNumber].option3, for: .normal)
        option4Button.setTitle(quizArray[quizNumber].option4, for: .normal)
    }
    
    // クイズの各データをリセット
    func resetQuiz() {
        point = 0
        quizNumber = 0
        self.quizArray = Quiz.shuffle(quizArray: self.quizArray)
        self.showQuiz()
    }
    
    // クイズをアップデート
    func updateQuiz() {
        // 問題番号を更新
        quizNumber = quizNumber + 1
        
        // もし最終問題をとき終えたら、アラートを出すして結果表示
        if quizNumber == 10 {
            let alertText = "10問中、\(point)問正解でした。"
            let alertController = UIAlertController(title: "結果", message: alertText, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                self.resetQuiz()
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            // 最終問題以外では次の問題を表示
            showQuiz()
        }
    }
    
    func animationBatsu() {
        self.goodImageView.image = UIImage(named: "batsu.png")
        self.goodImageView.alpha = 1.0
        self.goodLabel.text = "不正解！！"
        self.goodLabel.alpha = 1.0
        UIView.animate(withDuration: 2.0, animations: {
            self.goodImageView.alpha = 0.0
            self.goodLabel.alpha = 0.0
        }, completion: {  (isFinished) in
            self.updateQuiz()
        })
        
    }
    
    func animationMaru() {
        self.goodImageView.image = UIImage(named: "Circle.png")
        self.goodImageView.alpha = 1.0
        self.goodLabel.text = "正解！！"
        self.goodLabel.alpha = 1.0
        UIView.animate(withDuration: 2.0, animations: {
            self.goodImageView.alpha = 0.0
            self.goodLabel.alpha = 0.0
            }, completion: { (isFinished) in
                self.updateQuiz()
                })
    }
    
    // 選択肢1が押されたときの処理
    @IBAction func selectOption1() {
        // ボタン内の文言と、もともと設定していた答えが一致しているか確認
        if option1Button.titleLabel?.text == quizArray[quizNumber].answer {
            print("正解！")
            // 正解ポイント追加
            point = point + 1
            animationMaru()
        } else {
            print("不正解！")
            animationBatsu()
        }
 
    }
    
    // 選択肢2が押されたときの処理
    @IBAction func selectOption2() {
        // ボタン内の文言と、もともと設定していた答えが一致しているか確認
        if option2Button.titleLabel?.text == quizArray[quizNumber].answer {
            print("正解！")
            // 正解ポイント追加
            point = point + 1
            animationMaru()
        } else {
            print("不正解！")
            animationBatsu()
        }
        
       
    }
    
    // 選択肢3が押されたときの処理
    @IBAction func selectOption3() {
        // ボタン内の文言と、もともと設定していた答えが一致しているか確認
        if option3Button.titleLabel?.text == quizArray[quizNumber].answer {
            print("正解！")
            // 正解ポイント追加
            point = point + 1
            animationMaru()
        } else {
            print("不正解！")
            animationBatsu()
        }
        
    
    }
    
    @IBAction func selectOption4() {
        // ボタン内の文言と、もともと設定していた答えが一致しているか確認
        if option4Button.titleLabel?.text == quizArray[quizNumber].answer {
            print("正解！")
            // 正解ポイント追加
            point = point + 1
            animationMaru()
        } else {
            print("不正解！")
            animationBatsu()
        }
        
    }

}

