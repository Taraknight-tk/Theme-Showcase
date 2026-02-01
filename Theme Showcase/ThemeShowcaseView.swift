//
//  ThemeShowcaseView.swift
//  Theme Showcase
//

import SwiftUI

struct ThemeShowcaseView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
                    // Header
                    headerSection
                    
                    // Color Palette
                    colorPaletteSection
                    
                    // Backgrounds
                    backgroundsSection
                    
                    // Text Styles
                    textStylesSection
                    
                    // Text on Backgrounds Matrix
                    textOnBackgroundsSection
                    
                    // Accent Colors
                    accentColorsSection
                    
                    // Border Styles
                    borderStylesSection
                    
                    // Themed Components
                    themedComponentsSection
                    
                    // Interactive Elements
                    interactiveElementsSection
                }
                .padding()
            }
            .background(Color.bgPrimary)
            .navigationTitle("Theme Showcase")
            .toolbarBackground(Color.bgSecondary, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        VStack(spacing: 10) {
            Text("🎨 Theme Design System")
                .font(.largeTitle)
                .fontWeight(.bold)
                .primaryText()
            
            Text("A comprehensive showcase of all theme colors, styles, and components")
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
    }
    
    // MARK: - Color Palette Section
    private var colorPaletteSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            sectionTitle("Complete Color Palette")
            
            VStack(spacing: 12) {
                colorGroup(title: "Backgrounds", colors: [
                    ("Primary", Color.bgPrimary, "#F5F0E8"),
                    ("Secondary", Color.bgSecondary, "#E8DFD3"),
                    ("Tertiary", Color.bgTertiary, "#FDFCFA")
                ])
                
                colorGroup(title: "Text", colors: [
                    ("Primary", Color.textPrimary, "#4A4540"),
                    ("Secondary", Color.textSecondary, "#6B6460"),
                    ("Tertiary", Color.textTertiary, "#9B938E")
                ])
                
                colorGroup(title: "Accents", colors: [
                    ("Primary", Color.accentPrimary, "#7FB685"),
                    ("Active", Color.accentActive, "#5A9B61"),
                    ("Muted", Color.accentMuted, "#9BB896")
                ])
                
                colorGroup(title: "Borders", colors: [
                    ("Subtle", Color.borderSubtle, "#D4C7B8"),
                    ("Emphasis", Color.borderEmphasis, "#A89B8E")
                ])
            }
        }
    }
    
    // MARK: - Backgrounds Section
    private var backgroundsSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            sectionTitle("Background Colors")
            
            VStack(spacing: 12) {
                backgroundSwatch("Primary Background", color: .bgPrimary, hex: "#F5F0E8")
                backgroundSwatch("Secondary Background", color: .bgSecondary, hex: "#E8DFD3")
                backgroundSwatch("Tertiary Background", color: .bgTertiary, hex: "#FDFCFA")
            }
        }
    }
    
    // MARK: - Text Styles Section
    private var textStylesSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            sectionTitle("Text Styles & Hierarchy")
            
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Primary Text")
                        .font(.headline)
                        .secondaryText()
                    Text("Used for main content, headings, and important information")
                        .font(.title2)
                        .primaryText()
                    Text("#4A4540 - Dark Brown")
                        .font(.caption)
                        .tertiaryText()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.bgTertiary)
                .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Secondary Text")
                        .font(.headline)
                        .secondaryText()
                    Text("Used for supporting information and descriptions")
                        .font(.body)
                        .secondaryText()
                    Text("#6B6460 - Medium Brown")
                        .font(.caption)
                        .tertiaryText()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.bgTertiary)
                .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Tertiary Text")
                        .font(.headline)
                        .secondaryText()
                    Text("Used for captions, timestamps, and subtle information")
                        .font(.caption)
                        .tertiaryText()
                    Text("#9B938E - Light Brown")
                        .font(.caption)
                        .tertiaryText()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.bgTertiary)
                .cornerRadius(8)
            }
        }
    }
    
    // MARK: - Text on Backgrounds Matrix
    private var textOnBackgroundsSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            sectionTitle("Text Color Combinations")
            
            Text("All text styles on each background color")
                .font(.caption)
                .tertiaryText()
            
            VStack(spacing: 12) {
                // Primary Background
                textCombinationCard(
                    background: .bgPrimary,
                    backgroundName: "Primary Background"
                )
                
                // Secondary Background
                textCombinationCard(
                    background: .bgSecondary,
                    backgroundName: "Secondary Background"
                )
                
                // Tertiary Background
                textCombinationCard(
                    background: .bgTertiary,
                    backgroundName: "Tertiary Background"
                )
            }
        }
    }
    
    // MARK: - Accent Colors Section
    private var accentColorsSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            sectionTitle("Accent Colors")
            
            Text("Used for interactive elements, highlights, and emphasis")
                .font(.caption)
                .tertiaryText()
            
            VStack(spacing: 12) {
                accentSwatch(
                    "Primary Accent",
                    color: .accentPrimary,
                    hex: "#7FB685",
                    description: "Main interactive elements"
                )
                
                accentSwatch(
                    "Active Accent",
                    color: .accentActive,
                    hex: "#5A9B61",
                    description: "Active states, selected items"
                )
                
                accentSwatch(
                    "Muted Accent",
                    color: .accentMuted,
                    hex: "#9BB896",
                    description: "Subtle highlights, secondary actions"
                )
            }
        }
    }
    
    // MARK: - Border Styles Section
    private var borderStylesSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            sectionTitle("Border Styles")
            
            VStack(spacing: 12) {
                HStack(spacing: 12) {
                    VStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.bgTertiary)
                            .frame(height: 80)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.borderSubtle, lineWidth: 1)
                            )
                        Text("Subtle Border")
                            .font(.caption)
                            .secondaryText()
                        Text("#D4C7B8")
                            .font(.caption2)
                            .tertiaryText()
                    }
                    
                    VStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.bgTertiary)
                            .frame(height: 80)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.borderEmphasis, lineWidth: 2)
                            )
                        Text("Emphasis Border")
                            .font(.caption)
                            .secondaryText()
                        Text("#A89B8E")
                            .font(.caption2)
                            .tertiaryText()
                    }
                }
            }
        }
    }
    
    // MARK: - Themed Components Section
    private var themedComponentsSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            sectionTitle("Themed Components")
            
            Text("Custom view modifiers available")
                .font(.caption)
                .tertiaryText()
            
            VStack(spacing: 16) {
                // Themed Section Example
                VStack(alignment: .leading, spacing: 8) {
                    Text(".themedSection() modifier")
                        .font(.headline)
                        .primaryText()
                    Text("Applies tertiary background with subtle border separator")
                        .font(.caption)
                        .secondaryText()
                }
                .padding()
                .themedSection()
                .cornerRadius(8)
                
                // Text Style Modifiers
                VStack(alignment: .leading, spacing: 12) {
                    Text("Text Style Modifiers:")
                        .font(.headline)
                        .primaryText()
                    
                    HStack {
                        Text(".primaryText()")
                            .primaryText()
                        Spacer()
                        Text("Primary")
                            .font(.caption)
                            .tertiaryText()
                    }
                    
                    HStack {
                        Text(".secondaryText()")
                            .secondaryText()
                        Spacer()
                        Text("Secondary")
                            .font(.caption)
                            .tertiaryText()
                    }
                    
                    HStack {
                        Text(".tertiaryText()")
                            .tertiaryText()
                        Spacer()
                        Text("Tertiary")
                            .font(.caption)
                            .tertiaryText()
                    }
                }
                .padding()
                .background(Color.bgTertiary)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.borderSubtle, lineWidth: 1)
                )
            }
        }
    }
    
    // MARK: - Interactive Elements Section
    private var interactiveElementsSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            sectionTitle("Interactive Elements")
            
            VStack(spacing: 16) {
                // Buttons
                VStack(alignment: .leading, spacing: 12) {
                    Text("Buttons")
                        .font(.headline)
                        .primaryText()
                    
                    HStack(spacing: 12) {
                        Button("Primary") { }
                            .buttonStyle(.borderedProminent)
                            .tint(.accentPrimary)
                        
                        Button("Secondary") { }
                            .buttonStyle(.bordered)
                            .tint(.accentPrimary)
                        
                        Button("Plain") { }
                            .buttonStyle(.plain)
                            .foregroundStyle(Color.accentActive)
                    }
                }
                .padding()
                .background(Color.bgTertiary)
                .cornerRadius(8)
                
                // Toggles
                VStack(alignment: .leading, spacing: 12) {
                    Text("Toggles & Switches")
                        .font(.headline)
                        .primaryText()
                    
                    Toggle("Enabled Toggle", isOn: .constant(true))
                        .tint(.accentPrimary)
                    
                    Toggle("Disabled Toggle", isOn: .constant(false))
                        .tint(.accentPrimary)
                }
                .padding()
                .background(Color.bgTertiary)
                .cornerRadius(8)
                
                // Progress Views
                VStack(alignment: .leading, spacing: 12) {
                    Text("Progress Indicators")
                        .font(.headline)
                        .primaryText()
                    
                    ProgressView(value: 0.7)
                        .tint(.accentPrimary)
                    
                    ProgressView()
                        .tint(.accentPrimary)
                }
                .padding()
                .background(Color.bgTertiary)
                .cornerRadius(8)
                
                // Links
                VStack(alignment: .leading, spacing: 12) {
                    Text("Links")
                        .font(.headline)
                        .primaryText()
                    
                    Link("Primary Link", destination: URL(string: "https://example.com")!)
                        .foregroundStyle(Color.accentPrimary)
                    
                    Link("Active Link", destination: URL(string: "https://example.com")!)
                        .foregroundStyle(Color.accentActive)
                }
                .padding()
                .background(Color.bgTertiary)
                .cornerRadius(8)
            }
        }
    }
    
    // MARK: - Helper Views
    
    private func sectionTitle(_ text: String) -> some View {
        Text(text)
            .font(.title2)
            .fontWeight(.bold)
            .primaryText()
            .padding(.top, 8)
    }
    
    private func colorGroup(title: String, colors: [(String, Color, String)]) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .secondaryText()
            
            HStack(spacing: 12) {
                ForEach(colors, id: \.0) { name, color, hex in
                    VStack(spacing: 4) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(color)
                            .frame(height: 60)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.borderSubtle, lineWidth: 1)
                            )
                        Text(name)
                            .font(.caption)
                            .primaryText()
                        Text(hex)
                            .font(.caption2)
                            .tertiaryText()
                    }
                }
            }
        }
        .padding()
        .background(Color.bgTertiary)
        .cornerRadius(8)
    }
    
    private func backgroundSwatch(_ name: String, color: Color, hex: String) -> some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(name)
                        .font(.headline)
                        .primaryText()
                    Text(hex)
                        .font(.caption)
                        .tertiaryText()
                }
                Spacer()
            }
            .padding()
            .background(color)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.borderSubtle, lineWidth: 1)
            )
        }
    }
    
    private func textCombinationCard(background: Color, backgroundName: String) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(backgroundName)
                .font(.caption)
                .fontWeight(.semibold)
                .tertiaryText()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Primary Text - Lorem ipsum dolor")
                    .primaryText()
                Text("Secondary Text - Lorem ipsum dolor")
                    .secondaryText()
                Text("Tertiary Text - Lorem ipsum dolor")
                    .tertiaryText()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(background)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.borderSubtle, lineWidth: 1)
            )
        }
    }
    
    private func accentSwatch(_ name: String, color: Color, hex: String, description: String) -> some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 8)
                .fill(color)
                .frame(width: 60, height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.borderSubtle, lineWidth: 1)
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)
                    .primaryText()
                Text(hex)
                    .font(.caption)
                    .tertiaryText()
                Text(description)
                    .font(.caption)
                    .secondaryText()
            }
            
            Spacer()
        }
        .padding()
        .background(Color.bgTertiary)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.borderSubtle, lineWidth: 1)
        )
    }
}

#Preview {
    ThemeShowcaseView()
}
