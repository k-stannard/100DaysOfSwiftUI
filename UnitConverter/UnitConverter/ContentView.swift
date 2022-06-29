//
//  ContentView.swift
//  UnitConverter
//
//  Created by Koty Stannard on 6/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var temperatureInput = 0.0
    @State private var selectedTemp = "Fahrenheit"
    @State private var convertedTemp = "Fahrenheit"
    
    let tempUnits = ["Fahrenheit", "Celsius", "Kelvin"]
    
    var temperatureOutput: Double {
        var returnTemp = 0.0
        if selectedTemp == "Fahrenheit" {
            if convertedTemp == "Fahrenheit" {
                returnTemp = temperatureInput
            } else if convertedTemp == "Celsius" {
                returnTemp = (temperatureInput - 32) * 5 / 9
            } else {
                returnTemp = (temperatureInput - 32) * 5 / 9 + 273.15
            }
        } else if selectedTemp == "Celsius" {
            if convertedTemp == "Fahrenheit" {
                returnTemp = (temperatureInput / 5) * 9 + 32
            } else if convertedTemp == "Celsius" {
                returnTemp = temperatureInput
            } else {
                returnTemp = temperatureInput + 273.15
            }
        } else {
            if convertedTemp == "Fahrenheit" {
                returnTemp = (temperatureInput - 273.15) * 1.8 + 32
            } else if convertedTemp == "Celsius" {
                returnTemp = temperatureInput - 273.15
            } else {
                returnTemp = temperatureInput
            }
        }
        return round(returnTemp * 10) / 10.0
    }
    
    var outputString: String {
        return convertedTemp == "Kelvin" ? "\(temperatureOutput) K" : "\(temperatureOutput) degrees"
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter temperature", value: $temperatureInput, format: .number)
                        .keyboardType(.decimalPad)
                    
                    Picker("Temperature", selection: $selectedTemp) {
                        ForEach(tempUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("Unit", selection: $convertedTemp) {
                        ForEach(tempUnits, id: \.self) {
                            Text($0)
                        }
                    } .pickerStyle(.segmented)
                    
                    Text(outputString)
                } header: {
                    Text("Temperature Conversion")
                }
                
                Section {

                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
