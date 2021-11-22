//
//  QuizView.swift
//  Review Center
//
//  Created by John Rovic Lalusin on 11/16/21.
//

import SwiftUI
import AVFoundation


private var ans_current_img_top_lvl_a = ""
private var ans_ans_top_lvl_a = ""
private var ans_letter_top_lvl_a = ""

private var ans_current_img_top_lvl_b = ""
private var ans_ans_top_lvl_b = ""
private var ans_letter_top_lvl_b = ""

private var ans_current_img_top_lvl_c = ""
private var ans_ans_top_lvl_c = ""
private var ans_letter_top_lvl_c = ""

private var ans_current_img_top_lvl_d = ""
private var ans_ans_top_lvl_d = ""
private var ans_letter_top_lvl_d = ""


private var questionPrevID = 0


var audioPlayer: AVAudioPlayer?
var player: AVPlayer?


struct QuizView: View {
    
    @Binding var categoryValue: String
    @State var models: [QuestionsResponseModel] = []
    @State private var score = 0
    @State private var items = 0
    @State private var percentage = 0
    
    var body: some View {
        
        
        ScrollView {
            VStack {
                ForEach(self.models) { (model) in
                    VStack() {
                        VStack(alignment: .center) {
                            
                            HStack() {
                                Text("SCORE: " + String(score) + "/" + String(items))
                                Text(" [ " + String(percentage) + "% ]")
                            }
                            .padding(.vertical)
                            
                            
                            Text(model.question_text!)
                                .font(.system(size: 20))
                                .padding(.bottom)
                                .padding(.top)
                                .frame(width: 769)
                            
                            if model.question_img != nil {
                                VStack(alignment: .center) {
                                ImageView(imageUrl: model.question_img!)
                                    .clipped()
                                    .cornerRadius(8)
                                    .frame(width: 169, height: 169)
                                    .background(Color(NSColor.separatorColor))
                                }.frame(minWidth: 888,
                                        maxWidth: .infinity,
                                        minHeight: 169,
                                        maxHeight: 169)
                                .padding(.bottom)
                            }
                        
                        
                            Button(action: {
                                checkCorrectAns(myAns: "a", correctAns: model.ans_correct!)
                            }) {
                                ansViewA()
                            }.buttonStyle(PlainButtonStyle()).foregroundColor(.white)
                            .padding(.bottom)
                            .onAppear() {
                                questionPrevID = Int(model.id!) ?? 0
                                
                                ans_current_img_top_lvl_a = ""
                                ans_ans_top_lvl_a = ""
                                ans_letter_top_lvl_a = ""
                                
                                if (model.ans_a_img != nil) {
                                    ans_current_img_top_lvl_a = model.ans_a_img!
                                }
                                ans_ans_top_lvl_a = model.ans_a!
                                ans_letter_top_lvl_a = "A"
                            }
                            
                            Button(action: {
                                    checkCorrectAns(myAns: "b", correctAns: model.ans_correct!)
                            }) {
                                ansViewB()
                            }.buttonStyle(PlainButtonStyle()).foregroundColor(.white)
                            .padding(.bottom)
                            .onAppear() {
                                
                                ans_current_img_top_lvl_b = ""
                                ans_ans_top_lvl_b = ""
                                ans_letter_top_lvl_b = ""
                                
                                if (model.ans_b_img != nil) {
                                    ans_current_img_top_lvl_b = model.ans_b_img!
                                }
                                ans_ans_top_lvl_b = model.ans_b!
                                ans_letter_top_lvl_b = "B"
                            }
                            
                            
                            Button(action: {
                                checkCorrectAns(myAns: "c", correctAns: model.ans_correct!)
                            }) {
                                ansViewC()
                            }.buttonStyle(PlainButtonStyle()).foregroundColor(.white)
                            .padding(.bottom)
                            .onAppear() {

                                ans_current_img_top_lvl_c = ""
                                ans_ans_top_lvl_c = ""
                                ans_letter_top_lvl_c = ""

                                if (model.ans_c_img != nil) {
                                    ans_current_img_top_lvl_c = model.ans_c_img!
                                }
                                ans_ans_top_lvl_c = model.ans_c!
                                ans_letter_top_lvl_c = "C"
                            }
                            

                            Button(action: {
                                checkCorrectAns(myAns: "d", correctAns: model.ans_correct!)
                            }) {
                                ansViewD()
                            }.buttonStyle(PlainButtonStyle()).foregroundColor(.white)
                            //.padding(.bottom)
                            .onAppear() {
                                
                                ans_current_img_top_lvl_d = ""
                                ans_ans_top_lvl_d = ""
                                ans_letter_top_lvl_d = ""
                                
                                if (model.ans_d_img != nil) {
                                    ans_current_img_top_lvl_d = model.ans_d_img!
                                }
                                ans_ans_top_lvl_d = model.ans_d!
                                ans_letter_top_lvl_d = "D"
                            }
                        }
                        .padding(.vertical)
                        
                    }.frame(width: .infinity)
                }.frame(minWidth: 888,
                        maxWidth: .infinity)
                
                HStack() {
                    Button(action: {
                        NewQuestionView(categoryValue: self.$categoryValue).frame(minWidth: 888, idealWidth: 888, maxWidth: .infinity,minHeight: 666, idealHeight: 666,maxHeight: .infinity).openInWindow(title: "New Question", sender: self)
                    }) {
                        Text("NEW QUESTION").font(.system(size: 14))
                            .padding().frame(width: 169, height: 20)
                    }.buttonStyle(LightSeaGreenButton()).foregroundColor(.white)
                    .padding(.vertical)
                    
                    Button(action: {
                        closeWindow()
                    }) {
                        Text("END REVIEW").font(.system(size: 14))
                            .padding().frame(width: 169, height: 20)
                    }.buttonStyle(SeaGreenButton()).foregroundColor(.white)
                    .padding(.vertical)
                }
                
            }.frame(width: .infinity).onAppear(perform: {
                nextQuestion()
            })
            .onDisappear() {
                logScore(logScore: String(score),logItem: String(items),logPercentage: String(percentage))
            }
        }
        
        
    }
    
