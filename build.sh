#!/bin/bash

cd orbit_ui_tag
flutter packages pub get
cd ../br_ipti_tag_app
flutter packages pub get
flutter config --enable-web
