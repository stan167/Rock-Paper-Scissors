import SwiftUI

struct ContentView: View {
    
    @State private var resultLabel = Text("The result goes here!")
        .font(.title3)
    @State private var cpuScore = 0
    @State private var playerScore = 0
    let options = ["rock", "paper", "scissors"]
    
    func randomOption() -> String {
        return options.randomElement()!
    }
    
    func compareOptions(self: String) -> String {
        let cpuOption = randomOption()
        let playerOption = self
        
        if cpuOption == playerOption {
            return "Draw!"
        }
        if cpuOption == "rock" && playerOption == "scissors" ||
            cpuOption == "paper" && playerOption == "rock" ||
            cpuOption == "scissors" && playerOption == "paper" {
            cpuScore += 1
            return "CPU Wins!"
        }
        else {
            playerScore += 1
            return "Player Wins!"
        }
    }
    
    
    var body: some View {
        VStack {
            Text("Rock Paper Scissors")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
            resultLabel

            Spacer()
            
            HStack {
                Button(action: {
                    resultLabel = Text(compareOptions(self: "rock"))
                }) {
                    Image("rock")
                        .resizable()
                        .frame(width: 125, height: 100)
                        .aspectRatio(contentMode: .fit)
                }
                Button(action: {
                    resultLabel = Text(compareOptions(self: "paper"))
                }) {
                    Image("paper")
                        .resizable()
                        .frame(width: 125, height: 100)
                        .aspectRatio(contentMode: .fit)
                }
                Button(action: {
                    resultLabel = Text(compareOptions(self: "scissors"))
                }) {
                    Image("scissors")
                        .resizable()
                        .frame(width: 125, height: 100)
                        .aspectRatio(contentMode: .fit)
                }
                
            }
            
            Spacer()
            
            HStack {
                Spacer()
                VStack {
                    Text("Player")
                        .font(.title)
                        .fontWeight(.heavy)
                    Text(String(playerScore))
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding()
                }
                Spacer()
                VStack {
                    Text("CPU")
                        .font(.title)
                        .fontWeight(.heavy)
                    Text(String(cpuScore))
                        .font(.largeTitle)
                        .fontWeight(.semibold)
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
