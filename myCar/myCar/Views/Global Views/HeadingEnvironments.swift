//
//  HeadingEnvironments.swift
//  myCar
//
//  Created by Petar Sakotic on 3/31/24.
//

import SwiftUI

private struct HeadingTitleColorKey: EnvironmentKey {
    static let defaultValue: ThemeColorIdentifier = .black
}

private struct HeadingValueColorKey: EnvironmentKey {
    static let defaultValue: ThemeColorIdentifier = .black
}

extension EnvironmentValues {
    var HeadingTitleColor: ThemeColorIdentifier {
        get { self[HeadingTitleColorKey.self] }
        set { self[HeadingTitleColorKey.self] = newValue }
    }

    var HeadingValueColor: ThemeColorIdentifier {
        get { self[HeadingValueColorKey.self] }
        set { self[HeadingValueColorKey.self] = newValue }
    }
}

extension View {
    func headingTitleColor(_ color: ThemeColorIdentifier) -> some View {
        environment(\.HeadingTitleColor, color)
    }

    func headingValueColor(_ color: ThemeColorIdentifier) -> some View {
        environment(\.HeadingValueColor, color)
    }
}

