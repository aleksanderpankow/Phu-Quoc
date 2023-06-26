//
//  ExploreView.swift
//  PhuQuoc
//
//  Created by Aleksander Pankow on 10/06/2023.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var vm = ListingViewModel()
    @State var currrentPage = 1
    
    var body: some View {
        ScrollViewReader { scrollViewProxy in
            ScrollView{
                LazyVStack{
                    ForEach(vm.items, id: \.id) { item in
                        PlaceCardView(listing: item)
                            .padding(.horizontal)
                            .onAppear {
                                Task{
                                    if item == self.vm.items.last {
                                        print("last item")
                                        currrentPage = currrentPage + 1
                                        await vm.fetchDataPage(
                                            page: currrentPage,
                                            itemsPerPage: 5,
                                            listingType:nil,
                                            searchTerm:nil,
                                            nearby:nil,
                                            latitude:nil,
                                            longitude:nil,
                                            featured:false)
                                        if vm.totalPages <= 0 { print("Dont have more content") }
                                    }
                                }
                            }
                    }
                    if vm.totalPages <= 0 {
                        VStack{
                            Text("Dont have more content")
                                .padding(.bottom)
                            Spacer()
                        }
                        .frame(height: 180.0)
                    }
                }
                .padding(.top, 50)

            }
            .onAppear {
                Task{
                    await vm.fetchDataPage(
                        page: currrentPage,
                        itemsPerPage: 5,
                        listingType:nil,
                        searchTerm:nil,
                        nearby:nil,
                        latitude:nil,
                        longitude:nil,
                        featured:false)
                }
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
