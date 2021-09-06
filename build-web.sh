#!/bin/bash

cd tag_ui_design_system
flutter packages pub get
cd ../br_ipti_tag_app
flutter packages pub get
flutter config --enable-web
