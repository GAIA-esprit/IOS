import SwiftUI

struct ImageInfo: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let location: String
    let price: String
    let rating: String
}

struct HomeView: View {
    @State private var username: String = ""
    @State private var NavigateToNext = false
    var image = ["guide1", "guide2", "guide3"]
    @State private var imageInfoList: [ImageInfo] = [
        ImageInfo(imageName: "guide1", title: "climate change", location: "Web based", price: "$0 ", rating: "String"),
        ImageInfo(imageName: "guide2", title: "global warming", location: "web based", price: "$29 / day", rating: "string"),
        ImageInfo(imageName: "guide3", title: "Gardening", location: "Paris, France", price: "$29 / day", rating: "string"),
        ImageInfo(imageName: "guide4", title: "Flen Fouleni", location: "Paris, France", price: "$29 / day", rating: "string"),
        // Add more image info items for each image
    ]
    @State private var selectedFilter = "Recommended"

    let filters = ["Recommended", "Popular", "Trending", "Testing"]

    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .top, endPoint: .bottom)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)

                    VStack(alignment: .center, spacing: 40) {
                        HStack {
                            VStack {
                                HStack {
                                    VStack {
                                        Image("logo1")
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                            .padding(.horizontal, 10)
                                    }

                                    HStack {
                                        Text("Welcome to Earthwise")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal, 10)
                                            .padding(.trailing, 10)

                                        Spacer()

                                        Button(action: {
                                            print("Button tapped")
                                        }) {
                                            Image(systemName: "line.horizontal.3")
                                                .background(Color.clear)
                                                .foregroundColor(.black)
                                                .cornerRadius(10)
                                        }
                                    }
                                    .multilineTextAlignment(.center)
                                }
                                .frame(maxWidth: .infinity) // Expand to fill the available space
                            }
                        }

                        HStack {
                            TextField("Rechercher...", text: $username)
                                .padding(.vertical, 10)
                                .padding(.trailing, 10)
                                .overlay(
                                    HStack {
                                        Spacer()
                                        Image(systemName: "magnifyingglass")
                                            .padding(.trailing, 10)
                                    }
                                )
                        }
                        .textFieldStyle(CustomTextFieldStyle())
                        .cornerRadius(10)
                        .padding()

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(filters, id: \.self) { filter in
                                    Button(action: {
                                        selectedFilter = filter
                                    }) {
                                        Text(filter)
                                            .foregroundColor(selectedFilter == filter ? .white: .green)
                                            .padding(EdgeInsets(top: 12, leading: 25, bottom: 12, trailing: 25))
                                            .background(selectedFilter == filter ? Color.green : Color.clear)
                                            .cornerRadius(32)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 30)
                                                    .stroke(selectedFilter == filter ? Color.green : Color.green, lineWidth: 2)
                                            )
                                    }
                                }
                            }
                        }

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(imageInfoList) { imageInfo in
                                    VStack {
                                        ZStack {
                                            Color(hex: "F3F8FE")
                                            Image(imageInfo.imageName)
                                                .resizable()
                                                .cornerRadius(20)
                                                .padding()
                                        }
                                        .frame(width: 250, height: 350)
                                    }
                                }
                            }
                        }

                        HStack {
                            Text("Our Courses")
                                .font(.system(size: 22, weight: .semibold))
                            Spacer()
                            Text("See All")
                                .font(.system(size: 22, weight: .semibold))
                                .foregroundColor(Color.green)
                        }
                        .padding(.trailing, 20)

                        ForEach(imageInfoList) { imageInfo in
                            ZStack {
                                Color(hex: "F3F8FE") // Set your desired background color here
                                    .frame(width: 350, height: 150)
                                    .cornerRadius(20)
                                HStack(spacing: 5) {
                                    Image(imageInfo.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                    VStack(alignment: .leading, spacing: 15) {
                                        Text(imageInfo.title)
                                            .font(.system(size: 23, weight: .semibold))
                                        Text(imageInfo.location)
                                            .font(.system(size: 16))
                                            .foregroundColor(Color.gray)

                                        HStack {
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                            Text("4.8 (4209 reviews)")
                                                .font(.system(size: 15))
                                        }
                                    }
                                    .frame(maxWidth: .infinity) // Expand to fill the available space
                                    Spacer()
                                    VStack(alignment: .trailing, spacing: 15) {
                                        Text("$0")
                                            .font(.system(size: 23, weight: .semibold))
                                            .foregroundColor(Color.green)
                                        Text("/ day")

                                        NavigationLink(destination: ContentView(), isActive: $NavigateToNext) {}
                                            .hidden()
                                        Button(action: {
                                            NavigateToNext = true
                                        }) {
                                            Image(systemName: "bookmark")
                                                .font(.system(size: 24))
                                                .foregroundColor(Color.black)
                                        }
                                    }
                                    .padding(.trailing, 20)
                                }
                            }
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(hex: "F3F8FE")) // Use an extension to create a Color from a hex string
            )
            .foregroundColor(Color.black)
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgb: UInt64 = 0

        scanner.scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
