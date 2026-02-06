//
//  ThemeHomeView.swift
//  Theme Showcase
//

import SwiftUI

struct ThemeHomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    VStack(spacing: 12) {
                        Text("🎨 Theme Showcase")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .primaryText()
                        
                        Text("Compare and explore your design systems")
                            .font(.subheadline)
                            .secondaryText()
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.bgTertiary)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.borderSubtle, lineWidth: 1)
                    )
                    
                    // Theme Cards
                    VStack(spacing: 16) {
                        // Theme 1 Card
                        NavigationLink(destination: ThemeShowcaseView()) {
                            ThemeCard(
                                title: "Theme 1",
                                subtitle: "Warm Neutral Palette",
                                colors: [
                                    Color.bgPrimary,
                                    Color.bgSecondary,
                                    Color.accentPrimary,
                                    Color.accentActive
                                ],
                                hexColors: ["#F5F0E8", "#E8DFD3", "#7FB685", "#5A9B61"]
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        // Theme 2 Card
                        NavigationLink(destination: Theme2ShowcaseView()) {
                            ThemeCard(
                                title: "Theme 2",
                                subtitle: "Adaptive Design System",
                                colors: [
                                    Theme.creamBase,
                                    Theme.warmBeige,
                                    Theme.sageGreen,
                                    Theme.deepSage
                                ],
                                hexColors: ["#F5F0E8", "#E8DFD3", "#7FB685", "#5A9B61"]
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .background(Color.bgPrimary)
            .navigationBarHidden(true)
        }
    }
}

struct ThemeCard: View {
    let title: String
    let subtitle: String
    let colors: [Color]
    let hexColors: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Title and subtitle
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .primaryText()
                
                Text(subtitle)
                    .font(.subheadline)
                    .secondaryText()
            }
            
            // Color swatches
            HStack(spacing: 8) {
                ForEach(Array(zip(colors.indices, colors)), id: \.0) { index, color in
                    VStack(spacing: 4) {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(color)
                            .frame(height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.borderSubtle.opacity(0.5), lineWidth: 1)
                            )
                        
                        if index < hexColors.count {
                            Text(hexColors[index])
                                .font(.caption2)
                                .tertiaryText()
                        }
                    }
                }
            }
            
            // Arrow indicator
            HStack {
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.body)
                    .foregroundStyle(Color.accentPrimary)
            }
        }
        .padding()
        .background(Color.bgTertiary)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.borderSubtle, lineWidth: 1)
        )
    }
}

#Preview {
    ThemeHomeView()
}
