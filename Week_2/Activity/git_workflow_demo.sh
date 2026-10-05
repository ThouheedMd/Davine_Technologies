#!/bin/bash
# Reproduces the Week 2 activity locally: commits, two feature branches,
# merges, a merge conflict and its resolution, plus a rebase demo.
set -e
SRC="$(cd "$(dirname "$0")" && pwd)/DevOps-Week-02"
WORK="$HOME/git-demo"
rm -rf "$WORK" && mkdir -p "$WORK" && cd "$WORK"

git init -b main
git config user.name "DevOps Intern"
git config user.email "intern@example.com"
cp -r "$SRC"/. .
git add .
git commit -m "Initial commit: add project files, README and .gitignore"

# Feature branch 1: change the greeting in app.py
git checkout -b feature-login
sed -i 's/Welcome to the DevOps sample app/Welcome back to the DevOps app/' app.py
git commit -am "feat: update greeting message in app.py"

# Feature branch 2 (from main): change the SAME line differently + footer
git checkout main
git checkout -b feature-footer
sed -i 's/Welcome to the DevOps sample app/Hello from the DevOps sample app/' app.py
echo '  <footer>Davine Technologies Internship</footer>' > footer.html
git add footer.html
git commit -am "feat: change greeting and add footer"

# Merge both into main
git checkout main
git merge feature-login -m "Merge feature-login into main"
git merge feature-footer -m "Merge feature-footer into main" || echo "MERGE CONFLICT DETECTED"

git status --short
# Resolve the conflict manually: keep a combined message
cat > app.py <<'PY'
# Simple sample application
APP_NAME = "DevOps Sample App"

def greet():
    return "Welcome back to the DevOps sample app"

if __name__ == "__main__":
    print(greet())
PY
git add app.py
git commit -m "Resolve merge conflict in app.py"

# Rebase demo
git checkout -b feature-docs
echo "Docs added on feature-docs" > docs.txt && git add docs.txt && git commit -m "docs: add docs.txt"
git checkout main
echo "Hotfix note" > hotfix.txt && git add hotfix.txt && git commit -m "fix: add hotfix note"
git checkout feature-docs
git rebase main
git checkout main
git merge feature-docs

git log --oneline --graph --all