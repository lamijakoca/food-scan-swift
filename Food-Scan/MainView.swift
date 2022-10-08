//
//  MainView.swift
//  Food-Scan
//
//  Created by Mahir Tahirovic on 03/10/2022.
//

import SwiftUI


extension String{
    func contains(_ strings: [String]) -> Bool{
        strings.contains {contains($0)}
    }
}

struct MainView: View {
    @State private var showScannerSheet = false
    @State private var texts: [ScanData]  = []
    @State private var ingredients = HaramIngredients()
    //var ingredients:[String] = ["pork", "soya", "ham", "beer", "gelation"]
    
     var body: some View {
        NavigationView{
            VStack{
                if texts.count > 0{
                    List{
                        ForEach(texts){
                            text in NavigationLink(
                                destination: ScrollView{Text(text.content)},
                                label: {
                                    if(text.content.contains(ingredients.ingredients())){
                                        Text("Haram")
                                            .foregroundColor(.red)
                                    } else {
                                        Text("Halal")
                                            .foregroundColor(.green)
                                    }
                                })
                            //text in NavigationLink(destination: ScrollView{Text(text.content)}, label : {Text(text.content).lineLimit(1)})
                        }
                    }
                } else {
                    Text("No scan yet")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
            }
            .navigationTitle("FoodScan")
            .navigationBarItems(trailing: Button(action: {
                self.showScannerSheet = true
            }, label: {
                Image(systemName: "doc.text.viewfinder")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            })
            .sheet(isPresented: $showScannerSheet, content: {
                makeScannerView()
            }))
        }
    }
    private func makeScannerView ()-> ScannerView{
        ScannerView(completion: {
            textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines){
                let newScanData = ScanData(content: outputText)
                self.texts.append(newScanData)
            }
            self.showScannerSheet = false
        })
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
