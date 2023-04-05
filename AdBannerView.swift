//
//  AdBannerView.swift
//  Metrobrome
//
//  Created by Maxwell Tolan on 3/28/23.
//

import Foundation
import GoogleMobileAds
import SwiftUI
import AppTrackingTransparency
import AdSupport
struct AdBannerView: UIViewRepresentable {

    func requestIDFA() {
      ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
        // Tracking authorization completed. Start loading ads here.
        // loadAd()
      })
    }
                                                     
    func makeUIView(context: Context) -> GADBannerView {
        let banner = GADBannerView()
        banner.adSize = GADAdSizeFromCGSize(CGSize(width: 300, height: 50))
        DispatchQueue.global(qos: .background).async {
            GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "8965a2c4c7bd7d5056bbd8524a27e9f4" ]
//        banner.adUnitID = "ca-app-pub-3940256099942544/293473571"
        // TODO: replace with the unitID below once finished testing
        banner.adUnitID = "ca-app-pub-2268446036193224/8916186975"
            DispatchQueue.main.async {
                banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
                banner.load(GADRequest())
            }
        }
        
        print("Ran code to load ad")
        return banner
    }

    func updateUIView(_ uiView: GADBannerView, context: Context) {}
}
