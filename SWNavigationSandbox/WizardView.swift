//
//  WizardView.swift
//  WizardView
//
//  Created by Leonore Yardimli on 2021/10/3.
//

import SwiftUI

struct WizardView: View {
	@State private var isCurrentView = true
	var body: some View {
		if isCurrentView == true {
			VStack{
				Text("wizard start")
					.font(.title)
				Text("Which instrument do you want to play?")
				Button("Guitar"){
					withAnimation{
						self.isCurrentView = false
					}
				}
				Button("Violin"){
					withAnimation{
						self.isCurrentView = false
					}
				}
				Button("Piano"){
					withAnimation{
						self.isCurrentView = false
					}
				}
			}
			
		}else{
			CourseTypeView()
				.transition(.scale)
		}
	}
}

struct WizardView_Previews: PreviewProvider {
	static var previews: some View {
		WizardView()
	}
}
