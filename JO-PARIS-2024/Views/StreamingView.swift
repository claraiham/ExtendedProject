//
//  StreamingView.swift
//  JO-PARIS-2024
//
//  Created by M on 28/06/2023.
//


/*  Old - Travail de Manu
 import SwiftUI
 import WebKit
 import MediaPlayer
 import AudioToolbox
 
 struct StreamingView: View {
 var body: some View {
 VStack {
 CollectionView()
 }
 .navigationTitle("Qualifications aux JO")
 .navigationBarTitleDisplayMode(.inline)
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
 
 struct CollectionView: View {
 
 // Uniquement l'Id pour Youtube ; URL longue pour les autres plateformes de streaming
 let ids = ["qGAf6xsFFSs", "SINpbLxXNgw", "PbYny-d9lrw", "mYMuWTKHZus", "www.dailymotion.com/embed/video/x8ew4nz"]
 
 var body: some View {
 ScrollView(showsIndicators: false) {
 VStack {
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
 }
 }
 
 */


/*   Old - Recherche de Manu à ne pas supprimer
 
 import SwiftUI
 import AVKit
 
 (...)
 
 @State private var player: AVPlayer?
 var videoURL: String = "https://www.youtube.com/embed/SINpbLxXNgw"
 
 var body: some View {
 VideoPlayer(player: player, videoOverlay: {
 VStack {
 Spacer()
 HStack {
 Spacer()
 Text("Video en live")
 .foregroundColor(.white)
 .padding(10)
 }
 }
 })
 .onAppear {
 guard let url = URL(string: videoURL) else {
 return
 }
 player = AVPlayer(url: url)
 player?.play()
 }
 .onDisappear {
 player?.pause()
 }
 .frame(height: 400)
 }
 }
 */
