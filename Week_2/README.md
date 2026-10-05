# Week 2: Git, GitHub & DevOps Collaboration

**DevOps Internship | Davine Technologies | Release Date: 3 August 2026**

## Objective

Learn version control with Git and team collaboration with GitHub: tracking changes, branching, merging, rebasing, Pull Requests, and keeping a repository clean with a README and `.gitignore`.

## Topics Covered

- Introduction to Version Control
- Git Installation & Configuration
- Git Workflow (working directory, staging area, repository)
- GitHub Fundamentals
- Creating & Cloning Repositories
- Staging, Commit & Push
- Branching & Merging
- Git Rebase Basics
- Pull Requests (PR)
- `.gitignore`
- README.md Documentation
- Team Collaboration using GitHub

---

## Weekly Task

| # | Exercise | Key Commands |
|---|----------|--------------|
| 1 | Install Git | `git --version` |
| 2 | Configure Git | `git config --global user.name / user.email` |
| 3 | Create a GitHub account and repository | github.com |
| 4 | Clone the repository | `git clone <url>` |
| 5 | Add sample files and commit | `git add .`, `git commit -m` |
| 6 | Push to GitHub | `git push -u origin main` |
| 7 | Create a branch and make changes | `git checkout -b feature-login` |
| 8 | Merge the branch into main | `git merge feature-login` |
| 9 | Create a professional README.md | See project README |
| 10 | Configure a `.gitignore` | See project `.gitignore` |
| 11 | Prepare PDF report | `Task/Report.pdf` |

**Deliverable:** [`Task/Report.pdf`](Task/Report.pdf)

---

## Hands-on Activity: DevOps-Week-02

**Scenario:** As a Junior DevOps Engineer, manage a new application's source code with Git and GitHub while collaborating with other developers.

### Workflow

```
main ──●────────────────●────────●──────●
        \              /        /
         feature-login ●───────/
          \                   /
           feature-footer ●──/   (conflict in app.py, resolved)
```

### Steps Performed

1. Created the repository `DevOps-Week-02` and added five project files (`index.html`, `style.css`, `app.py`, `config.yaml`, `deploy.sh`).
2. Created two feature branches: `feature-login` and `feature-footer`.
3. Made different changes in each branch.
4. Opened Pull Requests and merged both branches into `main`.
5. Resolved a merge conflict in `app.py` (both branches edited the same line).
6. Updated the README with project details and pushed the final project.

### Resolving the Merge Conflict

```text
<<<<<<< HEAD
return "Welcome back to the DevOps app"
=======
return "Hello from the DevOps sample app"
>>>>>>> feature-footer
```

Keep one final version, remove the markers, then:

```bash
git add app.py
git commit -m "Resolve merge conflict in app.py"
```

### Implementation Summary

Created the `DevOps-Week-02` repository, added five project files with a README and `.gitignore`, and pushed them to GitHub. Created two feature branches and made different changes in each. Merged both into `main` through Pull Requests. The second merge conflicted in `app.py` because both branches edited the same line, and it was resolved manually. Finally, updated the README and pushed the project.

---

## Merge vs Rebase

| | Merge | Rebase |
|---|-------|--------|
| History | Keeps branch history with a merge commit | Rewrites history into a straight line |
| Safety | Safe for shared branches | Avoid on branches others use |
| Command | `git merge feature` | `git rebase main` |

## Files in This Folder

| File | Description |
|------|-------------|
| [`Task/Report.pdf`](Task/Report.pdf) | Weekly task PDF report |
| [`Task/Task.txt`](Task/Task.txt) | Task steps and commands |
| [`Activity/Activity.txt`](Activity/Activity.txt) | Activity steps and summary |
| [`Activity/Commands.txt`](Activity/Commands.txt) | 25-command Git cheat sheet |
| [`Activity/git_workflow_demo.sh`](Activity/git_workflow_demo.sh) | Script reproducing branches, conflict and rebase |
| [`Activity/DevOps-Week-02/`](Activity/DevOps-Week-02) | Sample project (5 files, README, `.gitignore`) |

## Key Learnings

- Commits are snapshots, so clear commit messages make history easy to follow.
- Feature branches keep `main` stable while work is in progress.
- Merge conflicts happen when two branches edit the same lines, and they are resolved by editing the file, staging it and committing.
- Pull Requests add review and discussion before code reaches `main`.
- `.gitignore` keeps logs, secrets and build output out of the repository.

---

**Previous:** [Week 1](../Week_1/README.md) | **Next:** [Week 3](../Week_3/README.md)