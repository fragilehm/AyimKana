//
//  MessageComposer.swift
//  MFMessageDemo
//
//  Created by ITLabAdmin on 10/21/17.
//  Copyright © 2017 ITLabAdmin. All rights reserved.
//

import Foundation
import MessageUI

var textMessageRecipients = [String].init(repeating: "", count: 4)

class MessageComposer: NSObject, MFMessageComposeViewControllerDelegate {
   
    // MFMessageComposeViewControllerDelegate callback - dismisses the view controller when the user is finished with it
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        controller.dismiss(animated: true, completion: nil)
    }
    
    // A wrapper function to indicate whether or not a text message can be sent from the user's device
    func canSendText() -> Bool {
        return MFMessageComposeViewController.canSendText()
    }
    
    // Configures and returns a MFMessageComposeViewController instance
    func configuredMessageComposeViewController() -> MFMessageComposeViewController {
        let messageComposeVC = MFMessageComposeViewController()
        messageComposeVC.messageComposeDelegate = self
        messageComposeVC.recipients = textMessageRecipients
        messageComposeVC.body = ""
        return messageComposeVC
    }
    func setNumbers(numbers: [String]){
        for (index, number) in numbers.enumerated() {
            textMessageRecipients[index] = "\(number)"
        }
        
    }
    
    
}
