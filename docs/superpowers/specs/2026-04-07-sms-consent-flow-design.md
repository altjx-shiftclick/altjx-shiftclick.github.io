# SMS Consent Flow Design

## Goal

Make `shiftclick.io/register` clearly function as a dedicated SMS subscription page so the site no longer presents marketing SMS consent as bundled with a broader registration flow.

## Problem

The existing site mixes SMS enrollment language with broader `sign up` and `registration` wording. The page also requires SMS consent to submit, while surrounding copy makes the flow read like a general registration form instead of a dedicated SMS subscription form.

## Approved Design

1. Keep `register.html` as the landing page for SMS opt-in, but rewrite it as an SMS-only subscription form.
2. Reduce required fields to the minimum needed for SMS enrollment so the form no longer resembles a broader lead-registration flow.
3. Update the checkbox, validation message, button label, and confirmation copy so they consistently describe subscribing to SMS alerts only.
4. Add plain-language disclosure that the form is only for SMS alerts and does not create an account or capture consent for any other channel.
5. Update `terms.html` and `privacy.html` so they describe the same dedicated SMS subscription flow.
6. Update supporting site copy that links to `/register.html` so it uses `subscribe` or `SMS alerts` language instead of generic `sign up` wording where appropriate.

## Files

- Modify: `register.html`
- Modify: `terms.html`
- Modify: `privacy.html`
- Modify: `index.html`
- Modify: `about.html`
- Modify: `contact.html`
- Add: `tests/a2p-consent.sh`

## Verification

Run `zsh tests/a2p-consent.sh` to confirm the site copy reflects the dedicated SMS subscription flow.
