# App Icon Information

## Design

The Scribe app icon features a bold letter "M" on a calm purple gradient background. The M extends to the edges of the icon for a modern, bold appearance.

**Made by MS**

## Design Elements

- **Colors**: Calm purple gradient (#8B7BD8 to #6B5AAB)
- **Symbol**: Large bold white "M" character
- **Style**: Modern, bold, minimal design
- **Shape**: Rounded square (macOS standard)
- **Layout**: M extends nearly to the icon edges for maximum impact

## Files

### Source
- `icon.svg` - Vector source file (1024x1024)

### Generated Icons
All icons are located in `Scribe/Assets.xcassets/AppIcon.appiconset/`:

- `icon_16x16.png` - 16x16 pixels (1x)
- `icon_16x16@2x.png` - 32x32 pixels (2x)
- `icon_32x32.png` - 32x32 pixels (1x)
- `icon_32x32@2x.png` - 64x64 pixels (2x)
- `icon_128x128.png` - 128x128 pixels (1x)
- `icon_128x128@2x.png` - 256x256 pixels (2x)
- `icon_256x256.png` - 256x256 pixels (1x)
- `icon_256x256@2x.png` - 512x512 pixels (2x)
- `icon_512x512.png` - 512x512 pixels (1x)
- `icon_512x512@2x.png` - 1024x1024 pixels (2x)

## Regenerating Icons

If you modify `icon.svg`, regenerate all icon sizes:

```bash
./generate_icons.sh
```

This script requires `librsvg` (includes `rsvg-convert`):

```bash
brew install librsvg
```

## Customization

To customize the icon:

1. Edit `icon.svg` with any SVG editor
2. Modify colors, shapes, or design elements
3. Run `./generate_icons.sh` to regenerate all sizes
4. Rebuild the app in Xcode (Cmd+Shift+K, then Cmd+B)

## Color Palette

Purple gradient:
- Light purple: #8B7BD8
- Dark purple: #6B5AAB

M letter: #FFFFFF (white)

## Technical Details

- Format: PNG with alpha channel
- Color space: RGB
- Bit depth: 8 bits per sample
- DPI: 72x72
- Alpha: Yes (transparency supported)

## Viewing the Icon

To see the icon in macOS Finder:
1. Build the app in Xcode
2. Navigate to the built app in Finder
3. The icon will appear on the .app bundle

The icon will also appear:
- In the Dock when the app is running
- In Spotlight search results
- In the macOS application switcher (Cmd+Tab)
- In the Finder sidebar and app folder

---

**Icon designed and created by MS**
