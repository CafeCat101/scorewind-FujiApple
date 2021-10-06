//
//  WelcomeView.swift
//  WelcomeView
//
//  Created by Leonore Yardimli on 2021/10/3.
//

import SwiftUI

struct WelcomeView: View {
	@State var currentPage: Page = .wizard
	@State private var showWelcome = true
	
	var body: some View {
		if showWelcome == true {
			Text("Welcome!")
				.onAppear{
					DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
						withAnimation{
							self.showWelcome = false
							self.currentPage = .wizard
						}
					}
				}
		}else{
			if currentPage == .learn {
				CourseForYouView()
					.transition(.scale)
			}else{
				WizardView()
					.transition(.scale)
			}
		}
	}
}

struct WelcomeView_Previews: PreviewProvider {
	static var previews: some View {
		WelcomeView()
	}
}
