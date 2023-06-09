//
//  StudentRequestView.swift
//
//
//  Created by user on 4/19/23.
//

import SwiftUI


struct TeacherAppView: View {
    @State var request: RequestData
    
    var body: some View {
        ZStack {
            Image(systemName:"applelogo")
                .frame(maxWidth:.infinity, alignment:.leading)
            
            Text(request.appName)
                .frame(maxWidth:.infinity, alignment:.center)
            HStack {
                Button(action:{ //Approve
                    request = RequestData(appName: request.appName, approved: ApproveStatus.approved)
                }) {
                    if(request.approved == ApproveStatus.approved) {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(.green)
                    }
                    else {
                        Image(systemName: "hand.thumbsup")
                            .foregroundColor(.green)
                    }
                }
                .buttonStyle(BorderlessButtonStyle())
                Button(action:{ //Deny
                    request = RequestData(appName: request.appName, approved: ApproveStatus.denied)
                }) {
                    if(request.approved == ApproveStatus.denied) {
                        Image(systemName: "hand.thumbsdown.fill")
                            .foregroundColor(.red)
                    }
                    else {
                        Image(systemName: "hand.thumbsdown")
                            .foregroundColor(.red)
                    }
                }
                .buttonStyle(BorderlessButtonStyle())
            }
            .frame(maxWidth:.infinity, alignment:.trailing)
        }
    }
}

//ApproveStatus and RequestData defined in StudentAppRequestView

struct TeacherAppRequestView: View {
    @State private var searchAppName: String = ""
    var userName = "User"
    
    @State var appList:[RequestData] = [
        RequestData(appName: "App 1", approved: ApproveStatus.unprocessed),
        RequestData(appName: "App 2", approved: ApproveStatus.approved),
        RequestData(appName: "App 3", approved: ApproveStatus.denied)
    ]
    
    var body: some View {
        VStack {
            Text("MAIN / MANAGE USERS / " + userName)
                .textCase(.uppercase)
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(5)
                .padding(.top, 8)
                .padding(.bottom, 40)
            
            Text("App Requests")
                .padding(.bottom, 5)
            TextField(
                "Search",
                text: $searchAppName
            )
            .multilineTextAlignment(.center)
            .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth:1))
            .frame(maxWidth: UIScreen.main.bounds.size.width*0.75)
            
            List {
                ForEach(appList) { request in
                    if(searchAppName.isEmpty ||
                        request.appName.contains(searchAppName)) {
                        TeacherAppView(request: request)
                    }
                }
            }
            .overlay(RoundedRectangle(cornerRadius:10, style:.circular)
                .stroke(lineWidth:3))
            .frame(maxWidth: UIScreen.main.bounds.size.width*0.85,
                   maxHeight: UIScreen.main.bounds.size.height*0.7)
            
            Button(action: {}) {
                Text("Delete User")
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(25)
            }
            .padding(.top, 10)
        }
    }
}

struct TeacherAppRequestView_Previews: PreviewProvider {
    static var previews: some View {
        TeacherAppRequestView()
    }
}
