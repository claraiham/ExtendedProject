//
//  LiveView.swift
//  JO-PARIS-2024
//
//  Created by Hamza on 21/06/2023.


import SwiftUI
import WebKit
import MediaPlayer
import AudioToolbox

struct LiveView: View {
    
    let ids = ["www.youtube.com/watch?v=wfzx6IK4v8w","www.youtube.com/watch?v=Ge-vsGOnsPs","www.youtube.com/watch?v=glv8VupnUnc"]
    
    let id2 = ["www.youtube.com/watch?v=P-CB-crOioI&t=2s","www.youtube.com/watch?v=A3rkngDMc90","www.youtube.com/watch?v=6if87wCZfAA","www.youtube.com/watch?v=NjIU8lSNTy4","www.youtube.com/watch?v=McMpFs2Hdxk","www.youtube.com/watch?v=Xv4F8NevHwM"]
    
    @State private var selectFilter = 0
        
        init() {
            UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("Apache"))
        }
    
    var body: some View {
        
        ZStack {
            VStack {
                
                VStack {
                    
//                    Masquer le Picker
                    /*
                    Picker("Choix de la catégorie", selection: $selectFilter) {
                        Text("Live").tag(0)
                        Text("Mes vidéos").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .padding(4)
                    .background(Color("Pearl Bush"))
                    
                    Spacer()
                    
                    if selectFilter == 0 {
                        */
                        VStack{
                            Text("Live")
                                .font(Font.custom("Paris2024-Variable", size: 24))
                                .foregroundColor(Color(red: 1, green: 0, blue: 0.23))
                                .padding(.horizontal, 15)
                            
                            
                        }
                        
                        ScrollView(.horizontal){
                            HStack {
                                ForEach(ids, id:\.self) { idData in
                                    VideoStreamingView(videoId: idData)
                                        .frame(width: UIScreen.main.bounds.width - 40, height: 200)
                                        .cornerRadius(20)
                                        .shadow(radius: 10)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 10)
                                }
                            }
                        }
                        .padding(.bottom, 8)
                        VStack {
//                            CollectionView()
                            Text("Temps Forts")
                                .font(Font.custom("Paris2024-Variable", size: 24))
                                .foregroundColor(Color(red: 1, green: 0, blue: 0.23))
                                .padding(.horizontal, 15)
                            
                            ScrollView(){
                                ForEach(id2, id:\.self) { idData in
                                    VideoStreamingView(videoId: idData)
                                        .frame(width: UIScreen.main.bounds.width - 40, height: 200)
                                        .cornerRadius(20)
                                        .shadow(radius: 10)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 10)
                                }
                            }
                        }  // Fin de la VStack
                        /*
                    } else if selectFilter == 1 {
                        MyVideosView()
                        
                    } */
                    Spacer()
                }
            }
        }
    }
}
         
struct VideoStreamingView: UIViewRepresentable {
    let videoId: String
    
    func makeUIView(context: Context) ->  WKWebView {
        let webview = WKWebView()
        
        // URL Youtube
        if videoId.count <= 12 {
            guard let videoURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else { return webview }
            let request = URLRequest(url: videoURL, cachePolicy: .returnCacheDataElseLoad)
            webview.load(request)
            webview.scrollView.isScrollEnabled = false
            
            //           Autres URL
            
        } else {
            guard let videoURL = URL(string: "https://\(videoId)") else { return webview }
            let request = URLRequest(url: videoURL, cachePolicy: .returnCacheDataElseLoad)
            webview.load(request)
            webview.scrollView.isScrollEnabled = false
        }
        return webview
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { }
}

/*
struct CollectionView: View {
    @State private var selectFilter = 0
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("Apache"))
    }
    var body: some View {
        NavigationView{
            
            VStack{
                Text("Live")
                    .font(Font.custom("Paris2024-Variable", size: 24))
                    .foregroundColor(Color(red: 1, green: 0, blue: 0.23))
                    .padding(.horizontal, 15)
                
                
            } // Fin de VStack
        }
    }
}
*/

struct LiveView_Previews: PreviewProvider {
    static var previews: some View {
        LiveView()
    }
}


/* --------  Tuto  --------
 
 A étudier : https://mia-e.medium.com/how-to-add-a-video-player-in-your-swiftui-app-using-avkit-beginner-tutorial-ffce69af486
 
 */
