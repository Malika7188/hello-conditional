#!/bin/sh
# this applies the overrides used for testing.

set -e

APP_ID=com.example.HelloConditional

# a per-app override
flatpak override --user --device-if=usb:!has-usb-portal "$APP_ID"

# a global override (no app id, applies to every app)
flatpak override --user --share-if=network:true
