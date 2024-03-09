//
//  FeaturesView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-10.
//

import SwiftUI

struct FeaturesView: View {
    var body: some View {
        VStack {
            Text("What would you like to\ndo right now?")
                .font(.system(size: 45).weight(.semibold))
                .multilineTextAlignment(.center)
            
            HStack(spacing: 45) {
                FeatureCard_PhotographyView()
                
                FeatureCard_OrganizingView()
            }
            
            HStack(spacing: 45) {
                FeatureCard_PlanningView()
                
                FeatureCard_SchedulingView()
            }
            .padding(.top, 50)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 20)
        .padding(.bottom, 50)
        .background(Color("Brown1"))
        .padding(.top)
    }
}

struct FeaturesView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturesView()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(ColorPalette())
    }
}
