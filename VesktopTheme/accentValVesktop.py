import json
import os
import colorsys

# Function to convert hex to HSL
def hex_to_hsl(hex_color):
    # Convert hex to RGB
    rgb = tuple(int(hex_color[i:i+2], 16) / 255 for i in (1, 3, 5))
    # Convert RGB to HSL
    h, l, s = colorsys.rgb_to_hls(*rgb)
    return (h * 360, s * 100, l * 100)

# Read pywal colors
jsonFile = os.path.expanduser('~') + "/.cache/wal/colors.json"
with open(jsonFile, 'r') as file:
    wal_colors = json.load(file)

# Get the accent color (assuming it's the first color in the palette)
accent_hex = wal_colors['colors']['color3']
accent_hsl = hex_to_hsl(accent_hex)

# Read the CSS file
sourceCss = os.path.expanduser('~') + "/dotfiles/VesktopTheme/Translucence.theme.css"
with open(sourceCss, 'r') as file:
    css_content = file.read()

# Replace the HSL values
css_content = css_content.replace('--accent-hue: 235;', f'--accent-hue: {accent_hsl[0]:.0f};')
css_content = css_content.replace('--accent-saturation: 85%;', f'--accent-saturation: {accent_hsl[1]:.0f}%;')
css_content = css_content.replace('--accent-lightness: 66%;', f'--accent-lightness: {accent_hsl[2]:.0f}%;')
css_content = css_content.replace('--reply-hue: 235;', f'--reply-hue: {accent_hsl[0]:.0f};')
css_content = css_content.replace('--reply-saturation: 85%;', f'--reply-saturation: {accent_hsl[1]:.0f}%;')
css_content = css_content.replace('--reply-lightness: 66%;', f'--reply-lightness: {accent_hsl[2]:.0f}%;')

print(css_content)

# Write the updated CSS
newCss = os.path.expanduser('~') + "/.config/vesktop/themes/TranslucenceModified.theme.css"
with open(newCss, 'w') as file:
    file.write(css_content)

print("Theme updated with pywal colors!")
