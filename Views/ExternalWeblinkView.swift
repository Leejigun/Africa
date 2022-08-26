//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by bimo.ez on 2022/08/27.
//

import SwiftUI

struct ExternalWeblinkView: View {
    
    let animal: Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    if let url = URL(string: animal.link) {
                        Link(destination: url) {
                            Text(animal.name )
                        }
                    }
                }
                .foregroundColor(.accentColor)
            }
        }
    }
}

struct ExtermalWeblinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode(from: .animals) ?? []
    static var previews: some View {
        ExternalWeblinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
