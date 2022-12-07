#!/bin/sh
file=test/coverage_helper_test.dart
package_name=`pwd | sed 's#.*/##'`
echo "// Helper file to make coverage work for all dart files\n" > $file
echo "// ignore_for_file: unused_import, directives_ordering" >> $file
find lib -name '*.dart' | cut -c4- | awk -v package=$package_name '{printf "import '\''package:%s%s'\'';\n", package, $1}' >> $file
echo "// ignore: no-empty-block" >> $file
echo "void main(){}" >> $file