    func logScore(logScore: String, logItem: String, logPercentage: String) {
        
        
        if logItem != "0" {
            let userDefaults = UserDefaults.standard
            var username = userDefaults.string(forKey: "savedAccount") ?? ""
            var password = userDefaults.string(forKey: "savedPass") ?? ""
            
            let myUrl = URL(string: PhpServer.server + "log_scores.php");
            
            var request = URLRequest(url:myUrl!)
            
            request.httpMethod = "POST"
            
            let postString = "username="+username+"&password="+password+"&logCategory="+categoryValue+"&logScore="+logScore+"&logItem="+logItem+"&logPercentage="+logPercentage;
            
            request.httpBody = postString.data(using: String.Encoding.utf8);
            
            let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
                
                if error != nil
                {
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                    
                    if let parseJSON = json {
                        
                        let responseValue = parseJSON["response"] as? String
                        print("responseValue: \(String(describing: responseValue))")
                        
                        if (responseValue == "Log created") {

                        }
                        else {
                           
                        }
                    }
                    
                } catch {
                }
            }
            task.resume()
        }
 
    }
    
    struct LightSeaGreenButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(Color(hex: "#20B2AA"))
                .foregroundColor(.white)
                //.clipShape(Capsule())
        }
    }
    
    struct SeaGreenButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(Color(hex: "#2E8B57"))
                .foregroundColor(.white)
                //.clipShape(Capsule())
        }
    }
    
    func loadRadio(radioURL: String) {
            guard let url = URL.init(string: radioURL) else { return }
            let playerItem = AVPlayerItem.init(url: url)
            player = AVPlayer.init(playerItem: playerItem)
            player?.play()
    }
    
    func checkCorrectAns(myAns: String, correctAns: String) {
        items = items + 1
        if myAns == correctAns {
            score = score + 1
            if (score % 2 == 0) {
                loadRadio(radioURL:  PhpServer.server + "72657669657763656e74657266696c6573/736678/sfx_correct_1.wav")
            }
            else {
                loadRadio(radioURL:  PhpServer.server + "72657669657763656e74657266696c6573/736678/sfx_correct_2.wav")
            }
        }
        else {
            if ((items - score) % 2 == 0) {
                loadRadio(radioURL:  PhpServer.server + "72657669657763656e74657266696c6573/736678/sfx_wrong_1.wav")
            }
            else {
                loadRadio(radioURL:  PhpServer.server + "72657669657763656e74657266696c6573/736678/sfx_wrong_2.wav")
            }
            
            let answer = dialogCorrectAns(question: "THE CORRECT ANSWER IS " + correctAns.uppercased(), text: "")
        }
        
        
        percentage = score * 100 / items
        nextQuestion()
    }
    
    
    func dialogOKCancel(question: String, text: String) -> Bool {
        let alert = NSAlert()
        alert.messageText = question
        alert.informativeText = text
        alert.alertStyle = .warning
        alert.addButton(withTitle: "OK")
        //alert.addButton(withTitle: "Cancel")
        return alert.runModal() == .alertFirstButtonReturn
    }
    
    func dialogCorrectAns(question: String, text: String) -> Bool {
        let alert = NSAlert()
        alert.messageText = question
        alert.informativeText = text
        alert.alertStyle = .warning
        alert.addButton(withTitle: "NEXT")
        //alert.addButton(withTitle: "Cancel")
        return alert.runModal() == .alertFirstButtonReturn
    }
    
    func closeWindow() {
        if items > 1 && items != 0 {
            if score > 1 {
                let answer = dialogOKCancel(question: String(percentage) + "%", text: String(score) + " Correct Answers out of " + String(items) + " Questions")
            }
            else {
                let answer = dialogOKCancel(question: String(percentage) + "%", text: String(score) + " Correct Answer out of " + String(items) + " Questions")
            }
        }
        else if items != 0 {
            let answer = dialogOKCancel(question: String(percentage) + "%", text: String(score) + " Correct Answer out of " + String(items) + " Question")
        }
        NSApplication.shared.keyWindow?.close()
    }
    
    func nextQuestion() {
        // send request to server

        guard let url: URL = URL(string: PhpServer.server + "questions.php") else {
            print("invalid URL")
            return
        }
        
        
        let userDefaults = UserDefaults.standard
        
        var username = userDefaults.string(forKey: "savedAccount") ?? ""
        var password = userDefaults.string(forKey: "savedPass") ?? ""

        let postString = "username="+username+"&password="+password+"&category="+categoryValue+"&questionprevid="+String(questionPrevID)

        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = postString.data(using: String.Encoding.utf8);
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            // check if response is okay

            guard let data = data else {
                print("invalid response")
                return
            }

            // convert JSON response into class model as an array
            do {
                self.models = try JSONDecoder().decode([QuestionsResponseModel].self, from: data)
            } catch {
                print(error.localizedDescription)
            }

        }).resume()
    }
    
}

