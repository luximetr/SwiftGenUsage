//
//  StartVC.swift
//  SwiftGenTest
//
//  Created by branderstudio on 4/8/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import UIKit

class StartVC: UIViewController {

  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var changeLanguageButton: UIButton!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var nextButton: UIButton!
  
//  private let localizator = Localizator(stringsFileName: L10n.Start.fileName)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(self, selector: #selector(localize), name: .appLanguageChanged, object: nil)

    // Assets tests
    
    imageView.image = Asset.Assets.add.image
    imageView.image = Asset.Assets.closeOrange.image
    imageView.image = Asset.Tutorial.tutorialArticlesRu.image
    
    // Colors tests
    
    
    view.backgroundColor = UIColor(named: ColorName.ColorsTXT.articleBody) // from .txt
    view.backgroundColor = ColorName.ColorsJSON.perano.color // from .json
    view.backgroundColor = ColorName.ColorsXML.kobi.color // from .xml
    view.backgroundColor = ColorName.ColorsCLR.greenSmoke.color // from .clr
    
    // Fonts tests
    
    label.font = UIFont(font: FontFamily.Montserrat.regular, size: 20)
    label.font = FontFamily.Montserrat.bold.font(size: 20)
    
    // Interface builder tests
    
    let mainStoryboard: UIStoryboard = StoryboardScene.Main.storyboard
    let mainStoryboardName: String = StoryboardScene.Main.storyboardName
    let startVC = StoryboardScene.Main.startVC.instantiate()
    
    
    print(mainStoryboard)
    print(mainStoryboardName)
    print(startVC)
    
    // JSON tests
    
//    let literBalanceResponse = JSONFiles.LiterBalanceResponse.json
//    print(literBalanceResponse)
    
    let socialNetworksResponseNetworks = JSONFiles.SocialNetworksResponse.networks
    let socialNetworksResponseTitle = JSONFiles.SocialNetworksResponse.title
    print(socialNetworksResponseNetworks)
    print(socialNetworksResponseTitle)
    
    // Plists tests
    
    print(PlistFiles.BaseURL.baseURL)
    
    print(PlistFiles.CurrentUser.name)
    print(PlistFiles.CurrentUser.surname)
    
    print(PlistFiles.Info.cfBundleName)
    
    // Strings tests
    
    print(L10n.SignUp.signUp)
    print(L10n.Start.ценаГрн("20"))
    print(L10n.Start.максимумDСимволов(5))
    
    localize()
  }
  
  @IBAction func didTapOnChangeLanguage(_ sender: Any) {
    let languages = AppSettings.shared.availableLanguages
    let currentLanguage = AppSettings.shared.currentAppLanguage
    if let newLanguage = languages.first(where: { $0.iso639_1Code != currentLanguage.iso639_1Code }) {
      AppSettings.shared.setAppLanguage(newLanguage)
    }
  }
  
  @objc
  private func localize() {
//    changeLanguageButton.setTitle(localizator.localizedString(L10n.Start.сменитьЯзык), for: .normal)
//    nextButton.setTitle(localizator.localizedString(L10n.Start.далее), for: .normal)
//    label.text = localizator.localizedString(L10n.Start.демо)
//    priceLabel.text = localizator.localizedString(L10n.Start.ценаГрн, "20")
//    print(localizator.localizedString(L10n.Start.максимумDСимволов, 21))
  }
  
  // Interface builder segues tests
  
  @IBAction func didTapOnNext(_ sender: Any) {
    perform(segue: StoryboardSegue.Main.showDetails)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch StoryboardSegue.Main(segue) {
    case .showDetails?: print("Show details segue")
    default: break
    }
  }

}

