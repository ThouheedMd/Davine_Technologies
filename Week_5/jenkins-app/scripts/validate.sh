#!/bin/bash
# validate.sh - Extra validation stage: basic quality and security checks.
# Exits with a non-zero code if a check fails so Jenkins marks the stage as failed.

FAIL=0
echo "== 1. Required files =="
for f in package.json app.js README.md Jenkinsfile; do
  if [ -f "$f" ]; then echo "  OK   $f"; else echo "  MISSING $f"; FAIL=1; fi
done

echo "== 2. Hard-coded secrets scan =="
if grep -rEn --include='*.js' --include='*.json' --include='*.sh' \
     -i "(password|secret|api[_-]?key|token)[\"' ]*[:=][\"' ]*[A-Za-z0-9/+_-]{6,}" \
     --exclude-dir=node_modules --exclude=validate.sh . ; then
  echo "  Possible secret found!"; FAIL=1
else
  echo "  No hard-coded secrets found"
fi

echo "== 3. Shell script syntax =="
for s in scripts/*.sh; do
  if bash -n "$s"; then echo "  OK   $s"; else FAIL=1; fi
done

echo "== 4. Dependency audit (warning only) =="
if command -v npm >/dev/null 2>&1 && [ -f package-lock.json ]; then
  npm audit --audit-level=high || echo "  WARNING: vulnerabilities reported"
else
  echo "  Skipped (no package-lock.json - the app has no dependencies)"
fi

if [ $FAIL -ne 0 ]; then echo "VALIDATION FAILED"; exit 1; fi
echo "VALIDATION PASSED"