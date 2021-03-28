//
//  EasyAlert.swift
//  
//
//  Created by Bryan Barreto on 27/03/21.
//

import UIKit

public protocol EasyAlertDelegate: UIViewController{
    func show(_ alert: UIAlertController)
}


public class EasyAlert {
    
    public typealias Completion = (() -> Void)?
    
    private let delegate: EasyAlertDelegate
    
    public init(delegate: EasyAlertDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Simple OK alert
    public func showMessageAlert(_ message: String, style title: AlertStyle, onDissmiss: Completion = nil){
        let alert = self.buildAlert(style: .alert)
        
        self.setAttributedText(at: .title, alert: alert, text: title.value, attributes: [
            .font:UIFont.systemFont(ofSize: 30)
        ])
        
        self.setAttributedText(at: .message, alert: alert, text: "\n" + message, attributes: [
            .font:UIFont.systemFont(ofSize: 17)
        ])
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            onDissmiss?()
        }))
        self.delegate.show(alert)
    }
    
    
    // MARK: - Confirmation alert
    public func showConfirmationAlert(title: String = "", message: String? = nil, okCompletion: Completion, cancelCompletion: Completion){
        let alert = self.buildAlert(style: .alert, title: title, message: message)
        self.buildAndAddAction(at: alert, title: "Ok", style: .default, completion: okCompletion)
        self.buildAndAddAction(at: alert, title: "Cancel", style: .cancel, completion: cancelCompletion)
        delegate.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Toast
    public func showToast(_ title: String, duration: Double = 2){
        let alert = self.buildAlert(style: .actionSheet)

        self.setAttributedText(at: .title, alert: alert, text: title, attributes: [
            .font:UIFont.systemFont(ofSize: 18),
        ])
        
        self.delegate.show(alert)
        
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + duration) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - helpers
    private func buildAlert(style: UIAlertController.Style, title: String? = nil, message: String? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        return alert
    }
    
    private func buildAndAddAction(at alert: UIAlertController, title: String, style: UIAlertAction.Style = .default, completion: Completion = nil) {
        let action = UIAlertAction(title: title, style: style) { _ in
            completion?()
        }
        alert.addAction(action)
    }
    
    private func setAttributedText(at: AlertAttributes, alert: UIAlertController, text: String, attributes: [NSAttributedString.Key: Any] = [.font:UIFont.systemFont(ofSize: 20)]){
        let attributedText = NSAttributedString(string: text, attributes: attributes)
        alert.setValue(attributedText, forKey: at.value)
    }
}
