import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var isLoading = true
    
    var body: some View {
        if isActive {
            ChannelsView()
        } else {
            ZStack {
                Image("bg")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Image("splash_logo")
                    Spacer()
                    if isLoading {
                        LoadingView(isAnimating: $isLoading)
                    }
                    Spacer()
                }
            }
            .onAppear {
                isLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                        isLoading = false
                    }
                }
            }
        }
    }
}

struct LoadingView: View {
    
    @Binding var isAnimating: Bool
    @State var rotation = false
    
    var body: some View {
        VStack {
            Circle()
                .stroke(AngularGradient(gradient: Gradient(colors: [Color.gray, Color.gray.opacity(0.5), Color.gray.opacity(0)]), center: .center), style: StrokeStyle(lineWidth: 2, lineCap: .round))
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees(rotation ? 360 : 0))
                .onAppear {
                    withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                        self.rotation.toggle()
                    }
                }
        }
        
    }
}

#Preview {
    SplashScreenView()
}
