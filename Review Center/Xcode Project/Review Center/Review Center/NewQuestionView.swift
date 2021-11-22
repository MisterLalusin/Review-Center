//
//  NewQuestionView.swift
//  Review Center
//
//  Created by John Rovic Lalusin on 11/18/21.
//

import SwiftUI
import AppKit

class Helper: ObservableObject {

    @Published var fieldBeingEdited: String = ""

    func changeField() {
        fieldBeingEdited = "Something else"
    }
}

struct NewQuestionView: View {
    
    @Binding var categoryValue: String
    @State private var category = ""
    @State private var question_text = ""
    @State private var question_img = ""
    @State private var question_type = ""
    @State private var ans_a = ""
    @State private var ans_b = ""
    @State private var ans_c = ""
    @State private var ans_d = ""
    @State private var ans_a_img = ""
    @State private var ans_b_img = ""
    @State private var ans_c_img = ""
    @State private var ans_d_img = ""
    @State private var ans_correct = ""
    var helper = Helper()
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .center) {
                    Text(String(question_text))
                        .font(.system(size: 20))
                        .padding(.bottom)
                        .padding(.top)
                        .frame(width: 769)
                }
                if question_img != "" && question_type == "wimage" || question_type == "wimage_answimage" || question_type == "wimage_answimagewotext" {
                    VStack(alignment: .center) {
                    ImageView(imageUrl: String(question_img))
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
                }) {
                    //ansViewANew()
                    
                    if ans_a_img != "" {
                        
                            HStack() {
                                Text("A.").font(.system(size: 16))
                                    .frame(width: 100)
                                    .padding()
                                if(ans_a != "") {
                                    HStack() {
                                        VStack() {
                                            ImageView(imageUrl: ans_a_img)
                                                .clipped()
                                                //.cornerRadius(8)
                                                .frame(width: 80, height: 80)
                                                .background(Color(NSColor.separatorColor))
                                                .padding(6)
                                        }.frame(width: 184.5)
                                        Text(ans_a).font(.system(size: 16))
                                            .padding().frame(width: 384.5)
                                    }.frame(width: 569)
                                }
                                else {
                                        HStack() {
                                            ImageView(imageUrl: ans_a_img)
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
                            Text("A.").font(.system(size: 16))
                                .frame(width: 100)
                                .padding()
                            Text(ans_a).font(.system(size: 16))
                                .padding()
                                .frame(width: 569)
                            Text("").font(.system(size: 16))
                                .frame(width: 100)
                                .padding()
                        }
                        .frame(width: 769)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                    }
                    
                    
                    
                }.buttonStyle(PlainButtonStyle()).foregroundColor(.white)
                .padding(.bottom)
                
                Button(action: {
                }) {
                    //ansViewBNew()
                    
                    if ans_b_img != "" {
                        
                            HStack() {
                                Text("B.").font(.system(size: 16))
                                    .frame(width: 100)
                                    .padding()
                                if(ans_b != "") {
                                    HStack() {
                                        VStack() {
                                            ImageView(imageUrl: ans_b_img)
                                                .clipped()
                                                //.cornerRadius(8)
                                                .frame(width: 80, height: 80)
                                                .background(Color(NSColor.separatorColor))
                                                .padding(6)
                                        }.frame(width: 184.5)
                                        Text(ans_b).font(.system(size: 16))
                                            .padding().frame(width: 384.5)
                                    }.frame(width: 569)
                                }
                                else {
                                        HStack() {
                                            ImageView(imageUrl: ans_b_img)
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
                            Text("B.").font(.system(size: 16))
                                .frame(width: 100)
                                .padding()
                            Text(ans_b).font(.system(size: 16))
                                .padding()
                                .frame(width: 569)
                            Text("").font(.system(size: 16))
                                .frame(width: 100)
                                .padding()
                        }
                        .frame(width: 769)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                    }
                    
                    
                }.buttonStyle(PlainButtonStyle()).foregroundColor(.white)
                .padding(.bottom)
                
                Button(action: {
                }) {
                    //ansViewCNew()
                    
                    if ans_c_img != "" {
                        
                            HStack() {
                                Text("C.").font(.system(size: 16))
                                    .frame(width: 100)
                                    .padding()
                                if(ans_c != "") {
                                    HStack() {
                                        VStack() {
                                            ImageView(imageUrl: ans_c_img)
                                                .clipped()
                                                //.cornerRadius(8)
                                                .frame(width: 80, height: 80)
                                                .background(Color(NSColor.separatorColor))
                                                .padding(6)
                                        }.frame(width: 184.5)
                                        Text(ans_c).font(.system(size: 16))
                                            .padding().frame(width: 384.5)
                                    }.frame(width: 569)
                                }
                                else {
                                        HStack() {
                                            ImageView(imageUrl: ans_c_img)
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
                            Text("C.").font(.system(size: 16))
                                .frame(width: 100)
                                .padding()
                            Text(ans_c).font(.system(size: 16))
                                .padding()
                                .frame(width: 569)
                            Text("").font(.system(size: 16))
                                .frame(width: 100)
                                .padding()
                        }
                        .frame(width: 769)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                    }
                    
                    
                }.buttonStyle(PlainButtonStyle()).foregroundColor(.white)
                .padding(.bottom)
                

                Button(action: {
                }) {
                    //ansViewDNew()
                    
                    if ans_d_img != "" {
                        
                            HStack() {
                                Text("D.").font(.system(size: 16))
                                    .frame(width: 100)
                                    .padding()
                                if(ans_d != "") {
                                    HStack() {
                                        VStack() {
                                            ImageView(imageUrl: ans_d_img)
                                                .clipped()
                                                //.cornerRadius(8)
                                                .frame(width: 80, height: 80)
                                                .background(Color(NSColor.separatorColor))
                                                .padding(6)
                                        }.frame(width: 184.5)
                                        Text(ans_d).font(.system(size: 16))
                                            .padding().frame(width: 384.5)
                                    }.frame(width: 569)
                                }
                                else {
                                        HStack() {
                                            ImageView(imageUrl: ans_d_img)
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
                            Text("D.").font(.system(size: 16))
                                .frame(width: 100)
                                .padding()
                            Text(ans_d).font(.system(size: 16))
                                .padding()
                                .frame(width: 569)
                            Text("").font(.system(size: 16))
                                .frame(width: 100)
                                .padding()
                        }
                        .frame(width: 769)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                    }
                    
                    
                }.buttonStyle(PlainButtonStyle()).foregroundColor(.white)
                //.padding(.bottom)
                
            }.frame(width: .infinity)
            HStack() {
                
                if question_type == "wimage" || question_type == "wimage_answimage" || question_type == "wimage_answimagewotext" {
                    Button(action: {
                        pickImage(field: "questionImg")
                    }) {
                        Text("Question Attachment").font(.system(size: 14))
                            .padding().frame(width: 169, height: 20)
                    }.buttonStyle(LightSeaGreenButton()).foregroundColor(.white)
                    //.padding(.vertical)
                }
                
                if question_type == "wimage_answimage" || question_type == "wimage_answimagewotext" || question_type == "woimage_answimage"  || question_type == "woimage_answimagewotext" {
                    Button(action: {
                        pickImage(field: "ansAImg")
                    }) {
                        Text("Answer A").font(.system(size: 14))
                            .padding().frame(width: 100, height: 20)
                    }.buttonStyle(LightSeaGreenButton()).foregroundColor(.white)
                    //.padding(.vertical)
                    
                    Button(action: {
                        pickImage(field: "ansBImg")
                    }) {
                        Text("Answer B").font(.system(size: 14))
                            .padding().frame(width: 100, height: 20)
                    }.buttonStyle(LightSeaGreenButton()).foregroundColor(.white)
                    //.padding(.vertical)
                    
                    Button(action: {
                        pickImage(field: "ansCImg")
                    }) {
                        Text("Answer C").font(.system(size: 14))
                            .padding().frame(width: 100, height: 20)
                    }.buttonStyle(LightSeaGreenButton()).foregroundColor(.white)
                    //.padding(.vertical)
                    
                    Button(action: {
                        pickImage(field: "ansDImg")
                    }) {
                        Text("Answer D").font(.system(size: 14))
                            .padding().frame(width: 100, height: 20)
                    }.buttonStyle(LightSeaGreenButton()).foregroundColor(.white)
                    //.padding(.vertical)
                    
                }
                
                
            }.frame(width: .infinity)
            .padding(.vertical)
        
            
            VStack() {
                TextField("Question", text: $question_text).font(.system(size: 14))
                    .padding().frame(width: 769, height: 20)
                    .textFieldStyle(OvalTextFieldStyle())
                    .padding(.bottom)
                    .onTapGesture {
                        self.helper.fieldBeingEdited = self.question_text
                    }
                if question_type != "wimage_answimagewotext" && question_type != "woimage_answimagewotext" && question_type != "" {
                    TextField("Answer A", text: $ans_a).font(.system(size: 14))
                        .padding().frame(width: 769, height: 20)
                        .textFieldStyle(OvalTextFieldStyle())
                        .padding(.bottom)
                        .onTapGesture {
                            self.helper.fieldBeingEdited = self.ans_a
                        }
                    TextField("Answer B", text: $ans_b).font(.system(size: 14))
                        .padding().frame(width: 769, height: 20)
                        .textFieldStyle(OvalTextFieldStyle())
                        .padding(.bottom)
                        .onTapGesture {
                            self.helper.fieldBeingEdited = self.ans_b
                        }
                    TextField("Answer C", text: $ans_c).font(.system(size: 14))
                        .padding().frame(width: 769, height: 20)
                        .textFieldStyle(OvalTextFieldStyle())
                        .padding(.bottom)
                        .onTapGesture {
                            self.helper.fieldBeingEdited = self.ans_c
                        }
                    TextField("Answer D", text: $ans_d).font(.system(size: 14))
                        .padding().frame(width: 769, height: 20)
                        .textFieldStyle(OvalTextFieldStyle())
                        .padding(.bottom)
                        .onTapGesture {
                            self.helper.fieldBeingEdited = self.ans_d
                        }
                }
                VStack {
                    HStack() {
                        CheckboxField(
                            id: Gender.Mathematics.rawValue,
                            label: "Mathematics",
                            size: 14,
                            textSize: 14,
                            callback: checkboxSelected
                        )
                        CheckboxField(
                            id: Gender.EngineeringScienceandAlliedSubjects.rawValue,
                            label: "Engineering Science and Allied Subjects",
                            size: 14,
                            textSize: 14,
                            callback: checkboxSelected
                        )
                    }.padding().frame(width: 769, height: 30)
                    
                    HStack() {
                        CheckboxField(
                            id: Gender.ComputerEngineeringProfessionalSubjects.rawValue,
                            label: "Computer Engineering Professional Subjects",
                            size: 14,
                            textSize: 14,
                            callback: checkboxSelected
                        )
                        CheckboxField(
                            id: Gender.ElectricalEngineeringProfessionalSubjects.rawValue,
                            label: "Electrical Engineering Professional Subjects",
                            size: 14,
                            textSize: 14,
                            callback: checkboxSelected
                        )
                    }.padding().frame(width: 769, height: 30)
                    
                    HStack() {
                        CheckboxField(
                            id: Gender.MachineDesignMaterialsandShopPractice.rawValue,
                            label: "Machine Design, Materials and Shop Practice",
                            size: 14,
                            textSize: 14,
                            callback: checkboxSelected
                        )
                        CheckboxField(
                            id: Gender.PowerPlantEngineering.rawValue,
                            label: "Power Plant Engineering",
                            size: 14,
                            textSize: 14,
                            callback: checkboxSelected
                        )
                    }.padding().frame(width: 769, height: 30)
                    
                    
                    HStack() {
                        CheckboxField(
                            id: Gender.MathematicsEngineeringEconomicsandBasicEngineeringSciences.rawValue,
                            label: "Mathematics, Engineering Economics and Basic Engineering Sciences",
                            size: 14,
                            textSize: 14,
                            callback: checkboxSelected
                        )
                    }.padding().frame(width: 769, height: 30)
                    
                    
                    VStack(spacing: 20) {
                        
                        HStack() {
                            VStack() {
                                Picker(selection: $ans_correct, label: Text("Correct Answer")) {
                                    Text("A").tag("a")
                                    Text("B").tag("b")
                                    Text("C").tag("c")
                                    Text("D").tag("d")
                                }
                                //.pickerStyle(.radioGroup)
                                .horizontalRadioGroupLayout()
                                Picker(selection: $question_type, label: Text("Question Type  ")) {
                                    Text("Plain").tag("plain")
                                    Text("Question w/Image").tag("wimage")
                                    Text("Question w/Image and Ans w/Image").tag("wimage_answimage")
                                    Text("Question w/Image, Ans w/Image, and Ans w/o Text").tag("wimage_answimagewotext")
                                    Text("Question w/o Image and Ans w/Image").tag("woimage_answimage")
                                    Text("Question w/o Image, Ans w/Image, and Ans w/o Text").tag("woimage_answimagewotext")
                                }
                                //.pickerStyle(.radioGroup)
                                .horizontalRadioGroupLayout()
                                
                            }
                            Button(action: {
                                newQues()
                            }) {
                                Text("DONE").font(.system(size: 14))
                                    .padding().frame(width: 169, height: 20)
                            }.buttonStyle(SeaGreenButton()).foregroundColor(.white)
                        }
                    }
                    .padding(16)
                    .border(Color.gray)
                    .padding(.vertical)
                    
                    
                    if question_type == "wimage_answimagewotext" || question_type == "woimage_answimagewotext" {
                        HStack() {
                            
                        }.onAppear() {
                            ans_a = ""
                            ans_b = ""
                            ans_c = ""
                            ans_d = ""
                        }
                    }

                    
                    
                    
                }.padding().frame(width: 769)
                
            }.frame(minWidth: 888,
                    maxWidth: .infinity)
        }.frame(width: .infinity)
        
    }
    
    
    func newQues() {
        
        var checkType = false
        var suc = false

        
        if category != "" && question_text != "" && question_type != "" && (ans_a != "" || ans_a_img != "")  && (ans_b != "" || ans_b_img != "")  && (ans_c != "" || ans_c_img != "")  && (ans_d != "" || ans_d_img != "") && ans_correct != "" {
            
            let userDefaults = UserDefaults.standard
            var username = userDefaults.string(forKey: "savedAccount") ?? ""
            var password = userDefaults.string(forKey: "savedPass") ?? ""
            
            let myUrl = URL(string: PhpServer.server + "new_question.php");
            
            var request = URLRequest(url:myUrl!)
            
            request.httpMethod = "POST"
            
            var postString = "";
            
            if question_type == "plain" {
                if ans_a != "" && ans_b != "" && ans_c != "" && ans_d != "" {
                    postString = "username="+username+"&password="+password+"&category="+category+"&question_text="+question_text+"&question_type="+question_type+"&ans_a="+ans_a+"&ans_b="+ans_b+"&ans_c="+ans_c+"&ans_d="+ans_d+"&ans_correct="+ans_correct;
                    //postString = "username="+username+"&password="+password+"&category="+category;
                    
                        //let answer = dialogOKCancel(question: "Nagana.", text: "")
                }
                else {
                    checkType = true
                    let answer = dialogOKCancel(question: "Check your question type!", text: "")
                }
            }
            else if question_type == "wimage" {
                if ans_a != "" && ans_b != "" && ans_c != "" && ans_d != "" && question_img != "" {
                    postString = "username="+username+"&password="+password+"&category="+category+"&question_text="+question_text+"&question_type="+question_type+"&question_img="+question_img+"&ans_a="+ans_a+"&ans_b="+ans_b+"&ans_c="+ans_c+"&ans_d="+ans_d+"&ans_correct="+ans_correct;
                    //postString = "username="+username+"&password="+password+"&category="+category;
                    
                        //let answer = dialogOKCancel(question: "Nagana.", text: "")
                }
                else {
                    checkType = true
                    let answer = dialogOKCancel(question: "Check your question type!", text: "")
                }
            }
            else if question_type == "wimage_answimage" {
                if ans_a != "" && ans_b != "" && ans_c != "" && ans_d != "" && question_img != "" && ans_a_img != "" && ans_b_img != "" && ans_c_img != "" && ans_d_img != "" {
                    postString = "username="+username+"&password="+password+"&category="+category+"&question_text="+question_text+"&question_type="+question_type+"&question_img="+question_img+"&ans_a="+ans_a+"&ans_b="+ans_b+"&ans_c="+ans_c+"&ans_d="+ans_d+"&ans_a_img="+ans_a_img+"&ans_b_img="+ans_b_img+"&ans_c_img="+ans_c_img+"&ans_d_img="+ans_d_img+"&ans_correct="+ans_correct;
                    //postString = "username="+username+"&password="+password+"&category="+category;
                    
                        //let answer = dialogOKCancel(question: "Nagana.", text: "")
                }
                else {
                    checkType = true
                    let answer = dialogOKCancel(question: "Check your question type!", text: "")
                }
            }
            else if question_type == "wimage_answimagewotext" {
                if  question_img != "" && ans_a_img != "" && ans_b_img != "" && ans_c_img != "" && ans_d_img != "" {
                    postString = "username="+username+"&password="+password+"&category="+category+"&question_text="+question_text+"&question_type="+question_type+"&question_img="+question_img+"&ans_a_img="+ans_a_img+"&ans_b_img="+ans_b_img+"&ans_c_img="+ans_c_img+"&ans_d_img="+ans_d_img+"&ans_correct="+ans_correct;
                    //postString = "username="+username+"&password="+password+"&category="+category;
                    
                        //let answer = dialogOKCancel(question: "Nagana.", text: "")
                }
                else {
                    checkType = true
                    let answer = dialogOKCancel(question: "Check your question type!", text: "")
                }
                
            }
            else if question_type == "woimage_answimage" {
                if ans_a != "" && ans_b != "" && ans_c != "" && ans_d != "" && ans_a_img != "" && ans_b_img != "" && ans_c_img != "" && ans_d_img != "" {
                    postString = "username="+username+"&password="+password+"&category="+category+"&question_text="+question_text+"&question_type="+question_type+"&ans_a="+ans_a+"&ans_b="+ans_b+"&ans_c="+ans_c+"&ans_d="+ans_d+"&ans_a_img="+ans_a_img+"&ans_b_img="+ans_b_img+"&ans_c_img="+ans_c_img+"&ans_d_img="+ans_d_img+"&ans_correct="+ans_correct;
                    //postString = "username="+username+"&password="+password+"&category="+category;
                    
                        //let answer = dialogOKCancel(question: "Nagana.", text: "")
                }
                else {
                    checkType = true
                    let answer = dialogOKCancel(question: "Check your question type!", text: "")
                }
            }
            else if question_type == "woimage_answimagewotext" {
                if ans_a_img != "" && ans_b_img != "" && ans_c_img != "" && ans_d_img != "" {
                    postString = "username="+username+"&password="+password+"&category="+category+"&question_text="+question_text+"&question_type="+question_type+"&ans_a_img="+ans_a_img+"&ans_b_img="+ans_b_img+"&ans_c_img="+ans_c_img+"&ans_d_img="+ans_d_img+"&ans_correct="+ans_correct;
                    //postString = "username="+username+"&password="+password+"&category="+category;
                    
                        //let answer = dialogOKCancel(question: "Nagana.", text: "")
                }
                else {
                    checkType = true
                    let answer = dialogOKCancel(question: "Check your question type!", text: "")
                }
                
            }
            
            
            //postString = "username="+username+"&password="+password+"&category="+category+"&question_img="+question_img+"&question_type="+question_type+"&ans_a="+ans_a+"&ans_b="+ans_b+"&ans_c="+ans_c+"&ans_d="+ans_d+"&ans_a_img="+ans_a_img+"&ans_b_img="+ans_b_img+"&ans_c_img="+ans_c_img+"&ans_d_img="+ans_d_img+"&ans_correct="+ans_correct;
            
            
            
            if checkType == false {
                
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
                            
                        
                            var resProc = (String(describing: responseValue)).replacingOccurrences(of: "Optional(\"", with: "").replacingOccurrences(of: "\")", with: "")
                            
                            print(resProc)
                            
                            if resProc == "Question created" {
                                suc = true
                            }
                            else {
                                suc = false
                            }
                        }
                        
                    } catch {
                    }
                }
                task.resume()
            }
            
            sleep(2)
            if suc == true {
                let answer = dialogOKCancel(question: "Question created!" , text: "")
                NSApplication.shared.keyWindow?.close()
                
                NewQuestionView(categoryValue: self.$categoryValue).frame(minWidth: 888, idealWidth: 888, maxWidth: .infinity,minHeight: 666, idealHeight: 666,maxHeight: .infinity).openInWindow(title: "New Question", sender: self)
            }
            else {
                let answer = dialogOKCancel(question: "Question not created!" , text: "")
            }
            
        }
        else {
            let answer = dialogOKCancel(question: "Complete the fields!", text: "")
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
    
    
    func checkboxSelected(id: String, isMarked: Bool) {
        print("\(id) is marked: \(isMarked)")

        if id == "Mathematics" {
            if isMarked == true {
                category = category + "[Mathematics]"
            }
            else {
                category = category.replacingOccurrences(of: "[Mathematics]", with: "")
            }
        }
        if id == "EngineeringScienceandAlliedSubjects" {
            if isMarked == true {
                category = category + "[Engineering Science and Allied Subjects]"
            }
            else {
                category = category.replacingOccurrences(of: "[Engineering Science and Allied Subjects]", with: "")
            }
        }
        if id == "ComputerEngineeringProfessionalSubjects" {
            if isMarked == true {
                category = category + "[Computer Engineering Professional Subjects]"
            }
            else {
                category = category.replacingOccurrences(of: "[Computer Engineering Professional Subjects]", with: "")
            }
        }
        if id == "ElectricalEngineeringProfessionalSubjects" {
            if isMarked == true {
                category = category + "[Electrical Engineering Professional Subjects]"
            }
            else {
                category = category.replacingOccurrences(of: "[Electrical Engineering Professional Subjects]", with: "")
            }
        }
        if id == "MachineDesignMaterialsandShopPractice" {
            if isMarked == true {
                category = category + "[Machine Design, Materials and Shop Practice]"
            }
            else {
                category = category.replacingOccurrences(of: "[Machine Design, Materials and Shop Practice]", with: "")
            }
        }
        if id == "PowerPlantEngineering" {
            if isMarked == true {
                category = category + "[Power Plant Engineering]"
            }
            else {
                category = category.replacingOccurrences(of: "[Power Plant Engineering]", with: "")
            }
        }
        if id == "MathematicsEngineeringEconomicsandBasicEngineeringSciences" {
            if isMarked == true {
                category = category + "[Mathematics, Engineering Economics and Basic Engineering Sciences]"
            }
            else {
                category = category.replacingOccurrences(of: "[Mathematics, Engineering Economics and Basic Engineering Sciences]", with: "")
            }
        }
        
    }
    
    struct OvalTextFieldStyle: TextFieldStyle {
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .padding(0)
                .frame(width: 760, height: 30)
                .cornerRadius(0)
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
    
    func uploadImage(encodedImage: String, imageName: String, imgField: String) {
        
        let userDefaults = UserDefaults.standard
        var username = userDefaults.string(forKey: "savedAccount") ?? ""
        var password = userDefaults.string(forKey: "savedPass") ?? ""
            
        
        let url = URL(string: PhpServer.server + "upload_images.php")
        var request = URLRequest(url: url!)
        let postString = "username="+username+"&password="+password+"&ImageName="+imageName+"&phpServer="+PhpServer.server+"&base64=\(encodedImage)"
        let postData = postString.data(using: String.Encoding.utf8)
        request.httpMethod = "POST"
        request.httpBody = postData
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            if error != nil {
                // Handle error
                return
            }
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //print(responseString)
            
            if imgField == "questionImg" {
                let myString: String = responseString as! String
                question_img = myString.replacingOccurrences(of: "{\"response\":\"", with: "").replacingOccurrences(of: "\"}", with: "").replacingOccurrences(of: "\\", with: "")
            }
            else if imgField == "ansAImg" {
                let myString: String = responseString as! String
                ans_a_img = myString.replacingOccurrences(of: "{\"response\":\"", with: "").replacingOccurrences(of: "\"}", with: "").replacingOccurrences(of: "\\", with: "")
            }
            else if imgField == "ansBImg" {
                let myString: String = responseString as! String
                ans_b_img = myString.replacingOccurrences(of: "{\"response\":\"", with: "").replacingOccurrences(of: "\"}", with: "").replacingOccurrences(of: "\\", with: "")
            }
            else if imgField == "ansCImg" {
                let myString: String = responseString as! String
                ans_c_img = myString.replacingOccurrences(of: "{\"response\":\"", with: "").replacingOccurrences(of: "\"}", with: "").replacingOccurrences(of: "\\", with: "")
            }
            else if imgField == "ansDImg" {
                let myString: String = responseString as! String
                ans_d_img = myString.replacingOccurrences(of: "{\"response\":\"", with: "").replacingOccurrences(of: "\"}", with: "").replacingOccurrences(of: "\\", with: "")
            }
            
        }
        task.resume()
    }
    
    
    func pickImage(field : String) {
        /*
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        let imageData = image.jpegData(compressionQuality: 1)!
        let encodedImage = imageData.base64EncodedString()*/
        
        
        let dialog = NSOpenPanel();

        dialog.title                   = "Choose an image | Our Code World";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.allowsMultipleSelection = false;
        dialog.canChooseDirectories = false;
        dialog.allowedFileTypes        = ["png", "jpg", "jpeg", "gif"];

        if (dialog.runModal() ==  NSApplication.ModalResponse.OK) {
            let result = dialog.url // Pathname of the file

            if (result != nil) {
                let path: String = result!.path
                
                // path contains the file path e.g
                // /Users/ourcodeworld/Desktop/tiger.jpeg
                
                let fileURL = URL(fileURLWithPath: path)
                let fileData = try! Data(contentsOf: fileURL)
                let imageString = fileData.base64EncodedString()
                let imageData = Data(base64Encoded: imageString)!
                let image = NSImage(data: imageData)!
                
                let imageName = (path as NSString).lastPathComponent
                
                if image != nil {
                    //uploadImage(encodedImage: String(imageString))
                    uploadImage(encodedImage: String(imageString),imageName: String(imageName), imgField: field)
                }
            }
            
        } else {
            // User clicked on "Cancel"
            return
        }
    }
    
    
    
}


//MARK:- Checkbox Field
struct CheckboxField: View {
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: Int
    let callback: (String, Bool)->()

    init(
        id: String,
        label:String,
        size: CGFloat = 10,
        color: Color = Color.black,
        textSize: Int = 14,
        callback: @escaping (String, Bool)->()
        ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.callback = callback
    }

    @State var isMarked:Bool = false

    var body: some View {
        Button(action:{
            self.isMarked.toggle()
            self.callback(self.id, self.isMarked)
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.isMarked ? "checkmark.square" : "square")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                Text(label)
                    .font(Font.system(size: size))
                Spacer()
            }.foregroundColor(self.color)
        }
        .foregroundColor(Color.white)
    }
}

enum Gender: String {
    case Mathematics
    case EngineeringScienceandAlliedSubjects
    case ComputerEngineeringProfessionalSubjects
    case ElectricalEngineeringProfessionalSubjects
    case MachineDesignMaterialsandShopPractice
    case PowerPlantEngineering
    case MathematicsEngineeringEconomicsandBasicEngineeringSciences
}

/*
struct NewQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        NewQuestionView()
    }
}
*/
