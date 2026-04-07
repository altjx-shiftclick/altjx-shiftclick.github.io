# SMS Consent Flow Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Rewrite the ShiftClick opt-in pages so the website presents `/register.html` as a dedicated SMS subscription flow instead of a broader registration flow.

**Architecture:** Keep the existing static HTML structure and Formspree submission, but tighten the copy and field set so the form only describes SMS enrollment. Use a small shell regression check to guard the most important compliance wording.

**Tech Stack:** Static HTML, inline JavaScript, zsh, ripgrep

---

### Task 1: Add a regression check for the consent wording

**Files:**
- Create: `tests/a2p-consent.sh`

- [ ] **Step 1: Write the failing test**

Add assertions that require SMS-only wording in `register.html`, `terms.html`, and `privacy.html`, and reject the old `sign up` validation copy plus extra required lead fields.

- [ ] **Step 2: Run test to verify it fails**

Run: `zsh tests/a2p-consent.sh`
Expected: FAIL because the current site still uses broader signup wording.

- [ ] **Step 3: Write minimal implementation**

Update the HTML files so the assertions become true without changing unrelated layout or infrastructure.

- [ ] **Step 4: Run test to verify it passes**

Run: `zsh tests/a2p-consent.sh`
Expected: PASS with `A2P consent copy checks passed.`

### Task 2: Rewrite the registration page as an SMS-only subscription form

**Files:**
- Modify: `register.html`

- [ ] **Step 1: Reduce the form to SMS-specific fields**

Keep `first_name` and `phone` required. Remove the required `last_name` and `email` fields so the form no longer looks like a general registration workflow.

- [ ] **Step 2: Rewrite page and control copy**

Change the title, heading, subtitle, checkbox wording, validation message, button label, and confirmation copy to consistently describe subscribing to SMS alerts.

- [ ] **Step 3: Add a dedicated-flow disclosure**

Add copy near the form stating that the page is only for SMS alerts and does not create an account or capture consent for any other channel.

### Task 3: Align legal and supporting pages with the SMS-only flow

**Files:**
- Modify: `terms.html`
- Modify: `privacy.html`
- Modify: `index.html`
- Modify: `about.html`
- Modify: `contact.html`

- [ ] **Step 1: Update Terms and Privacy language**

Describe `/register.html` as a dedicated SMS subscription form and remove copy that makes the checkbox sound like a broader registration requirement.

- [ ] **Step 2: Update supporting links and references**

Where the site currently says `Sign Up`, change the user-facing copy to `SMS Alerts` or `Subscribe` so links to `/register.html` match the new flow.

### Task 4: Verify and commit

**Files:**
- Verify: `tests/a2p-consent.sh`

- [ ] **Step 1: Run the regression check**

Run: `zsh tests/a2p-consent.sh`
Expected: PASS

- [ ] **Step 2: Inspect git status**

Run: `git status --short`
Expected: only the intended docs, test, and HTML changes are present for this work.

- [ ] **Step 3: Commit**

Run:
```bash
git add docs/superpowers/specs/2026-04-07-sms-consent-flow-design.md docs/superpowers/plans/2026-04-07-sms-consent-flow.md tests/a2p-consent.sh register.html terms.html privacy.html index.html about.html contact.html
git commit -m "fix: separate SMS subscription consent flow"
```
