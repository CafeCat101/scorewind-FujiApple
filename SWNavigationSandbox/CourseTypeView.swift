//
//  CourseTypeView.swift
//  CourseTypeView
//
//  Created by Leonore Yardimli on 2021/10/4.
//

import SwiftUI

struct CourseTypeView: View {
	@State private var isCurrentView = true
	var body: some View {
		if isCurrentView == true {
			VStack{
				Text("choose course type")
				Button("Path"){
					withAnimation{
						self.isCurrentView = false
					}
					
				}
				Button("Setp by Step"){
					withAnimation{
						self.isCurrentView = false
					}
					
				}
			}
		}else{
			ReadScoreAbilityView()
				.transition(.scale)
		}
		
	}
}

struct CourseTypeView_Previews: PreviewProvider {
	static var previews: some View {
		CourseTypeView()
	}
}
