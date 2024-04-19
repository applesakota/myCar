//
//  StatisticItemEnvironments.swift
//  myCar
//
//  Created by Petar Sakotic on 3/31/24.
//

import SwiftUI

private struct StatisticItemIconColorKey: EnvironmentKey {
    static let defaultValue: ThemeColorIdentifier = .black
}

private struct StatisticItemTitleColorKey: EnvironmentKey {
    static let defaultValue: ThemeColorIdentifier = .black
}

private struct StatisticItemValueColorKey: EnvironmentKey {
    static let defaultValue: ThemeColorIdentifier = .black
}

private struct StatisticItemCornerRadiusKey: EnvironmentKey {
    static let defaultValue: CGFloat = 5
}

extension EnvironmentValues {
    var StatisticItemIconColor: ThemeColorIdentifier {
        get { self[StatisticItemIconColorKey.self] }
        set { self[StatisticItemIconColorKey.self] = newValue }
    }

    var StatisticItemTitleColor: ThemeColorIdentifier {
        get { self[StatisticItemTitleColorKey.self] }
        set { self[StatisticItemTitleColorKey.self] = newValue }
    }

    var StatisticItemValueColor: ThemeColorIdentifier {
        get { self[StatisticItemValueColorKey.self] }
        set { self[StatisticItemValueColorKey.self] = newValue }
    }

    var StatisticItemCornerRadius: CGFloat {
        get { self[StatisticItemCornerRadiusKey.self] }
        set { self[StatisticItemCornerRadiusKey.self] = newValue }
    }
}

extension View {
    func statisticItemIconColor(_ color: ThemeColorIdentifier) -> some View {
        environment(\.StatisticItemIconColor, color)
    }

    func statisticItemTitleColor(_ color: ThemeColorIdentifier) -> some View {
        environment(\.StatisticItemTitleColor, color)
    }

    func statisticItemValueColor(_ color: ThemeColorIdentifier) -> some View {
        environment(\.StatisticItemValueColor, color)
    }

    func statisticItemCornerRadius(_ cornerRadius: CGFloat) -> some View {
        environment(\.StatisticItemCornerRadius, cornerRadius)
    }
}

