//
//  LanguageSelectViewController.swift
//  InAppLocalizationDemo
//
//  Created by janlionly on 2020/7/21.
//  Copyright © 2020 janlionly. All rights reserved.
//

import UIKit

enum LanguageItem: Int {
    case english
    case simplifiedChinese
    case hongKongChinese
    case french
    case japanese
    
    var languageCode: String {
        switch self {
        case .english:
            return "en"
        case .simplifiedChinese:
            return "zh-Hans"
        case .hongKongChinese:
            return "zh-HK"
        case .french:
            return "fr"
        case .japanese:
            return "ja"
        }
    }
}

class LanguageSelectViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let languageItem = LanguageItem(rawValue: indexPath.item) else {
            return
        }
        let ctrl = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
        
        InAppLocalization.shared().setCurrentLanguageCode(languageItem.languageCode, reload: ctrl) { (view) in
            view.alpha = 0
        }
    }

}
