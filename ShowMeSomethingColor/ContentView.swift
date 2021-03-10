//
//  ContentView.swift
//  testProject
//
//  Created by Lorena Mrsic on 10/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var result = ""
    @State private var color = ""
    @State private var previousNumber = 1
    
    func randomNumbers(from number1: Int, to number2: Int) -> Int{
        var numberRand = Int.random(in: number1...number2)
        if numberRand == previousNumber{
            numberRand = Int.random(in: number1...number2, excluding: previousNumber)
        }
        previousNumber = numberRand
        
        return numberRand
    }
    
    var body: some View {

        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                Text("Click to see something: ").foregroundColor(Color.primary)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)

                
                Spacer()

                HStack {
                    Button(action: {
                        // show something blue
                        let number = randomNumbers(from: 1, to: 3)
                        result = "blue" + String(number)
                        color = "blue"
                        
                    }, label: {
                        Text("Blue")
                            .frame(width: 115, height: 115, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    })
                    Button(action: {
                        // show something red
                        let number = randomNumbers(from: 1, to: 3)
                        result = "red" + String(number)
                        color = "red"
                        
                    }, label: {
                        Text("Red")
                            .frame(width: 115, height: 115, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    })
                }
                HStack {
                    Button(action: {
                        // show something green
                        let number = randomNumbers(from: 1, to: 3)
                        result = "green" + String(number)
                        color = "green"
                        
                    }, label: {
                        Text("Green")
                            .frame(width: 115, height: 115, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    })
                    Button(action: {
                        // show something yellow
                        let number = randomNumbers(from: 1, to: 3)
                        result = "yellow" + String(number)
                        color = "yellow"
                        
                    }, label: {
                        Text("Yellow")
                            .frame(width: 115, height: 115, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                            .background(Color.yellow)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    })
                }
                Spacer()
                Spacer()
                Spacer()
                
                if result != ""{
                    HStack {
                        Text("Something ").font(.title)
                        Text("\(color) ").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                    }
                }
                
                HStack {
                    Image(result)
                        .resizable()
                        .frame(width: 300, height: 300)
                        .padding()
                }
                
                Spacer()

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Int{
    static func random(in range: ClosedRange<Int>, excluding x: Int) -> Int{
        if range.contains(x) {
            let r = Int.random(in: Range(uncheckedBounds: (range.lowerBound, range.upperBound)))
            return r == x ? range.upperBound : r
        } else {
            return Int.random(in: range)
        }
    }
}
