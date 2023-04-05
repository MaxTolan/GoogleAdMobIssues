//
//  NavigationExerciseMenu.swift
//  SquatCounter
//
//  Created by Maxwell Tolan on 3/18/22.
//

import SwiftUI
import AppTrackingTransparency
import AdSupport
import GoogleMobileAds
// TODO: create a menu that allows you to select the different workouts that are available

// In favor of unique weights for each workouts: if you do incline press first you're going to be a lot more fresh than if you put incline press last. Therefore it should be different numbers
// In favor of sharing the values between workouts: if you get significantly stronger on incline press, then you'll want to automatically have that progress shown in the other workouts.


struct ExerciseNavigation: View {
    func requestIDFA() {
        
        print("Google Mobile Ads SDK version: \(GADMobileAds.sharedInstance().sdkVersion)")

      ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
        // Tracking authorization completed. Start loading ads here.
        // loadAd()
          
      })
    }
    
    let dynamicLifts:[String] = []
        
        let fullBody = FullBodyWorkoutModel()
        let liftImage: [String : String] = ["Incline Bench" : "MetB Incline Press", "Shoulder Press" : "MetB Shoulder Press", "Lat Pulldown" : "MetB Lat Pulldown", "Single-Arm Row" : "MetB Single Arm Row" , "Squat" : "MetB Squat",  "Leg Curl" : "MetB Seated Leg Curl", "Quad Extension" : "MetB Quad Extension", "Lunge" : "MetB Lunges",  "Bulgarian Split Squat" : "MetB Bulgarian Split Squat", "Bench Press" : "MetB Bench Press" ]

    var body: some View {
        let dynamicLifts = ["Incline Bench", "Shoulder Press", "Lat Pulldown", "Single-Arm Row", "Squat", "Leg Curl", "Quad Extension", "Lunge", "Experimental"]
        
        if #available(iOS 16.0, *) {
            NavigationStack {
                VStack {
                    List(dynamicLifts, id: \.self) { lift in
                        let destinationVal = fullBody.returnDestinationBasedOnIfUnilateral(name: lift)
                        NavigationLink(destination:  destinationVal) {
                            HStack {
//                                Image(liftImage[lift] ?? "")
//                                    .resizable()
//                                    .frame(width: 30, height: 30)
                                Text(lift)
                            }
                        }
                    }
                    .navigationTitle("Select a lift")
                    let _ = requestIDFA()
                    AdBannerView().frame(height: 50)
                    
                    NavigationLink(destination: ExerciseSummary()) {
                        Text("Current Goals Summary")
                    }
                    .frame(width: 320, height: 50)
                }
            }
        } else {
            NavigationView{
                VStack {
                    
                    List(dynamicLifts, id: \.self) { lift in
                        let destinationVal = fullBody.returnDestinationBasedOnIfUnilateral(name: lift)
                        NavigationLink(destination:  destinationVal) {
                            VStack {
//                                Image(liftImage[lift] ?? "AppIcon").resizable()
//                                    .frame(width: 30, height: 30)
                                Text(lift)
                            }
                        }
                    }
                    .navigationTitle("Select a lift")
                    
                    AdBannerView().frame(height: 50)
                    
                    NavigationLink(destination: ExerciseSummary()) {Text("Current Goals Summary")}.frame(width: 320, height: 50)
                }
            }
        }
    }
}

struct ExerciseNavigation_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ExerciseNavigation()
                .previewDevice("iPhone 13")
//            ExerciseNavigation().previewDevice("iPad Pro (11-inch)")
            
        }
    }
}
