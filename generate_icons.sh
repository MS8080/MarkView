#!/bin/bash

# Icon Generator Script for Scribe
# Converts icon.svg to all required macOS app icon sizes

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SVG_FILE="$SCRIPT_DIR/icon.svg"
ICONS_DIR="$SCRIPT_DIR/Scribe/Assets.xcassets/AppIcon.appiconset"

# Check if SVG file exists
if [ ! -f "$SVG_FILE" ]; then
    echo "[ERROR] icon.svg not found at $SVG_FILE"
    exit 1
fi

echo "Scribe Icon Generator"
echo "======================="
echo ""
echo "Source: $SVG_FILE"
echo "Target: $ICONS_DIR"
echo ""

# Create icons directory if it doesn't exist
mkdir -p "$ICONS_DIR"

# Array of sizes needed for macOS app icons
# Format: "size filename"
declare -a SIZES=(
    "16 icon_16x16.png"
    "32 icon_16x16@2x.png"
    "32 icon_32x32.png"
    "64 icon_32x32@2x.png"
    "128 icon_128x128.png"
    "256 icon_128x128@2x.png"
    "256 icon_256x256.png"
    "512 icon_256x256@2x.png"
    "512 icon_512x512.png"
    "1024 icon_512x512@2x.png"
)

# Function to convert SVG to PNG using available tools
convert_icon() {
    local size=$1
    local output=$2

    # Try rsvg-convert first (best quality)
    if command -v rsvg-convert &> /dev/null; then
        rsvg-convert -w $size -h $size "$SVG_FILE" -o "$output"
        return 0
    fi

    # Try ImageMagick convert
    if command -v convert &> /dev/null; then
        convert -background none -resize ${size}x${size} "$SVG_FILE" "$output"
        return 0
    fi

    # Try qlmanage + sips (macOS built-in, lower quality)
    if command -v qlmanage &> /dev/null && command -v sips &> /dev/null; then
        # Generate preview
        qlmanage -t -s $size -o "$ICONS_DIR" "$SVG_FILE" &> /dev/null
        # Find the generated PNG
        local temp_png="${SVG_FILE%.*}.png"
        if [ -f "$temp_png" ]; then
            sips -Z $size "$temp_png" --out "$output" &> /dev/null
            rm "$temp_png"
            return 0
        fi
    fi

    echo "[ERROR] No suitable image conversion tool found."
    echo "Please install one of: rsvg-convert, ImageMagick, or use macOS built-in tools"
    return 1
}

# Check for available tools
echo "Checking for image conversion tools..."
if command -v rsvg-convert &> /dev/null; then
    echo "[OK] Found rsvg-convert (best quality)"
    TOOL="rsvg-convert"
elif command -v convert &> /dev/null; then
    echo "[OK] Found ImageMagick convert"
    TOOL="imagemagick"
elif command -v sips &> /dev/null; then
    echo "[OK] Found macOS sips (using built-in tools)"
    TOOL="sips"
else
    echo "[ERROR] No suitable conversion tool found"
    echo ""
    echo "Install one of these:"
    echo "  brew install librsvg          # for rsvg-convert (recommended)"
    echo "  brew install imagemagick      # for convert"
    exit 1
fi

echo ""
echo "Generating icons..."
echo ""

# Generate all icon sizes
count=0
total=${#SIZES[@]}

for item in "${SIZES[@]}"; do
    size=$(echo $item | cut -d' ' -f1)
    filename=$(echo $item | cut -d' ' -f2)
    output="$ICONS_DIR/$filename"

    printf "  [%2d/%2d] Generating %s (%dx%d)..." $((count+1)) $total "$filename" $size $size

    if convert_icon $size "$output"; then
        echo " [OK]"
        count=$((count+1))
    else
        echo " [FAIL]"
        exit 1
    fi
done

echo ""
echo "=============================="
echo "[OK] Generated $count/$total icons successfully"
echo ""
echo "Icons saved to:"
echo "  $ICONS_DIR"
echo ""
echo "Next steps:"
echo "1. Open Scribe.xcodeproj in Xcode"
echo "2. The new app icon should appear automatically"
echo "3. Clean and rebuild the project (Cmd+Shift+K, then Cmd+B)"
echo ""
