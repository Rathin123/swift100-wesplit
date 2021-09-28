//
//  ContentView.swift
//  WeSplit
//
//  Created by Rathin Kacham on 9/25/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: String = ""
    @State private var strOfPeople: String = "2"
    //tipPercentage is used as an index to acces the tipPercentages array
    @State private var tipPercentage = 2
    
    let tipPercentages = [10,15,20,25,0]
    
    var totalPerPerson: Double {
        //calc total here
        let numberOfPeople = Double(strOfPeople) ?? 0
        let peopleCount = numberOfPeople
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        return orderAmount*(1+tipSelection/100)/peopleCount
    }
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        return orderAmount*(1+tipSelection/100)
    }

    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", text: $checkAmount).keyboardType(.decimalPad)
                }
                
                Section(header: Text("Tip Percentage")){
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(0..<tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Number of people")){
                    TextField("Number of people:", text: $strOfPeople)
                }
                
                Section(header: Text("Total cost")){
                    Text("$\(grandTotal, specifier: "%.2f")")
                }
                
                Section(header: Text("Amount per person")){
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
            }.navigationBarTitle("WeSplit")
        }

    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
