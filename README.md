# WezTerm Configuration

A clean and minimal **WezTerm** configuration focused on readability, aesthetics, and productivity.

### Features

- Transparent window with background blur (macOS)
- Custom background image
- Nerd Font support for icons and glyphs
- Automatic window positioning and resizing on startup
- Comfortable padding and typography for long coding sessions

---

## Requirements

### 1. WezTerm

**Minimum version:** `2023+`

#### macOS

```bash
brew install --cask wezterm
```

#### Linux

Follow the official installation guide:
[https://wezfurlong.org/wezterm/install/linux.html](https://wezfurlong.org/wezterm/install/linux.html)

---

### 2. Nerd Font (Required)

This configuration **requires** the following font:

```
RobotoMono Nerd Font
```

It is explicitly referenced in the config:

```lua
wezterm.font "RobotoMono Nerd Font"
```

Without this font:

- Icons in prompts, git status, and tools (Neovim, Starship, etc.) will not render correctly
- You may see squares or missing glyphs

#### macOS (Homebrew)

```bash
brew tap homebrew/cask-fonts
brew install --cask font-robotomono-nerd-font
```

#### Manual installation (macOS / Linux)

1. Download Nerd Fonts from:
   [https://www.nerdfonts.com/font-downloads](https://www.nerdfonts.com/font-downloads)
2. Choose **RobotoMono**
3. Install all `.ttf` files:
   - **macOS:** double-click → _Install Font_
   - **Linux:** copy to `~/.local/share/fonts` and run:

     ```bash
     fc-cache -fv
     ```

---

## Installation

### 1. Create WezTerm config directory

```bash
mkdir -p ~/.config/wezterm
```

### 2. Copy configuration file

Place `wezterm.lua` into:

```text
~/.config/wezterm/wezterm.lua
```

### 3. (Optional) Background image

If your config uses a background image, place it here:

```text
~/.config/wezterm/images/bg_1.png
```

You can replace the image with any PNG/JPG you like, just update the path in `wezterm.lua`:

```lua
File = wezterm.home_dir .. "/.config/wezterm/images/bg_1.png"
```

---

## macOS-Specific Notes

This configuration enables:

- Window transparency:

  ```lua
  window_background_opacity = 0.60
  ```

- Background blur:

  ```lua
  macos_window_background_blur = 25
  ```

These options **only work on macOS**.
On Linux/Windows they are ignored safely.

---

## Startup Behavior

On GUI startup, WezTerm will:

- Detect the active screen
- Open a window positioned on that screen
- Resize the window to match the screen resolution

This behavior is implemented via:

```lua
wezterm.on("gui-startup", function(cmd)
  ...
end)
```

If you prefer a simpler setup, you can replace it with:

```lua
window:gui_window():maximize()
```

---

## Troubleshooting

### Font not applied

- Restart WezTerm completely
- Verify the font name:

  ```bash
  wezterm ls-fonts | grep Roboto
  ```

### Background image not visible

- Check file path
- Ensure the image exists
- Try temporarily increasing opacity:

  ```lua
  opacity = 1.0
  ```
