#!/usr/bin/env bash
set -eou pipefail

_grep () {
	local needle="$1"
	local haystack="$2"
	if grep -F "$needle" "$haystack" >/dev/null; then
		printf "  ✓ [%20s] %s\n" "$haystack" "$needle"
	else
		printf "  ✗ [%20s] %s\n" "$haystack" "$needle"
		exit 1
	fi
}

(
	echo ""
	echo -e "\033[34mCompiling test fixtures using PostCSS:\033[0m"
	./node_modules/.bin/postcss test/fixtures --dir test/output
	echo "  ✓ ok"

	echo ""
	echo -e "\033[34mChecking output:\033[0m"
	_grep "font-size: calc(" test/output/test.css
	_grep "1rem * 1.17);" test/output/test.css
	_grep "1rem * 1.2);"  test/output/test.css
	_grep "1rem * 1.15);" test/output/test.css
	_grep ".msFontSize1 {"  test/output/css_modules.css
	_grep ".msFontSize2 {"  test/output/css_modules.css
	_grep ".msFontSize10 {" test/output/css_modules.css
) || (
	echo ""
	echo "Failure encountered, oops!"
	echo "Check the logs above and inspect the output in /test/output/."
	exit 1
)
