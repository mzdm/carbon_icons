echo "converting SVG files to ttf"
fantasticon --config fantasticon_config.js

echo "generating IconData from ttf"
dart font_generator.dart

echo "formatting generated dart file"
dart format generated/carbon_fonts.dart

exec $SHELL;