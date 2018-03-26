//
//  PurchaseCreditsController.swift
//  HistoricDatesQuiz
//
//  Created by Normand Martin on 18-01-06.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit
import StoreKit

class PurchaseCreditsController: UIViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var bagLabel: UILabel!
    @IBOutlet weak var treasureLabel: UILabel!
    @IBOutlet weak var totalCreditLabel: UILabel!
    @IBOutlet weak var constraintButtonCoin: NSLayoutConstraint!
    @IBOutlet weak var constraintButtonTreasure: NSLayoutConstraint!
    @IBOutlet weak var contraintButtonBundle: NSLayoutConstraint!
    
    @IBOutlet weak var constraintLeadCoinLabel: NSLayoutConstraint!
    @IBOutlet weak var constraintLeadBagLabel: NSLayoutConstraint!
    
    @IBOutlet weak var constraintLeadTreasureLabele: NSLayoutConstraint!
    var priceCoins = String()
    var priceBundle =  String()
    var priceTreasure =  String()
    var productID = ""
    var productsRequest = SKProductsRequest()
    var iapProducts = [SKProduct]()
    var credit: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAvailableProducts()
        let appleDelegate = AppDelegate()
        let orientation = appleDelegate.rotated()
        let screenSize = ScreenSize()
        if screenSize.identify().0 == "extraLarge"{
            constraintButtonCoin.constant = 280
            constraintButtonTreasure.constant = 280
            contraintButtonBundle.constant = 280
            constraintLeadCoinLabel.constant = 100
            constraintLeadBagLabel.constant = 100
            constraintLeadTreasureLabele.constant = 100
            
            coinLabel.font = screenSize.identify().11
            bagLabel.font = screenSize.identify().11
            treasureLabel.font = screenSize.identify().11
            totalCreditLabel.font = screenSize.identify().12
            if orientation {
                constraintButtonCoin.constant = 280
                constraintButtonTreasure.constant = 280
                contraintButtonBundle.constant = 280
            }
        }else if screenSize.identify().0 == "extraExtraLarge"{
            constraintButtonCoin.constant = 310
            constraintButtonTreasure.constant = 310
            contraintButtonBundle.constant = 310
            constraintLeadCoinLabel.constant = 100
            constraintLeadBagLabel.constant = 100
            constraintLeadTreasureLabele.constant = 100
            coinLabel.font = screenSize.identify().11
            bagLabel.font = screenSize.identify().11
            treasureLabel.font = screenSize.identify().11
            totalCreditLabel.font = screenSize.identify().12
            if orientation {
                constraintButtonCoin.constant = 310
                constraintButtonTreasure.constant = 310
                contraintButtonBundle.constant = 310
            }
        }else if screenSize.identify().0 == "extraExtraExtraLarge"{
            constraintButtonCoin.constant = 360
            constraintButtonTreasure.constant = 360
            contraintButtonBundle.constant = 360
            constraintLeadCoinLabel.constant = 100
            constraintLeadBagLabel.constant = 100
            constraintLeadTreasureLabele.constant = 100
            coinLabel.font = screenSize.identify().11
            bagLabel.font = screenSize.identify().11
            treasureLabel.font = screenSize.identify().11
            totalCreditLabel.font = screenSize.identify().12
            if orientation {
                constraintButtonCoin.constant = 360
                constraintButtonTreasure.constant = 360
                contraintButtonBundle.constant = 360
            }
        }
        credit = UserDefaults.standard.integer(forKey: "credit")
        totalCreditLabel.text = "Your have a total of \(credit) credits"
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goBackToTheQuiz" {
            _ = segue.destination as! ViewController
        }
    }
    func fetchAvailableProducts()  {
        // Put here your IAP Products ID's
        let productIdentifiers = NSSet(objects:  IAPProduct.coins.rawValue, IAPProduct.bundleCoins.rawValue, IAPProduct.treasure.rawValue)
        productsRequest = SKProductsRequest(productIdentifiers: productIdentifiers as! Set<String>)
        productsRequest.delegate = self
        productsRequest.start()
    }
     func productsRequest (_ request:SKProductsRequest, didReceive response:SKProductsResponse) {
        iapProducts = response.products
        let numberFormatter = NumberFormatter()
        numberFormatter.formatterBehavior = .behavior10_4
        numberFormatter.numberStyle = .currency
        let myCoins: SKProduct = response.products[1]  as SKProduct
        let myBundle: SKProduct = response.products[0]  as SKProduct
        let myTreasure: SKProduct = response.products[2]  as SKProduct
        if let price = numberFormatter.string(from: myCoins.price) {
            priceCoins = price
        }
        if let price = numberFormatter.string(from: myBundle.price) {
            priceBundle = price
        }
        if let price = numberFormatter.string(from: myTreasure.price) {
            priceTreasure = price
        }
        coinLabel.text = "Buy 200 Credits for \(priceCoins)"
        bagLabel.text = "Buy 500 Credits for \(priceBundle)"
        treasureLabel.text = "Buy 2000 Credits for \(priceTreasure)"
    }
    // MARK: - MAKE PURCHASE OF A PRODUCT
    func canMakePurchases() -> Bool {  return SKPaymentQueue.canMakePayments()  }
    
    func purchaseMyProduct(product: SKProduct) {
        if self.canMakePurchases() {
            let payment = SKPayment(product: product)
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)
            productID = product.productIdentifier
        } else {
            let alert = UIAlertController(title: "Learn History", message: "The purchase option is disabled on your device", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction:AnyObject in transactions {
            if let trans = transaction as? SKPaymentTransaction {
                switch trans.transactionState {
                case .purchased:
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    if productID ==  IAPProduct.coins.rawValue{
                        credit = UserDefaults.standard.integer(forKey: "credit")
                        credit = credit + 200
                        UserDefaults.standard.set(credit, forKey: "credit")
                        credit = UserDefaults.standard.integer(forKey: "credit")
                        totalCreditLabel.text = "Your have a total of \(credit) credits"
                    }else if productID ==  IAPProduct.bundleCoins.rawValue{
                        credit = UserDefaults.standard.integer(forKey: "credit")
                        credit = credit + 500
                        UserDefaults.standard.set(credit, forKey: "credit")
                        totalCreditLabel.text = "Your total credit amount is \(credit)"
                        totalCreditLabel.text = "Your have a total of \(credit) credits"
                    }else if productID ==  IAPProduct.treasure.rawValue {
                        credit = UserDefaults.standard.integer(forKey: "credit")
                        credit = credit + 2000
                        UserDefaults.standard.set(credit, forKey: "credit")
                        credit = UserDefaults.standard.integer(forKey: "credit")
                        totalCreditLabel.text = "Your have a total of \(credit) credits"
                    }
                case .failed:
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    break
                case .restored:
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    break
                    
                default: break
                }}}
    }
    
    @IBAction func actionCoinButton(_ sender: Any) {
        purchaseMyProduct(product: iapProducts[1])
    }
    @IBAction func actionBagButton(_ sender: Any) {
        purchaseMyProduct(product: iapProducts[0])
    }
    @IBAction func actionTreasureButton(_ sender: Any) {
        purchaseMyProduct(product: iapProducts[2])
    }
    @IBAction func OK(_ sender: Any) {
        performSegue(withIdentifier: "goBackToTheQuiz", sender: self)
    }
    
    
}
