import SwiftUI

struct ContentView: View {
    @State private var shouldScrollToTop = false

    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .top) {
                    LinearGradient(gradient: Gradient(colors: [Color.green, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(.all)

                    VStack(alignment: .center) {
                        Image("guide1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 400)
                            .padding(.top, 20)
                    }
                }

                ScrollView {
                    Text(gardeningTipsText)
                        .font(.subheadline)
                        .padding()
                        .background(Color(.init(white: 0.9, alpha: 1.0))
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous)))
                        .id("top") // Add an ID to the ScrollView

                    Button(action: {
                        withAnimation {
                            shouldScrollToTop.toggle()
                            
                        }
                    }) {
                        Text("Scroll to Top")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                }
                .ignoresSafeArea(.keyboard, edges: .bottom)
            }
            .background(
                GeometryReader { proxy in
                    Color.clear.onAppear {
                        if shouldScrollToTop {
                            // Get the top position of the ScrollView
                            let topPosition = proxy.frame(in: .global).minY
                            // Scroll to the top position
                            UIScrollView.appearance().setContentOffset(CGPoint(x: 0, y: -topPosition), animated: true)
                        }
                    }
                }
            )
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
