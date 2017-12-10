//
//  ExtraQuizViewController.swift
//  InterfaceTestDateToEvent
//
//  Created by Normand Martin on 17-12-07.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit

class ExtraQuizViewController: ViewController {
    @IBOutlet weak var firstEventExtra: UILabel!
    @IBOutlet weak var labelSecondEventExtra: UILabel!
    @IBOutlet weak var labelThirdEventExtra: UILabel!
    @IBOutlet weak var labelFourthEventExtra: UILabel!
    @IBOutlet weak var labelFifthEventExtra: UILabel!
    @IBOutlet weak var labelFirstDateExtra: UILabel!
    @IBOutlet weak var labelSecondDateExtra: UILabel!
    @IBOutlet weak var labelThirdDateExtra: UILabel!
    @IBOutlet weak var labelFourthDateExtra: UILabel!
    @IBOutlet weak var labelFifthDateExtra: UILabel!
    @IBOutlet weak var timerLabelExtra: UILabel!
    @IBOutlet weak var buttonFirstDateExtra: UIButton!
    @IBOutlet weak var buttonSecondDateExtra: UIButton!
    @IBOutlet weak var buttonThirdDateExtra: UIButton!
    @IBOutlet weak var buttonFourthDateExtra: UIButton!
    @IBOutlet weak var buttonFifthDateExtra: UIButton!
    @IBOutlet weak var buttonSixthDateExtra: UIButton!
    @IBOutlet weak var buttonCreditExtra: UIButton!
    
    var selectedSubjectExtra = String()
    var errorCounterExtra = Int()
    var dateExtra: [String] = []
    var eventExtra: [String] = []
    var unitsExtra: [String] = []
    var timerExtra = Timer()
    var gameTimerExtra = Timer()
    var indexDateExtra: [Int] = []
    var indexEventExtra: [Int] = []
    var questionLabelExtra = UILabel()
    var creditExtra = UserDefaults.standard.integer(forKey: "credit")
    enum buttonNumberExtra: Int{
        case buttonFirstDateExtra = 0
        case buttonSecondDateExtra
        case buttonThirdDateExtra
        case buttonFourthDateExtra
        case buttonFifthDateExtra
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let historicalData = HistoricalData(questionGroup: selectedSubjectExtra)
        dateExtra = historicalData.date
        eventExtra = historicalData.event
        unitsExtra = historicalData.units
        let randomizeQuestion = RandomizeQuestion(date: dateExtra, event: eventExtra)
        indexDateExtra = randomizeQuestion.generateDateIndex(from: 0, to: dateExtra.count - 1, quantity: nil)
        indexEventExtra = randomizeQuestion.generateEventIndex(from: 0, to: eventExtra.count - 1, quantity: nil)
        let labelAndButtonDisplay = toDisplayButtonsAndLabelsExtra()
        timerLabelExtra.isHidden = false
        print(creditExtra)
        print(credit)
        labelAndButtonDisplay.buttonFormat(event: eventExtra, indexEvent: indexEventExtra)
        labelAndButtonDisplay.labelFormat()
        labelAndButtonDisplay.allShown()
        labelAndButtonDisplay.startQuizExtra()
        buttonCreditExtra.setTitle("credits: \(creditExtra)", for: .normal)

        gameTimerExtra = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(chronometerExtra), userInfo: nil, repeats: true)
        labelFirstDateExtra.text = dateExtra[0] + " " + unitsExtra[0]
        labelSecondDateExtra.text = dateExtra[1] + " " + unitsExtra[1]
        labelThirdDateExtra.text = dateExtra[2] + " " + unitsExtra[2]
        labelFourthDateExtra.text = dateExtra[3] + " " + unitsExtra[3]
        labelFifthDateExtra.text = dateExtra[4] + " " + unitsExtra[4]
        
        questionLabelExtra = UILabel(frame: CGRect(origin: CGPoint(x: self.view.frame.width/2 - 150, y: self.view.frame.height/4 - 25), size: CGSize(width: 300, height: 100)))
        questionLabelExtra.layer.backgroundColor = UIColor(red: 171/255, green: 203/255, blue: 235/255, alpha: 1.0).cgColor
        questionLabelExtra.numberOfLines = 0
        questionLabelExtra.lineBreakMode = .byWordWrapping
        questionLabelExtra.font = UIFont.systemFont(ofSize: 25)
        questionLabelExtra.textAlignment = .center
        questionLabelExtra.textColor = UIColor.white
        questionLabelExtra.layer.cornerRadius = 20
        questionLabelExtra.text = dateExtra[indexDateExtra[nExtra]] + " " + unitsExtra[indexDateExtra[nExtra]]

