//
//  ThemeScreen.swift
//  ToDo SwiftUI
//
//  Created by Batuhan Berk Ertekin on 23.06.2024.
//

import SwiftUI

struct ThemeScreen: View {
    
    var scheme : ColorScheme
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
    @Namespace private var animation
    @State private var circleOffSet : CGSize
    

    init(scheme : ColorScheme){
        self.scheme = scheme
        let isDark =  scheme == .dark
        self._circleOffSet = .init(initialValue: CGSize(width: isDark ? 30 : 150 , height: isDark ?  -25 : 150))
    }
    
    var body: some View{
        
        VStack(spacing: 15){
            Circle().fill(userTheme.color(scheme).gradient)
                .frame(width: 150,height: 150)
                .mask({
                    Rectangle().overlay{
                        Circle().offset(circleOffSet)
                            .blendMode(.destinationOut)
                    }
                })
            
            Text("Choose a Style").font(.title2.bold()).padding(.top,25)
            
            Text("Pop or subtle, Day or night. \nCustomize your interface.").multilineTextAlignment(.center)
            
            HStack(spacing : 0){
                
                ForEach(Theme.allCases, id: \.rawValue){ theme in
                    Text(theme.rawValue).padding(.vertical,10).frame(width: 100).background{
                        ZStack{
                            if userTheme == theme {
                                Capsule().fill(.white).matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                            }
                              
                        }  .animation(.snappy,value: userTheme)
                    }.contentShape(.rect).onTapGesture {
                        userTheme = theme
                    }
                }
                
                
            }.padding(3)
                .background(Color.primary.opacity(0.06), in: .capsule).padding(.top,20)
        }
        
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .frame(height: 410)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 30))
        .padding(.horizontal,15)
       
        .cornerRadius(12.0)
        .padding()
        .environment(\.colorScheme,scheme)
        .onChange(of: scheme, initial: false) { _, newValue in
        
            let isDark = newValue == .dark
            withAnimation(.bouncy){
                circleOffSet = CGSize(width: isDark ? 30 : 150, height: isDark ? -25 : 150)
            }
        }
        
        
        }
}

#Preview {
    SettingsView()
}

enum Theme : String , CaseIterable {
    case systemDefault = "Default"
    case light = "Light"
    case dark = "Dark"
    
    func color(_ scheme : ColorScheme) -> Color {
        switch self {
        case .systemDefault:
            return scheme == .dark ? .blue : .orange
        case .light:
            return .orange
        case .dark:
            return .blue
        }
    }
    var colorScheme : ColorScheme? {
        switch self {
        case .systemDefault:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
        
    }
}
