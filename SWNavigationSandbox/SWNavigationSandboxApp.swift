//
//  SWNavigationSandboxApp.swift
//  SWNavigationSandbox
//
//  Created by Leonore Yardimli on 2021/10/3.
//

import SwiftUI

@main
struct SWNavigationSandboxApp: App {
	@StateObject var wizardElement = WizardElement()
	
	var body: some Scene {
		WindowGroup {
			WelcomeView().environmentObject(wizardElement)
		}
	}
}
