# Week 5: Jenkins, CI/CD & GitHub Integration

**DevOps Internship | Davine Technologies | Release Date: 24 August 2026**

## Objective

Understand how code moves through a CI/CD pipeline: install Jenkins, connect it to GitHub, build a Freestyle job and a Declarative Pipeline with a Jenkinsfile, trigger builds with webhooks and troubleshoot failures from the Console Output.

## Topics Covered

- Jenkins Fundamentals & Architecture
- Jenkins Installation & Configuration
- Jobs & Builds, Credentials
- GitHub Integration, Webhooks, Build Triggers
- Freestyle Projects
- Declarative Pipelines, Jenkinsfile, Pipeline Stages
- Build & Test Automation
- Pipeline Troubleshooting, CI/CD Best Practices

---

## Weekly Task

| # | Exercise | Where |
|---|----------|-------|
| 1 | Install and configure Jenkins | `Task/Task.txt` step 1 |
| 2 | Explore the dashboard | `Task/Task.txt` step 2 |
| 3 | Connect Jenkins with GitHub | `Task/Task.txt` step 3 |
| 4 | Configure credentials securely | `Task/Task.txt` step 4 |
| 5 | Freestyle project pulling from GitHub | `Task/Task.txt` step 5 |
| 6 | Automated build trigger | `Task/Task.txt` step 6 |
| 7 | Declarative pipeline and Jenkinsfile | [`jenkins-app/Jenkinsfile`](jenkins-app/Jenkinsfile), [`Task/Jenkinsfile.basic`](Task/Jenkinsfile.basic) |
| 8 | Stages: Checkout, Build, Test | Jenkinsfile |
| 9 | Execute pipeline, analyze logs | Console Output |
| 10 | GitHub Webhook | `Task/Task.txt` step 11 |
| 11 | PDF report | [`Task/Report.pdf`](Task/Report.pdf) |

---

## Hands-on Activity: CI Pipeline for Every Change

**Scenario:** As a Junior DevOps Engineer, build a CI pipeline that automatically validates every change pushed to GitHub.

### Pipeline Flow

```
Developer ──push──► GitHub ──webhook──► Jenkins
                                          │
              Checkout ► Build ► Test ► Validation ► Success / Failure
```

### Pipeline Stages

| Stage | What it does |
|-------|--------------|
| **Checkout** | Pulls the latest code from GitHub |
| **Build** | `npm run build` (syntax check) |
| **Test** | `npm test` (4 unit tests) |
| **Validation** | `scripts/validate.sh`: required files, hard-coded secret scan, shell syntax, dependency audit |

### Failure, Troubleshooting, Resolution

A controlled error (wrong expected value in a test) made the **Test** stage fail. The Console Output showed `expected: 6, actual: 5`, the test was corrected and the pipeline passed again. Full write-up: [`Activity/Troubleshooting.md`](Activity/Troubleshooting.md).

### Implementation Summary

Created a GitHub repository for a small Node.js app and connected it to Jenkins with a four-stage declarative pipeline (Checkout, Build, Test, Validation). A GitHub webhook starts the pipeline on every push. A controlled error made the Test stage fail; the Console Output pointed to the failing assertion, which was fixed and pushed, and the pipeline passed.

---

## Freestyle vs Declarative Pipeline

| | Freestyle | Declarative Pipeline |
|---|-----------|----------------------|
| Configured in | Jenkins web UI | `Jenkinsfile` in the repository |
| Version controlled | No | Yes (Pipeline as Code) |
| Best for | Quick, simple jobs | Repeatable multi-stage CI/CD |

## Files in This Folder

| File | Description |
|------|-------------|
| [`Task/Report.pdf`](Task/Report.pdf) | Weekly task PDF report |
| [`Task/Task.txt`](Task/Task.txt) | Task steps and settings |
| [`Task/Jenkinsfile.basic`](Task/Jenkinsfile.basic) | Basic 3-stage pipeline |
| [`Activity/Activity.txt`](Activity/Activity.txt) | Activity steps and summary |
| [`Activity/Troubleshooting.md`](Activity/Troubleshooting.md) | Failure, troubleshooting and resolution |
| [`jenkins-app/`](jenkins-app) | Sample app, tests, `Jenkinsfile`, `scripts/validate.sh` |

## Key Learnings

- CI automatically builds and tests every change, catching bugs early.
- A `Jenkinsfile` keeps the pipeline in version control alongside the code.
- Webhooks trigger builds instantly; polling is the fallback.
- Credentials belong in the Jenkins credential store, never in code.
- On failure, read the Console Output, find the root cause, fix, then re-run.

---

**Previous:** [Week 4](../Week_4/README.md) | **Next:** [Week 6](../Week_6/README.md)