extension Color {
    init(hex string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }

        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }

        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }

        // Scanner creation
        let scanner = Scanner(string: string)

        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        if string.count == 2 {
            let mask = 0xFF

            let g = Int(color) & mask

            let gray = Double(g) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)

        } else if string.count == 4 {
            let mask = 0x00FF

            let g = Int(color >> 8) & mask
            let a = Int(color) & mask

            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)

        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)

        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)

        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
}

struct ansViewA: View {
    
    @State private var ans_current_img = ans_current_img_top_lvl_a
    @State private var ans_ans = ans_ans_top_lvl_a
    @State private var ans_letter = ans_letter_top_lvl_a
    
    var body: some View {
        if ans_current_img != "" {
                HStack() {
                    Text(ans_letter+".").font(.system(size: 16))
                        .frame(width: 100)
                        .padding()
                    if(ans_ans != "") {
                        HStack() {
                            VStack() {
                                ImageView(imageUrl: ans_current_img)
                                    .clipped()
                                    //.cornerRadius(8)
                                    .frame(width: 80, height: 80)
                                    .background(Color(NSColor.separatorColor))
                                    .padding(6)
                            }.frame(width: 184.5)
                            Text(ans_ans).font(.system(size: 16))
                                .padding().frame(width: 384.5)
                        }.frame(width: 569)
                    }
                    else {
                            HStack() {
                                ImageView(imageUrl: ans_current_img)
                                    .clipped()
                                    //.cornerRadius(8)
                                    .frame(width: 80, height: 80)
                                    .background(Color(NSColor.separatorColor))
                                    .padding(6)
                            }.frame(width: 569)
                    }
                    Text("").font(.system(size: 16))
                        .frame(width: 100)
                        .padding()
                        
                }
                .frame(width: 769)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
        }
        else {
            HStack() {
                Text(ans_letter+".").font(.system(size: 16))
                    .frame(width: 100)
                    .padding()
                Text(ans_ans).font(.system(size: 16))
                    .padding()
                    .frame(width: 569)
                Text("").font(.system(size: 16))
                    .frame(width: 100)
                    .padding()
            }
            .frame(width: 769)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
        }
        
        HStack() {
            
        }.onAppear() {
            ans_current_img = ans_current_img_top_lvl_a
            ans_ans = ans_ans_top_lvl_a
            ans_letter = ans_letter_top_lvl_a
        }
        .onDisappear() {
            ans_current_img_top_lvl_a = ""
            ans_ans_top_lvl_a = ""
            ans_letter_top_lvl_a = ""
        }
    }
}

