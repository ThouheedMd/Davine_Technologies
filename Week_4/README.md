# Week 4: Docker & Docker Compose

**DevOps Internship | Davine Technologies | Release Date: 17 August 2026**

## Objective

Understand containerization: build images with a Dockerfile, run and manage containers, persist data with volumes, connect containers with networks and deploy multi-container applications using Docker Compose.

## Topics Covered

- Introduction to Docker & Docker Architecture
- Docker Installation
- Images and Containers
- Docker Hub
- Dockerfile
- Volumes and Networks
- Environment Variables and Port Mapping
- Docker Compose and Multi-Container Applications
- Docker Best Practices

---

## Weekly Task

| # | Exercise | Command / File |
|---|----------|----------------|
| 1 | Install and verify Docker | `docker --version`, `docker run hello-world` |
| 2 | Pull images from Docker Hub | `docker pull nginx:alpine` |
| 3 | Create and manage containers | `docker run`, `ps`, `logs`, `exec`, `stop` |
| 4 | Build a custom image | [`Task/node-app/Dockerfile`](Task/node-app/Dockerfile) |
| 5 | Run a Node.js app in a container | `docker run -p 3000:3000` |
| 6 | Persistent storage with a volume | `-v app-data:/data` |
| 7 | Custom Docker network | `docker network create week4-net` |
| 8 | Multi-container app with Compose | [`Task/docker-compose.yml`](Task/docker-compose.yml) |
| 9 | Push the image to Docker Hub | `docker push <user>/docker-week4-app:1.0` |
| 10 | PDF report | [`Task/Report.pdf`](Task/Report.pdf) |

---

## Hands-on Activity: 3-Tier Application with Docker Compose

**Scenario:** As a Junior DevOps Engineer, containerize a web application and deploy it with Docker Compose for a consistent development environment.

### Architecture

```
Browser ──► frontend (Nginx :8080) ──/api──► backend (Node.js :3000) ──► db (PostgreSQL)
                      └────────────── custom network: app-net ──────────────┘
                                                        db-data volume ◄──┘
```

### Run It

```bash
cd Activity
cp .env.example .env        # set your own password
docker compose up -d --build
docker compose ps
curl http://localhost:8080/api/health
curl http://localhost:8080/api/visits
```

Open <http://localhost:8080> in the browser. Stop with `docker compose down` (add `-v` to delete the database volume).

### Implementation Summary

Created Dockerfiles for a Node.js backend and an Nginx frontend, built custom images and pushed them to Docker Hub. Wrote a Compose file that deploys frontend, backend and PostgreSQL containers with a named volume for database data and a custom bridge network. Verified communication through the health and visits endpoints and confirmed the data survived a restart.

---

## Images vs Containers

| | Image | Container |
|---|-------|-----------|
| What it is | Read-only template (app + dependencies) | Running instance of an image |
| Created by | `docker build` | `docker run` |
| Stored in | Local machine / Docker Hub | Memory, with a writable layer |

## Best Practices Applied

- Small base images (`alpine`) and `.dockerignore` to keep images lightweight
- Copy `package.json` first so dependency layers are cached
- Run as a non-root user
- Passwords come from environment variables / `.env` (never commit `.env`)
- Healthcheck on the database so the backend starts only when it is ready

## Files in This Folder

| File | Description |
|------|-------------|
| [`Task/Report.pdf`](Task/Report.pdf) | Weekly task PDF report |
| [`Task/Task.txt`](Task/Task.txt) | Task steps and commands |
| [`Task/node-app/`](Task/node-app) | Node.js app, `Dockerfile`, `.dockerignore` |
| [`Task/docker-compose.yml`](Task/docker-compose.yml) | Compose file (Nginx + Node.js, volume, network) |
| [`Activity/Activity.txt`](Activity/Activity.txt) | Activity steps and summary |
| [`Activity/Commands.txt`](Activity/Commands.txt) | Docker command cheat sheet |
| [`Activity/docker-compose.yml`](Activity/docker-compose.yml) | 3-tier Compose file |
| [`Activity/frontend/`](Activity/frontend) | Nginx frontend and `Dockerfile` |
| [`Activity/backend/`](Activity/backend) | Node.js backend and `Dockerfile` |

## Docker Hub

- Repository: `https://hub.docker.com/r//docker-week4-app`

## Key Learnings

- Containers package an app with its dependencies, so it runs the same everywhere.
- Volumes keep data after a container is removed; networks let containers reach each other by name.
- Compose describes a whole multi-container stack in one file.
- `.dockerignore` and small base images make builds faster and images smaller.

---

**Previous:** [Week 3](../Week_3/README.md) | **Next:** [Week 5](../Week_5/README.md)