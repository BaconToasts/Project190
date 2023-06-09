//
//  StudentSettingsView.swift
//  Project190
//
//  Created by Luis Campos on 4/17/23.
//

import SwiftUI

struct StudentSettingsView: View{
    @Binding var showNextView: DisplayState
    
    @State var firstButton = "Main / Settings"
    @State var secondButton = "Change Password"
    @State var thirdButton = "Enable FaceID"
    @State var fourthButton = "Disable Bluetooth"
    @State var borderColor = Color.black
    @State var mainButtonColor = Color.black
    
    var body: some View{
        VStack{
            Button(action:{withAnimation{showNextView = .mainStudent}}){
                Text(firstButton).fontWeight(.bold).foregroundColor(.white).frame(width: 300, height: 20, alignment:.center)
            }
            .padding()
            .background(mainButtonColor)
            .cornerRadius(100)
            .padding(.bottom, 200)
            
            Button(action:{}){
                Text(secondButton).fontWeight(.bold).frame(width:300, height:20, alignment:.center).foregroundColor(.black)
            }
            .padding()
            .border(mainButtonColor, width: 5)
            .cornerRadius(6)
            .padding(.bottom, 10)
            
            Button(action:{}){
                Text(thirdButton).fontWeight(.bold).frame(width:300, height:20, alignment:.center).foregroundColor(.black)
            }
            .padding()
            .border(mainButtonColor, width: 5)
            .cornerRadius(6)
            .padding(.bottom, 10)

            Button(action:{}){
                Text(fourthButton).fontWeight(.bold).frame(width:300, height:20, alignment:.center).foregroundColor(.black)
            }
            .padding()
            .border(mainButtonColor, width: 5)
            .cornerRadius(6)
            .padding(.bottom, 300)

        }
    }
}

struct StudentSettingsView_Previews: PreviewProvider{
    @State static private var showNextView: DisplayState = .studentSettings
    static var previews: some View{
        StudentSettingsView(showNextView: $showNextView)
    }
}