struct ansViewB: View {
    
    @State private var ans_current_img = ans_current_img_top_lvl_b
    @State private var ans_ans = ans_ans_top_lvl_b
    @State private var ans_letter = ans_letter_top_lvl_b
    
    var body: some View {
        if ans_current_img != "" {
                HStack() {
                    Text(ans_letter+".").font(.system(size: 16))
                        .frame(width: 100)
                        .padding()
                    if(ans_ans != "") {
                        HStack() {
                            VStack() {
                                ImageView(imageUrl: ans_current_img)
                                    .clipped()
                                    //.cornerRadius(8)
                                    .frame(width: 80, height: 80)
                                    .background(Color(NSColor.separatorColor))
                                    .padding(6)
                            }.frame(width: 184.5)
                            Text(ans_ans).font(.system(size: 16))
                                .padding().frame(width: 384.5)
                        }.frame(width: 569)
                    }
                    else {
                            HStack() {
                                ImageView(imageUrl: ans_current_img)
                                    .clipped()
                                    //.cornerRadius(8)
                                    .frame(width: 80, height: 80)
                                    .background(Color(NSColor.separatorColor))
                                    .padding(6)
                            }.frame(width: 569)
                    }
                    Text("").font(.system(size: 16))
                        .frame(width: 100)
                        .padding()
                        
                }
                .frame(width: 769)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
        }
        else {
            HStack() {
                Text(ans_letter+".").font(.system(size: 16))
                    .frame(width: 100)
                    .padding()
                Text(ans_ans).font(.system(size: 16))
                    .padding()
                    .frame(width: 569)
                Text("").font(.system(size: 16))
                    .frame(width: 100)
                    .padding()
            }
            .frame(width: 769)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
        }
        
        HStack() {
            
        }.onAppear() {
            ans_current_img = ans_current_img_top_lvl_b
            ans_ans = ans_ans_top_lvl_b
            ans_letter = ans_letter_top_lvl_b
        }
        .onDisappear() {
            ans_current_img_top_lvl_b = ""
            ans_ans_top_lvl_b = ""
            ans_letter_top_lvl_b = ""
        }
    }
}

struct ansViewC: View {
    
    @State private var ans_current_img = ans_current_img_top_lvl_c
    @State private var ans_ans = ans_ans_top_lvl_c
    @State private var ans_letter = ans_letter_top_lvl_c
    
