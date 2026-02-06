//
//  Theme2ShowcaseView.swift
//  Theme Showcase
//

import SwiftUI

struct Theme2ShowcaseView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Header
                headerSection
                
                // Color Palette
                colorPaletteSection
                
                // Typography
                typographySection
                
                // Level Indicators
                levelIndicatorsSection
                
                // Themed Components
                themedComponentsSection
                
                // Button Styles
                buttonStylesSection
                
                // Metrics & Spacing
                metricsSection
            }
            .padding()
        }
        .background(Theme.appBackground)
        .navigationTitle("Theme 2 Showcase")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Theme.secondarySurface, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        VStack(spacing: 10) {
            Text("🎨 Advanced Design System")
                .font(Theme.Typography.largeTitle)
                .foregroundStyle(Theme.primaryText)
            
            Text("Adaptive theme with dark mode support, level indicators, and comprehensive component library")
                .font(Theme.Typography.subheadline)
                .foregroundStyle(Theme.secondaryText)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .themedCardBackground()
    }
    
    // MARK: - Color Palette Section
    private var colorPaletteSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            sectionTitle("Color Palette")
            
            VStack(spacing: 12) {
                colorGroup(title: "Primary Colors", colors: [
                    ("Cream Base", Theme.creamBase, "#F5F0E8"),
                    ("Warm Beige", Theme.warmBeige, "#E8DFD3"),
                    ("Soft Taupe", Theme.softTaupe, "#D4C7B8"),
                    ("Medium Taupe", Theme.mediumTaupe, "#A89B8E")
                ])
                
                colorGroup(title: "Accent Colors", colors: [
                    ("Sage Green", Theme.sageGreen, "#7FB685"),
                    ("Deep Sage", Theme.deepSage, "#5A9B61"),
                    ("Olive Mist", Theme.oliveMist, "#9BB896")
                ])
                
                colorGroup(title: "Neutral Colors", colors: [
                    ("Charcoal", Theme.charcoalText, "#4A4540"),
                    ("Medium Gray", Theme.mediumGrayText, "#6B6460"),
                    ("Light Gray", Theme.lightGrayText, "#9B938E")
                ])
                
                colorGroup(title: "Semantic Colors", colors: [
                    ("App Background", Theme.appBackground, "Adaptive"),
                    ("Card Background", Theme.cardBackground, "Adaptive"),
                    ("Secondary Surface", Theme.secondarySurface, "Adaptive")
                ])
            }
        }
    }
    
    // MARK: - Typography Section
    private var typographySection: some View {
        VStack(alignment: .leading, spacing: 15) {
            sectionTitle("Typography Scale")
            
            VStack(alignment: .leading, spacing: 16) {
                typographyExample("Large Title", font: Theme.Typography.largeTitle, sample: "The quick brown fox")
                typographyExample("Title 1", font: Theme.Typography.title1, sample: "The quick brown fox")
                typographyExample("Title 2", font: Theme.Typography.title2, sample: "The quick brown fox")
                typographyExample("Title 3", font: Theme.Typography.title3, sample: "The quick brown fox")
                typographyExample("Headline", font: Theme.Typography.headline, sample: "The quick brown fox jumps")
                typographyExample("Subheadline", font: Theme.Typography.subheadline, sample: "The quick brown fox jumps over")
                typographyExample("Body", font: Theme.Typography.body, sample: "The quick brown fox jumps over the lazy dog")
                typographyExample("Callout", font: Theme.Typography.callout, sample: "The quick brown fox jumps over the lazy dog")
                typographyExample("Footnote", font: Theme.Typography.footnote, sample: "The quick brown fox jumps over the lazy dog and runs away")
                typographyExample("Caption", font: Theme.Typography.caption, sample: "The quick brown fox jumps over the lazy dog and runs away into the forest")
            }
        }
    }
    
    // MARK: - Level Indicators Section
    private var levelIndicatorsSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            sectionTitle("Level Indicators")
            
            Text("Muted color palette for level-based progression")
                .font(Theme.Typography.caption)
                .foregroundStyle(Theme.secondaryText)
            
            VStack(spacing: 12) {
                levelIndicator(
                    level: 0,
                    primaryColor: Theme.level0Primary,
                    backgroundColor: Theme.level0Background,
                    hex: "#7FB685 / #E8F3EA"
                )
                
                levelIndicator(
                    level: 1,
                    primaryColor: Theme.level1Primary,
                    backgroundColor: Theme.level1Background,
                    hex: "#E8D9B5 / #F7F3E8",
                    accentColor: Theme.level1Accent
                )
                
                levelIndicator(
                    level: 2,
                    primaryColor: Theme.level2Primary,
                    backgroundColor: Theme.level2Background,
                    hex: "#E3C5A8 / #E7DDD0",
                    accentColor: Theme.level2Accent
                )
                
                levelIndicator(
                    level: 3,
                    primaryColor: Theme.level3Primary,
                    backgroundColor: Theme.level3Background,
                    hex: "#D4A59A / #E5D2CB",
                    accentColor: Theme.level3Accent
                )
            }
        }
    }
    
    // MARK: - Themed Components Section
    private var themedComponentsSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            sectionTitle("Themed Components")
            
            VStack(spacing: 16) {
                // Card Example
                VStack(alignment: .leading, spacing: 8) {
                    Text("Themed Card")
                        .font(Theme.Typography.headline)
                        .foregroundStyle(Theme.primaryText)
                    
                    Text("This is a sample card using the themedCardBackground modifier")
                        .font(Theme.Typography.body)
                        .foregroundStyle(Theme.secondaryText)
                }
                .padding()
                .themedCardBackground()
                
                // Progress Indicators
                VStack(alignment: .leading, spacing: 12) {
                    Text("Progress Indicators")
                        .font(Theme.Typography.headline)
                        .foregroundStyle(Theme.primaryText)
                    
                    ProgressView(value: 0.7)
                        .tint(Theme.sageGreen)
                    
                    ProgressView(value: 0.3)
                        .tint(Theme.deepSage)
                }
                .padding()
                .themedCardBackground()
            }
        }
    }
    
    // MARK: - Button Styles Section
    private var buttonStylesSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            sectionTitle("Button Styles")
            
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Primary Button")
                        .font(Theme.Typography.headline)
                        .foregroundStyle(Theme.primaryText)
                    
                    Button("Primary Action") { }
                        .buttonStyle(ThemedButtonStyle(kind: .primary))
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Secondary Button")
                        .font(Theme.Typography.headline)
                        .foregroundStyle(Theme.primaryText)
                    
                    Button("Secondary Action") { }
                        .buttonStyle(ThemedButtonStyle(kind: .secondary))
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Destructive Button")
                        .font(Theme.Typography.headline)
                        .foregroundStyle(Theme.primaryText)
                    
                    Button("Destructive Action") { }
                        .buttonStyle(ThemedButtonStyle(kind: .destructive))
                }
            }
            .padding()
            .themedCardBackground()
        }
    }
    
    // MARK: - Metrics Section
    private var metricsSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            sectionTitle("Metrics & Spacing")
            
            VStack(alignment: .leading, spacing: 12) {
                metricRow("Extra Extra Small", value: Theme.Metrics.xxs)
                metricRow("Extra Small", value: Theme.Metrics.xs)
                metricRow("Small", value: Theme.Metrics.sm)
                metricRow("Medium", value: Theme.Metrics.md)
                metricRow("Large", value: Theme.Metrics.lg)
                metricRow("Extra Large", value: Theme.Metrics.xl)
                metricRow("Extra Extra Large", value: Theme.Metrics.xxl)
                
                Divider()
                    .padding(.vertical, 8)
                
                Text("Corner Radii")
                    .font(Theme.Typography.headline)
                    .foregroundStyle(Theme.primaryText)
                
                metricRow("Small Radius", value: Theme.Metrics.radiusSm)
                metricRow("Medium Radius", value: Theme.Metrics.radiusMd)
                metricRow("Large Radius", value: Theme.Metrics.radiusLg)
                
                Divider()
                    .padding(.vertical, 8)
                
                Text("Component Heights")
                    .font(Theme.Typography.headline)
                    .foregroundStyle(Theme.primaryText)
                
                metricRow("Button Height", value: Theme.Metrics.buttonHeight)
                metricRow("Badge Size", value: Theme.Metrics.badgeSize)
                metricRow("Text Editor Min Height", value: Theme.Metrics.textEditorMinHeight)
            }
            .padding()
            .themedCardBackground()
        }
    }
    
    // MARK: - Helper Views
    
    private func sectionTitle(_ text: String) -> some View {
        Text(text)
            .font(Theme.Typography.title2)
            .foregroundStyle(Theme.primaryText)
            .padding(.top, 8)
    }
    
    private func colorGroup(title: String, colors: [(String, Color, String)]) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(Theme.Typography.headline)
                .foregroundStyle(Theme.secondaryText)
            
            VStack(spacing: 8) {
                ForEach(colors, id: \.0) { name, color, hex in
                    HStack(spacing: 12) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(color)
                            .frame(width: 60, height: 60)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Theme.softTaupe.opacity(0.3), lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text(name)
                                .font(Theme.Typography.body)
                                .foregroundStyle(Theme.primaryText)
                            Text(hex)
                                .font(Theme.Typography.caption)
                                .foregroundStyle(Theme.secondaryText)
                        }
                        
                        Spacer()
                    }
                }
            }
        }
        .padding()
        .themedCardBackground()
    }
    
    private func typographyExample(_ name: String, font: Font, sample: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(name)
                .font(Theme.Typography.caption)
                .foregroundStyle(Theme.secondaryText)
            Text(sample)
                .font(font)
                .foregroundStyle(Theme.primaryText)
        }
        .padding()
        .themedCardBackground(cornerRadius: Theme.Metrics.radiusMd)
    }
    
    private func levelIndicator(level: Int, primaryColor: Color, backgroundColor: Color, hex: String, accentColor: Color? = nil) -> some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 8) {
                        Text("Level \(level)")
                            .font(Theme.Typography.headline)
                            .foregroundStyle(Theme.primaryText)
                        
                        if let accent = accentColor {
                            Circle()
                                .fill(accent)
                                .frame(width: 8, height: 8)
                        }
                    }
                    
                    Text(hex)
                        .font(Theme.Typography.caption)
                        .foregroundStyle(Theme.secondaryText)
                }
                Spacer()
                
                // Level badge
                Text("\(level)")
                    .font(Theme.Typography.headline)
                    .foregroundStyle(.white)
                    .frame(width: Theme.Metrics.badgeSize, height: Theme.Metrics.badgeSize)
                    .background(primaryColor)
                    .cornerRadius(Theme.Metrics.radiusMd)
            }
            .padding()
            .background(backgroundColor)
        }
        .cornerRadius(Theme.Metrics.radiusLg)
        .overlay(
            RoundedRectangle(cornerRadius: Theme.Metrics.radiusLg)
                .stroke(primaryColor.opacity(0.3), lineWidth: 1)
        )
    }
    
    private func metricRow(_ name: String, value: CGFloat) -> some View {
        HStack {
            Text(name)
                .font(Theme.Typography.body)
                .foregroundStyle(Theme.primaryText)
            
            Spacer()
            
            HStack(spacing: 4) {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Theme.sageGreen.opacity(0.3))
                    .frame(width: value, height: 20)
                
                Text("\(Int(value))pt")
                    .font(Theme.Typography.caption)
                    .foregroundStyle(Theme.secondaryText)
                    .frame(minWidth: 40, alignment: .leading)
            }
        }
    }
}

#Preview {
    NavigationStack {
        Theme2ShowcaseView()
    }
}
