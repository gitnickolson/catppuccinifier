PATH_TO_DIRECTORY="${(%):-%N}"
ABSOLUTE_CATPPUCCINIFIER_DIR="${PATH_TO_DIRECTORY:A:h}"
 
catppuccinify() {
  BUNDLE_GEMFILE="$ABSOLUTE_CATPPUCCINIFIER_DIR/Gemfile" \
    bundle exec ruby "$ABSOLUTE_CATPPUCCINIFIER_DIR/bin/catppuccinify" "$@"
}
 
_catppuccinify() {
  _arguments \
    '1:file:_files' \
    '2:theme:(latte frappe macchiato mocha)'
}
 
if (( $+functions[compdef] )); then
  compdef _catppuccinify catppuccinify
fi
