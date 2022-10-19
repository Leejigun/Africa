//
//  CreditsView.swift
//  Africa
//
//  Created by bimo.ez on 2022/10/19.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
            Copyright © Robert Petras
            All right reserved
            Better App ♡ Less Code
            """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        }
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
    }
}
