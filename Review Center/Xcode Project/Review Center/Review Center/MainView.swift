//
//  MainView.swift
//  Review Center
//
//  Created by John Rovic Lalusin on 11/15/21.
//

import SwiftUI
import Combine
import Foundation

struct Lessons: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var course: String
    var image: String
}

struct MainView: View {

    var body: some View {
        LogIn().offset(x: 0, y: 7)
        Coverage()
    }
}

struct Coverage: View {
    @State var coverage = [
        Lessons(title: "Mathematics", course: "BSCpE, BSEE", image: "http://192.168.1.201:8888/reviewcenter/72657669657763656e74657266696c6573/7375626a65637473/Mathematics.jpg"),
        Lessons(title: "Engineering Science and Allied Subjects", course: "BSCpE, BSEE", image: "http://192.168.1.201:8888/reviewcenter/72657669657763656e74657266696c6573/7375626a65637473/EngineeringScienceandAlliedSubjects.jpg"),
        Lessons(title: "Computer Engineering Professional Subjects", course: "BSCpE", image: "http://192.168.1.201:8888/reviewcenter/72657669657763656e74657266696c6573/7375626a65637473/ComputerEngineeringProfessionalSubjects.jpg"),
        Lessons(title: "Electrical Engineering Professional Subjects", course: "BSEE", image: "http://192.168.1.201:8888/reviewcenter/72657669657763656e74657266696c6573/7375626a65637473/ElectricalEngineeringProfessionalSubjects.jpg"),
        Lessons(title: "Machine Design, Materials and Shop Practice", course: "BSME", image: "http://192.168.1.201:8888/reviewcenter/72657669657763656e74657266696c6573/7375626a65637473/MachineDesignMaterialsandShopPractice.jpg"),
        Lessons(title: "Power Plant Engineering", course: "BSME", image: "http://192.168.1.201:8888/reviewcenter/72657669657763656e74657266696c6573/7375626a65637473/PowerPlantEngineering.jpg"),
        Lessons(title: "Mathematics, Engineering Economics and Basic Engineering Sciences", course: "BSME", image: "http://192.168.1.201:8888/reviewcenter/72657669657763656e74657266696c6573/7375626a65637473/MathematicsEngineeringEconomicsandBasicEngineeringSciences.jpg")
    ]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                HStack {
                    Spacer()
                    VStack {
                        HStack {
                            Text("Engineering Review")
                                .font(.title3)
                                .foregroundColor(.secondary)
                            
                            Image(systemName: "chevron.down")
                                .font(.title3)
                                .foregroundColor(.secondary)
                            
                            Spacer()
                        }
                        
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(coverage, id: \.id) { Lessons in
                                CoverageView(Lessons: Lessons)
                                
                                
                            }
                        }
                    }
                    .padding()
                    Spacer()
                }
            }
            .background(Color(NSColor.controlBackgroundColor))
            
        }
        .frame(maxHeight: .infinity)
    }
}

struct LogIn: View {
    @State private var statusGlobal = ""
    
    init() {
        self.logInFunc(username: username, password: password)
    }
    
    @State private var username = ""
    @State private var password = ""
    @Environment(\.openURL) var openURL
    @State private var hasTimeElapsed = false
    @State private var showAlertLogRequestTimeOut = false
    @State private var activeAccDisplay = "No Active Account"
    @State private var showLogOut = false
    
