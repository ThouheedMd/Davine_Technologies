# Jenkins Sample App

Small Node.js application used for the Week 5 Jenkins CI/CD pipeline.

## Commands

```bash
npm run build   # syntax check
npm test        # unit tests (node:test)
npm start       # run the app
```

## Pipeline

`Checkout -> Build -> Test -> Validation` (see `Jenkinsfile`).