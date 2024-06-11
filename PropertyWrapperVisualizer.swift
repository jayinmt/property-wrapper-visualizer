import SwiftUI

struct ContentView: View {
    @State private var stateValue = 0
    @ObservedObject private var observedObject = ObservedObject()
    @EnvironmentObject private var environmentObject: EnvironmentObject
    
    var body: some View {
        VStack {
            Text("SwiftUI Property Wrapper Visualizer")
                .font(.title)
                .padding()
            
            // @State example
            Section(header: Text("@State")) {
                Text("Value: \(stateValue)")
                Button("Increment") {
                    stateValue += 1
                }
            }
            .padding()
            
            // @ObservedObject example
            Section(header: Text("@ObservedObject")) {
                Text("Value: \(observedObject.value)")
                Button("Increment") {
                    observedObject.increment()
                }
            }
            .padding()
            
            // @EnvironmentObject example
            Section(header: Text("@EnvironmentObject")) {
                Text("Value: \(environmentObject.value)")
                Button("Increment") {
                    environmentObject.increment()
                }
            }
            .padding()
            
            // Code generation
            Section(header: Text("Code Generation")) {
                Text("@State:")
                Text("private var stateValue = \(stateValue)")
                    .foregroundColor(.blue)
                
                Text("@ObservedObject:")
                Text("private var observedObject = ObservedObject()")
                    .foregroundColor(.blue)
                
                Text("@EnvironmentObject:")
                Text("private var environmentObject: EnvironmentObject")
                    .foregroundColor(.blue)
            }
            .padding()
        }
    }
}

class ObservedObject: ObservableObject {
    @Published var value = 0
    
    func increment() {
        value += 1
    }
}

class EnvironmentObject: ObservableObject {
    @Published var value = 0
    
    func increment() {
        value += 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(EnvironmentObject())
    }
}
