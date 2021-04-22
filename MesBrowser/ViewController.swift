//
//  ViewController.swift
//  MesBrowser
//
//  Created by Mesut Aygün on 22.04.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate  {

    @IBOutlet weak var nextButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nextButton.isEnabled = false
        backButton.isEnabled = false
        textField.delegate = self
        webView.navigationDelegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool)  {
        let urlString = "https://youtube.com"
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!)
        webView.load(request)
        textField.text = urlString
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
        nextButton.isEnabled = webView.canGoForward
    }
    
    //
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlString = textField.text!
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!)
        webView.load(request)
        textField.resignFirstResponder()
        return true
    }

    @IBAction func nextButtonClicked(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
            textField.text = webView.url?.absoluteString
        }
    }
    @IBAction func backButtonClicked(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
            textField.text = webView.url?.absoluteString
        }
    }
    
}

