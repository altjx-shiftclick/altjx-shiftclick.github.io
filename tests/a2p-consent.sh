#!/bin/zsh

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
REGISTER="$ROOT/register.html"
TERMS="$ROOT/terms.html"
PRIVACY="$ROOT/privacy.html"

assert_contains() {
  local file="$1"
  local text="$2"
  local content

  content="$(tr '\n' ' ' < "$file" | tr -s '[:space:]' ' ')"

  if [[ "$content" != *"$text"* ]]; then
    print -u2 "Expected '$file' to contain: $text"
    exit 1
  fi
}

assert_not_contains() {
  local file="$1"
  local text="$2"
  local content

  content="$(tr '\n' ' ' < "$file" | tr -s '[:space:]' ' ')"

  if [[ "$content" == *"$text"* ]]; then
    print -u2 "Expected '$file' not to contain: $text"
    exit 1
  fi
}

assert_contains "$REGISTER" "Subscribe to Real Estate SMS Alerts"
assert_contains "$REGISTER" "This form is only for SMS alerts"
assert_contains "$REGISTER" "does not create an account"
assert_contains "$REGISTER" "Subscribe to SMS Alerts"
assert_contains "$REGISTER" "id=\"sms-consent\" name=\"sms_consent\" value=\"yes\" required"
assert_not_contains "$REGISTER" "You must agree to receive SMS messages to sign up."
assert_not_contains "$REGISTER" "Last Name <span class=\"required\">*</span>"
assert_not_contains "$REGISTER" "Email <span class=\"required\">*</span>"

assert_contains "$TERMS" "dedicated SMS subscription form"
assert_contains "$PRIVACY" "dedicated SMS subscription form"
assert_contains "$PRIVACY" "opt-in information with third parties or affiliates for their own marketing or promotional purposes"
assert_not_contains "$PRIVACY" "SMS consent and opt-in data are not shared with any third party"

print "A2P consent copy checks passed."
