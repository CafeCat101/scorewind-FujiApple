//
//  MyMenuStyle.swift
//  MyMenuStyle
//
//  Created by Leonore Yardimli on 2021/10/7.
//

import Foundation
import SwiftUI

struct MyMenuStyle: MenuStyle {
		func makeBody(configuration: Configuration) -> some View {
				Menu(configuration)
				.frame(maxWidth: .infinity)
		}
}
