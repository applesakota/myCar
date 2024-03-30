//
//  SuperchargerEnvironments.swift
//  myCar
//
//  Created by Petar Sakotic on 3/29/24.
//

import SwiftUI

private struct SuperchargerTitleColorKey: EnvironmentKey {
    static let defaultValue: ThemeColorIdentifier = .black
}

private struct SuperchargerValueColorKey: EnvironmentKey {
    static let defaultValue: ThemeColorIdentifier = .black
}

private struct SuperchargerDistanceColorKey: EnvironmentKey {
    static let defaultValue: ThemeColorIdentifier = .black
}

private struct SuperchargerIconColorKey: EnvironmentKey {
    static let defaultValue: ThemeColorIdentifier = .black
}

private struct SuperchargerCornerRadiusKey: EnvironmentKey {
    static let defaultValue: CGFloat = 5
}


extension EnvironmentValues {
    var SuperchargerTitleColor: ThemeColorIdentifier {
        get { self[SuperchargerTitleColorKey.self] }
        set { self[SuperchargerTitleColorKey.self] = newValue }
    }
    
    var SuperchargerValueColor: ThemeColorIdentifier {
        get { self[SuperchargerValueColorKey.self] }
        set { self[SuperchargerValueColorKey.self] = newValue }
    }
    
    var SuperchargerDistanceColor: ThemeColorIdentifier {
        get { self[SuperchargerDistanceColorKey.self] }
        set { self[SuperchargerDistanceColorKey.self] = newValue }
    }
    
    var SuperchargerIconColor: ThemeColorIdentifier {
        get { self[SuperchargerIconColorKey.self] }
        set { self[SuperchargerIconColorKey.self] = newValue }
    }
    
    var SuperchargerCornerRadius: CGFloat {
        get { self[SuperchargerCornerRadiusKey.self] }
        set { self[SuperchargerCornerRadiusKey.self] = newValue }
    }
}

extension View {
    func superchargerTitleColor(_ color: ThemeColorIdentifier) -> some View {
        environment(\.SuperchargerTitleColor, color)
    }
    
    func superchargerValueColor(_ color: ThemeColorIdentifier) -> some View {
        environment(\.SuperchargerValueColor, color)
    }
    
    func superchargerDistanceColor(_ color: ThemeColorIdentifier) -> some View {
        environment(\.SuperchargerDistanceColor, color)
    }
    
    func superchargerIconColor(_ color: ThemeColorIdentifier) -> some View {
        environment(\.SuperchargerIconColor, color)
    }
    
    func superchargerCornerRadius(_ cornerRadius: CGFloat) -> some View {
        environment(\.SuperchargerCornerRadius, cornerRadius)
    }
}
