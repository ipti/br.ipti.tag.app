#!/bin/bash

cd tag_ui_design_system
flutter packages pub get
cd ../br_ipti_tag_app
flutter packages pub get
flutter config --enable-web
flutter build web --release
sed -E 's/\ <base href="\/">/<base href="\/br_ipti_tag_app\/">/' build/web/index.html > tmpfile ; mv tmpfile build/web/index.html 