    var body: some View {
        HStack(spacing: 6) {
            
            
            Text(activeAccDisplay)
                .cornerRadius(10.0).frame(width: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(.white)
            Spacer()
            if showLogOut {
                Button(action: {
                    let defaults = UserDefaults.standard
                    defaults.set(nil, forKey: "savedAccount")
                    defaults.set(nil, forKey: "savedPass")
                    showLogOut = false
                    activeAccDisplay = "No Active Account"
                }) {
                      Text("Log Out").font(.headline).shadow(radius: 10.0, x: 20, y: 10)
              }.foregroundColor(.pink).background(Color.white).cornerRadius(10.0).frame(alignment: .center).padding(.trailing, 12)
            }
            else {
                TextField("User Name", text:self.$username)
                    .background(Color.black)
                    .cornerRadius(10.0).frame(width: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                SecureField("Password", text: self.$password)
                    .background(Color.black)
                    .cornerRadius(10.0).frame(width: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Button(action: {
                  self.logInFunc(username: username, password: password)
                  /*DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                      print(statusGlobal)
                  }
                  print(statusGlobal)*/
                }) {
                      Text("Sign In").font(.headline).shadow(radius: 10.0, x: 20, y: 10)
              }.foregroundColor(.pink).background(Color.white).cornerRadius(10.0).frame(alignment: .center).padding(.trailing, 12)
            }
        }.onAppear() {
            let userDefaults = UserDefaults.standard
            let savedAccount = userDefaults.string(forKey: "savedAccount")
            if (savedAccount != nil) {
                activeAccDisplay = savedAccount!
                showLogOut = true
            }
        }
        .frame(height: 32)
        //.background(EffectsView(material: NSVisualEffectView.Material.sidebar, blendingMode: NSVisualEffectView.BlendingMode.behindWindow))
        .background(Color.pink)
    }
    
    
    func logInFunc(username:String, password:String){
        
        let myUrl = URL(string: PhpServer.server + "login.php");
        
        if (username == "" || password == "") {
            statusGlobal = "incomplete details";
        }
        else {
            
            do {
                
                let userDefaults = UserDefaults.standard
                var savedAccount = userDefaults.string(forKey: "savedAccount")
                var savedPass = userDefaults.string(forKey: "savedPass")
                if (savedAccount != nil) {
    //                print(savedAccount! + " " + savedPass!)
                }
                else {
    //                print("null")
                }
            }
            catch{
    //            print("Error")
                
            }
                    

                    
                    var request = URLRequest(url:myUrl!)
                    
                    request.httpMethod = "POST"// Compose a query string
                    
                    let postString = "username="+username+"&password="+password;
                    
                    request.httpBody = postString.data(using: String.Encoding.utf8);
                    
                    let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
                        
                        if error != nil
                        {
    //                        print("error=\(error)")
                            return
                        }
                        
                        // You can print out response object
    //                    print("response = \(response)")
               
                        //Let's convert response sent from a server side script to a NSDictionary object:
                        
                        do {
                            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                            
                            if let parseJSON = json {
                                
                                // Now we can access value of First Name by its key
                                let responseValue = parseJSON["response"] as? String
                                print("responseValue: \(String(describing: responseValue))")
                                
                                if (responseValue == "Log In Successful!") {
                                    statusGlobal = "Account Verified"
                                    showAlertLogRequestTimeOut = true
                                    
                                    let defaults = UserDefaults.standard
                                    defaults.set(username, forKey: "savedAccount")
                                    defaults.set(password, forKey: "savedPass")
                                    
                                    self.activeAccDisplay = username
                                    self.username = ""
                                    self.password = ""
                                    showLogOut = true

                                    
                                    
                                    
                                }
                                else {
                                    statusGlobal = "Log In Failed!"
                                    showAlertLogRequestTimeOut = true
                                    
                                    let defaults = UserDefaults.standard
                                    defaults.set(nil, forKey: "savedAccount")
                                    defaults.set(nil, forKey: "savedPass")
                                    
                                    
                                    self.activeAccDisplay = "No Active Account"
                                }
                            }
                            
                        } catch {
    //                        print(error)
                        }
                    }
                    task.resume()
            
        }
        
        do {
            sleep(1)
            if (statusGlobal != "") {
                let answer = dialogOKCancel(question: statusGlobal, text: "")
            }
            
        }
        
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
    
}

extension View {
    
    @discardableResult
    func openInWindow(title: String, sender: Any?) -> NSWindow {
        let controller = NSHostingController(rootView: self)
        let win = NSWindow(contentViewController: controller)
        win.contentViewController = controller
        win.title = title
        win.makeKeyAndOrderFront(sender)
        return win
    }
}

struct CoverageView: View {
    @State var Lessons: Lessons
    
    @State private var categoryValue : String = "HhA"
    
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(alignment: .center) {
            ImageView(imageUrl: Lessons.image)
                .clipped()
                .cornerRadius(8)
                .frame(width: 192, height: 192)
                .background(Color(NSColor.separatorColor))
            }.frame(minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 192,
                    maxHeight: .infinity)

            
            Text(Lessons.title)
                .lineLimit(1)
            Text(Lessons.course)
                .foregroundColor(.secondary)
        }.onTapGesture {
            let userDefaults = UserDefaults.standard
            var savedAccount = userDefaults.string(forKey: "savedAccount")
            var savedPass = userDefaults.string(forKey: "savedPass")
            if (savedAccount != nil) {
//                print(savedAccount! + " " + savedPass!)
                //let answer = dialogOKCancel(question: "1", text: "")
                
                categoryValue = Lessons.title
                
                QuizView(categoryValue: self.$categoryValue).frame(minWidth: 888, idealWidth: 888, maxWidth: .infinity,minHeight: 666, idealHeight: 666,maxHeight: .infinity).openInWindow(title: ""+Lessons.title, sender: self)
                
                    
                

                
            }
            else {
//                print("null")
                let answer = dialogOKCancel(question: "Log in first", text: "")
            }
            
         }
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
}

// image view
struct ImageView: View {
    @ObservedObject var remoteImageURL: RemoteImageURL
    
    init(imageUrl: String) {
        remoteImageURL = RemoteImageURL(imageURL: imageUrl)
    }
    
    var body: some View {
        Image(nsImage: NSImage(data: self.remoteImageURL.data) ?? NSImage())
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fill)
    }
}

class RemoteImageURL: ObservableObject {
    @Published var data = Data()
    
    // load our image URL
    init(imageURL: String) {
        //guard let url = URL(string: imageURL.replacingOccurrences(of: "http://", with: "https://")) else {
        guard let url = URL(string: imageURL) else {
            print("Invalid URL")
            return
        }
      
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let response = response {
                DispatchQueue.main.async {
                    self.data = data
                }
            }
        }.resume()
    }
}

// blur effect
struct EffectsView: NSViewRepresentable {
    var material: NSVisualEffectView.Material
    var blendingMode: NSVisualEffectView.BlendingMode

    func makeNSView(context: Context) -> NSVisualEffectView {
        let visualEffectView = NSVisualEffectView()
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
        visualEffectView.state = NSVisualEffectView.State.active
        return visualEffectView
    }

    func updateNSView(_ visualEffectView: NSVisualEffectView, context: Context) {
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
    }
    
    
    
}


extension Color {
    static var TextFieldBackground: Color {
        return Color(red: 220.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, opacity: 1.0)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

