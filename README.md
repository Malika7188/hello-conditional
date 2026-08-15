# hello-conditional

This is a minimal Flatpak app that does nothing except declare conditional
permissions, for testing Flatseal's conditional permission support against a
real, installed app instead of the internal test fixtures.

Its manifest declares:

- `--socket-if=x11:!has-wayland` this is a conditional socket, nothing else
  grants x11
- `--socket=wayland` and `--socket-if=wayland:true` this socket is
  granted normally, and again with a condition
- `--device-if=all:!has-input-device` this is a conditional device
- `--allow-if=devel:true` this is a conditional feature

## Test overrides
`apply-test-overrides.sh`: this applies overrides sourced from override files
instead of the manifest:

- `--device-if=usb:!has-usb-portal` a conditional device from a per-app
  override
- `--nodevice=all` denies all devices on top of the manifest's conditional
  request
- `--share-if=network:true` a conditional permission from the global
  override

## Build and install locally

From this directory run;

```
flatpak-builder --user --install --force-clean build-dir com.example.HelloConditional.json
./apply-test-overrides.sh
```

Once installed, it shows up like any other app in Flatseal, with conditional
markers on X11, Wayland, all devices, USB devices, network, and devel.
