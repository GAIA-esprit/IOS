import SwiftUI

struct Product: Identifiable {
    let id: Int
    let imageName: String
    let trendingText: String
}

struct AllProducts: View {
    let filters = ["All", "Clothes", "Stickers", "Eco-friendly"]
  
    @State private var selectedCategory = "All"
    @State private var favouriteProducts: [Int] = []
    @State private var selectedFilter = "All"
    @State private var showFavorites = false
    @State private var searchText = ""
   
    @State private var selectedUser = "All"

    let products = [
        Product(id: 1, imageName: "trending1", trendingText: "EarthWise community  \n shirt"),
        Product(id: 2, imageName: "trending2", trendingText: "Fresh Drink"),
        Product(id: 3, imageName: "trending3", trendingText: "Relax Coffee"),
    ]
    let bestproducts = [
        Product(id: 1, imageName: "bestseller1", trendingText: "Joy Cup"),
        Product(id: 2, imageName: "bestseller2", trendingText: "Fresh Drink"),
        Product(id: 3, imageName: "bestseller3", trendingText: "Relax Coffee"),
    ]

    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                
                   
                Image("welcome")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)

            

            

                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 11)

                    TextField("Search in products...", text: $searchText)
                        .padding(.vertical, 11)
                        .padding(.horizontal, 15)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(35)
                        .font(.system(size: 14))

                   
                }
                .padding(.horizontal)

               

                Text("Trending")
                    .font(.custom("PlayfairDisplay-Regular", size: 24))
                    .fontWeight(.bold)
                    .padding(.leading, -160)
                    .padding(.top, 8)
                    

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(products) { product in
                            VStack {
                                ZStack(alignment: .topTrailing) {
                                    Image(product.imageName)
                                        .resizable()
                                        .frame(width: 160, height: 160)
                                        .cornerRadius(20.0)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.gray, lineWidth: 1)
                                        )
                                    Image("trending")
                                        .resizable()
                                        .frame(width: 25, height: 30)
                                        .padding(EdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 0))
                                }

                                Text(product.trendingText)
                                    
                            }
                        }
                    }
                }.padding(.top)
                    .padding(.leading , 35)

                Spacer()
                
                Text("BestSellers")
                    .font(.custom("PlayfairDisplay-Regular", size: 24))
                    .fontWeight(.bold)
                    .padding(.leading, -160)
                    .padding(.top, 8)
                    

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(bestproducts) { product in
                            VStack {
                                ZStack(alignment: .topTrailing) {
                                    Image(product.imageName)
                                        .resizable()
                                        .frame(width: 160, height: 160)
                                        .cornerRadius(20.0)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.gray, lineWidth: 1)
                                        )
                                    Image("bestseller")
                                        .resizable()
                                        .frame(width: 25, height: 30)
                                        .padding(EdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 0))
                                }

                                Text(product.trendingText)
                                    
                            }
                        }.padding(4)
                        
                    }
                }.padding(.top)
                    .padding(.leading , 35)

             
            }

        }
    }

    struct AllProducts_Previews: PreviewProvider {
        static var previews: some View {
            AllProducts()
        }
    }
}