        self.navigationController?.view.addSubview(questionLabelExtra)

    }


    var nExtra = 0
    func nextQuestionExtra(i: Int) {
        if nExtra < 5 {
            let shake = Shake()
            if indexEventExtra[i] == indexDateExtra[nExtra] {
                switch i {
                case 0 : buttonFirstDateExtra.layer.backgroundColor = UIColor.green.cgColor
                case 1 : buttonSecondDateExtra.layer.backgroundColor = UIColor.green.cgColor
                case 2 : buttonThirdDateExtra.layer.backgroundColor = UIColor.green.cgColor
                case 3 : buttonFourthDateExtra.layer.backgroundColor = UIColor.green.cgColor
                case 4 : buttonFifthDateExtra.layer.backgroundColor = UIColor.green.cgColor
                case 5 : buttonSixthDateExtra.layer.backgroundColor = UIColor.green.cgColor
                default: print ("no selection")
                }
                nExtra = nExtra + 1
                if nExtra < 5 {
                    questionLabelExtra.text = dateExtra[indexDateExtra[nExtra]] + " " + unitsExtra[indexDateExtra[nExtra]]
                }else{
                    self.questionLabelExtra.text = "Well done!"
                    gameTimerExtra.invalidate()
                    credit = credit + 20
                    UserDefaults.standard.set(credit, forKey: "credit")
                    UIView.animate(withDuration: 5, animations: {
                        self.questionLabelExtra.transform = CGAffineTransform(scaleX: 0.01,y: 0.01)}, completion: {finished in self.completionAnimation()})
                }
            }else{
                errorCounterExtra = errorCounterExtra + 1
                switch i {
                case 0 : shake.shakeViewHorizontal(vw: buttonFirstDateExtra)
                case 1 : shake.shakeViewHorizontal(vw: buttonSecondDateExtra)
                case 2 : shake.shakeViewHorizontal(vw: buttonThirdDateExtra)
                case 3 : shake.shakeViewHorizontal(vw: buttonFourthDateExtra)
                case 4 : shake.shakeViewHorizontal(vw: buttonFifthDateExtra)
                case 5 : shake.shakeViewHorizontal(vw: buttonSixthDateExtra)
                default: print ("no selection")
                }
            }
        }
    }
    
    @IBAction func actionbuttonFirstDateExtra(_ sender: Any) {
        nextQuestionExtra(i: 0)
    }
    @IBAction func actionButtonSecondDateExtra(_ sender: Any) {
        nextQuestionExtra(i: 1)
    }
    @IBAction func actionButtonThirdDateExtra(_ sender: Any) {
        nextQuestionExtra(i: 2)
    }
    @IBAction func actionButtonFourthDateExtra(_ sender: Any) {
        nextQuestionExtra(i: 3)
    }
    @IBAction func actionButtonFifthDateExtra(_ sender: Any) {
        nextQuestionExtra(i: 4)
    }
    @IBAction func actionButtonSixthDateExtra(_ sender: Any) {
        nextQuestionExtra(i: 5)
    }
    func completionAnimation() {
        nExtra = 0
        
        timerExtra = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(displayList), userInfo: nil, repeats: true)
        self.questionLabelExtra.isHidden = true

    }
    @objc func displayList() {
        
        if nExtra == 0 {
            labelFirstDateExtra.isHidden = false
            firstEventExtra.isHidden = false
            labelFirstDateExtra.text = dateExtra[0] + " " + unitsExtra[0]
            firstEventExtra.text = eventExtra[0]
        }
        if nExtra == 1 {
            labelSecondDateExtra.isHidden = false
            labelSecondEventExtra.isHidden = false
            labelSecondDateExtra.text = dateExtra[1] + " " + unitsExtra[1]
            labelSecondEventExtra.text = eventExtra[1]
        }
        if nExtra == 2 {
            labelThirdDateExtra.isHidden = false
            labelThirdEventExtra.isHidden = false
            labelThirdDateExtra.text = dateExtra[2] + " " + unitsExtra[2]
            labelThirdEventExtra.text = eventExtra[2]
        }
        if nExtra == 3 {
            labelFourthDateExtra.isHidden = false
            labelFourthEventExtra.isHidden = false
            labelFourthDateExtra.text = dateExtra[3] + " " + unitsExtra[3]
            labelFourthEventExtra.text = eventExtra[3]
        }
        if nExtra == 4 {
            labelFifthDateExtra.isHidden = false
            labelFifthEventExtra.isHidden = false
            labelFifthDateExtra.text = dateExtra[4] + " " + unitsExtra[4]
            labelFifthEventExtra.text = eventExtra[4]
        }
        if nExtra > 4 {
            timerExtra.invalidate()
            showSuccessAlertExtra()
            
        }
        nExtra = nExtra + 1
    }
    var counterExtra = 60
    @objc func chronometerExtra() {
        let labelAndButtonDisplay = toDisplayButtonsAndLabelsExtra()
        counterExtra = counterExtra - 1
        timerLabelExtra.text = String(counterExtra)
        
        if counterExtra == 0 || errorCounterExtra > 1{
            gameTimerExtra.invalidate()

            labelAndButtonDisplay.stopQuiz()
            if counterExtra == 0{
                showAlertTimeOverExtra()
                
            }else{
                showAlert2errorsExtra()
            }
        }

        
    }
    func showAlert2errorsExtra () {
        let alert = UIAlertController(title: "Sorry Game Over!", message: "You had two wrong answers", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Try again, its Free!", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in self.tryAgainExtra()}))
        alert.addAction(UIAlertAction(title: "Go Back to Quiz Menu", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in self.goBackToQuizMenusExtra()}))
        self.present(alert, animated: true, completion: nil)
    }
    func showAlertTimeOverExtra () {
        let alert = UIAlertController(title: "Sorry Game Over!", message: "You ran out of time", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Try again, its Free!", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in self.tryAgainExtra()}))
        alert.addAction(UIAlertAction(title: "Go Back to Quiz Menu", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in self.goBackToQuizMenusExtra()}))
        self.present(alert, animated: true, completion: nil)
    }
    func showSuccessAlertExtra () {
        let alert = UIAlertController(title: "Great Job! You have gained 20 credits", message: "\(selectedSubjectExtra) will be added to your knowledge list", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Go Back to Quiz Menu", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in self.goBackToQuizMenusExtra()}))
        self.present(alert, animated: true, completion: nil)
    }
    
    func tryAgainExtra() {
        nExtra = 0
        errorCounterExtra = 0
        counterExtra = 60
        let historicalData = HistoricalData(questionGroup: selectedSubjectExtra)
        dateExtra = historicalData.date
        eventExtra = historicalData.event
        unitsExtra = historicalData.units
        let randomizeQuestion = RandomizeQuestion(date: dateExtra, event: eventExtra)
        indexDateExtra = randomizeQuestion.generateDateIndex(from: 0, to: dateExtra.count - 1, quantity: nil)
        //indexEventExtra = randomizeQuestion.generateEventIndex(from: 0, to: eventExtra.count - 1, quantity: nil)
        let labelAndButtonDisplay = toDisplayButtonsAndLabelsExtra()
        timerLabelExtra.isHidden = false
        print(creditExtra)
        print(credit)
        labelAndButtonDisplay.buttonFormat(event: eventExtra, indexEvent: indexEventExtra)
        labelAndButtonDisplay.labelFormat()
        labelAndButtonDisplay.allShown()
        labelAndButtonDisplay.startQuizExtra()
        buttonCreditExtra.setTitle("credits: \(creditExtra)", for: .normal)
        
        gameTimerExtra = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(chronometerExtra), userInfo: nil, repeats: true)
        labelFirstDateExtra.text = dateExtra[0] + " " + unitsExtra[0]
        labelSecondDateExtra.text = dateExtra[1] + " " + unitsExtra[1]
        labelThirdDateExtra.text = dateExtra[2] + " " + unitsExtra[2]
        labelFourthDateExtra.text = dateExtra[3] + " " + unitsExtra[3]
        labelFifthDateExtra.text = dateExtra[4] + " " + unitsExtra[4]
        
        //questionLabelExtra = UILabel(frame: CGRect(origin: CGPoint(x: self.view.frame.width/2 - 150, y: self.view.frame.height/4 - 25), size: CGSize(width: 300, height: 100)))
        //questionLabelExtra.layer.backgroundColor = UIColor(red: 171/255, green: 203/255, blue: 235/255, alpha: 1.0).cgColor
        //questionLabelExtra.numberOfLines = 0
        //questionLabelExtra.lineBreakMode = .byWordWrapping
        //questionLabelExtra.font = UIFont.systemFont(ofSize: 25)
        //questionLabelExtra.textAlignment = .center
        //questionLabelExtra.textColor = UIColor.white
        //questionLabelExtra.layer.cornerRadius = 20
        questionLabelExtra.text = dateExtra[indexDateExtra[nExtra]] + " " + unitsExtra[indexDateExtra[nExtra]]
        
        self.navigationController?.view.addSubview(questionLabelExtra)
        //gameTimerExtra = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(chronometerExtra), userInfo: nil, repeats: true)
        
    }
    func goBackToQuizMenusExtra() {
        performSegue(withIdentifier: "unwindToMenu", sender: self)
    }
    func toDisplayButtonsAndLabelsExtra() ->  LabelAndButtonDisplay{
        let labelAndButtonDisplayExtra = LabelAndButtonDisplay(labelFirstEvent: firstEventExtra, labelSecondEvent: labelSecondEventExtra, labelThirdEvent: labelThirdEventExtra, labelFourthEvent: labelFourthEventExtra, labelFifthEvent: labelFifthEventExtra, labelFirstDate: labelFirstDateExtra, labelSecondDate: labelSecondDateExtra, labelThirdDate: labelThirdDateExtra, labelFourthDate: labelFourthDateExtra, labelFifthDate: labelFifthDateExtra, buttonFirstDate: buttonFirstDateExtra, buttonSecondDate: buttonSecondDateExtra, buttonThirdDate: buttonThirdDateExtra, buttonFourthDate: buttonFourthDateExtra, buttonFifthDate: buttonFifthDateExtra, buttonSixthDate: buttonSixthDateExtra, buttonCredits: buttonCreditExtra)
        return labelAndButtonDisplayExtra
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToMenu" {
            let controller =  segue.destination as! HitoricalTableViewController
        }
    }
 

}
