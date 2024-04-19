//
//  CarEnvironments.swift
//  myCar
//
//  Created by Petar Sakotic on 4/1/24.
//

import SwiftUI

private struct CarTitleColorKey: EnvironmentKey {
    static let defaultValue: ThemeColorIdentifier = .solidGray
}

private struct CarValueColorKey: EnvironmentKey {
    static let defaultValue: ThemeColorIdentifier = .solidGray
}

private struct CarDescriptionColorKey: EnvironmentKey {
    static let defaultValue: ThemeColorIdentifier = .solidGray
}

private struct CarCircleIconColorKey: EnvironmentKey {
    static let defaultValue: ThemeColorIdentifier = .solidGray
}

private struct CarCircleValueColorKey: EnvironmentKey {
    static let defaultValue: ThemeColorIdentifier = .solidGray
}

private struct CarCircleStrokeColorKey: EnvironmentKey {
    static let defaultValue: ThemeColorIdentifier = .solidGray
}


extension EnvironmentValues {
    var CarTitleColor: ThemeColorIdentifier {
        get { self[CarTitleColorKey.self] }
        set { self[CarTitleColorKey.self] = newValue }
    }
    
    var CarValueColor: ThemeColorIdentifier {
        get { self[CarValueColorKey.self] }
        set { self[CarValueColorKey.self] = newValue }
    }
    
    var CarDescriptionColor: ThemeColorIdentifier {
        get { self[CarDescriptionColorKey.self] }
        set { self[CarDescriptionColorKey.self] = newValue }
    }
    
    var CarCircleIconColor: ThemeColorIdentifier {
        get { self[CarCircleIconColorKey.self] }
        set { self[CarCircleIconColorKey.self] = newValue }
    }
    
    var CarCircleValueColor: ThemeColorIdentifier {
        get { self[CarCircleValueColorKey.self] }
        set { self[CarCircleValueColorKey.self] = newValue }
    }
    
    var CarCircleStrokeColor: ThemeColorIdentifier {
        get { self[CarCircleStrokeColorKey.self] }
        set { self[CarCircleStrokeColorKey.self] = newValue }
    }
}

extension View {
    func carTitleColor(_ color: ThemeColorIdentifier) -> some View {
        environment(\.CarTitleColor, color)
    }
    
    func carValueColor(_ color: ThemeColorIdentifier) -> some View {
        environment(\.CarValueColor, color)
    }
    
    func carDescriptionColor(_ color: ThemeColorIdentifier) -> some View {
        environment(\.CarDescriptionColor, color)
    }
    
    func carCircleIconColor(_ color: ThemeColorIdentifier) -> some View {
        environment(\.CarCircleIconColor, color)
    }
    
    func carCircleValueColor(_ color: ThemeColorIdentifier) -> some View {
        environment(\.CarCircleValueColor, color)
    }
    
    func carCircleStrokeColor(_ color: ThemeColorIdentifier) -> some View {
        environment(\.CarCircleStrokeColor, color)
    }
}