    var body: some View {
        if ans_current_img != "" {
                HStack() {
                    Text(ans_letter+".").font(.system(size: 16))
                        .frame(width: 100)
                        .padding()
                    if(ans_ans != "") {
                        HStack() {
                            VStack() {
                                ImageView(imageUrl: ans_current_img)
                                    .clipped()
                                    //.cornerRadius(8)
                                    .frame(width: 80, height: 80)
                                    .background(Color(NSColor.separatorColor))
                                    .padding(6)
                            }.frame(width: 184.5)
                            Text(ans_ans).font(.system(size: 16))
                                .padding().frame(width: 384.5)
                        }.frame(width: 569)
                    }
                    else {
                            HStack() {
                                ImageView(imageUrl: ans_current_img)
                                    .clipped()
                                    //.cornerRadius(8)
                                    .frame(width: 80, height: 80)
                                    .background(Color(NSColor.separatorColor))
                                    .padding(6)
                            }.frame(width: 569)
                    }
                    Text("").font(.system(size: 16))
                        .frame(width: 100)
                        .padding()
                        
                }
                .frame(width: 769)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
        }
        else {
            HStack() {
                Text(ans_letter+".").font(.system(size: 16))
                    .frame(width: 100)
                    .padding()
                Text(ans_ans).font(.system(size: 16))
                    .padding()
                    .frame(width: 569)
                Text("").font(.system(size: 16))
                    .frame(width: 100)
                    .padding()
            }
            .frame(width: 769)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
        }
        
        HStack() {
            
        }.onAppear() {
            ans_current_img = ans_current_img_top_lvl_c
            ans_ans = ans_ans_top_lvl_c
            ans_letter = ans_letter_top_lvl_c
        }
        .onDisappear() {
            ans_current_img_top_lvl_c = ""
            ans_ans_top_lvl_c = ""
            ans_letter_top_lvl_c = ""
        }
    }
}

struct ansViewD: View {
    
    @State private var ans_current_img = ans_current_img_top_lvl_d
    @State private var ans_ans = ans_ans_top_lvl_d
    @State private var ans_letter = ans_letter_top_lvl_d
    
    var body: some View {
        if ans_current_img != "" {
                HStack() {
                    Text(ans_letter+".").font(.system(size: 16))
                        .frame(width: 100)
                        .padding()
                    if(ans_ans != "") {
                        HStack() {
                            VStack() {
                                ImageView(imageUrl: ans_current_img)
                                    .clipped()
                                    //.cornerRadius(8)
                                    .frame(width: 80, height: 80)
                                    .background(Color(NSColor.separatorColor))
                                    .padding(6)
                            }.frame(width: 184.5)
                            Text(ans_ans).font(.system(size: 16))
                                .padding().frame(width: 384.5)
                        }.frame(width: 569)
                    }
                    else {
                            HStack() {
                                ImageView(imageUrl: ans_current_img)
                                    .clipped()
                                    //.cornerRadius(8)
                                    .frame(width: 80, height: 80)
                                    .background(Color(NSColor.separatorColor))
                                    .padding(6)
                            }.frame(width: 569)
                    }
                    Text("").font(.system(size: 16))
                        .frame(width: 100)
                        .padding()
                        
                }
                .frame(width: 769)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
        }
        else {
            HStack() {
                Text(ans_letter+".").font(.system(size: 16))
                    .frame(width: 100)
                    .padding()
                Text(ans_ans).font(.system(size: 16))
                    .padding()
                    .frame(width: 569)
                Text("").font(.system(size: 16))
                    .frame(width: 100)
                    .padding()
            }
            .frame(width: 769)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
        }
        
        HStack() {
            
        }.onAppear() {
            ans_current_img = ans_current_img_top_lvl_d
            ans_ans = ans_ans_top_lvl_d
            ans_letter = ans_letter_top_lvl_d
        }
        .onDisappear() {
            ans_current_img_top_lvl_d = ""
            ans_ans_top_lvl_d = ""
            ans_letter_top_lvl_d = ""
        }
    }
}

/*
struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
*/
