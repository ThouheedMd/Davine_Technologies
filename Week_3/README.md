# Week 3: Shell Scripting, Automation & Web Servers

**DevOps Internship | Davine Technologies | Release Date: 10 August 2026**

## Objective

Automate repetitive Linux tasks with Bash scripts and Cron, and deploy a web page using the Apache or Nginx web server.

## Topics Covered

- Bash Shell Scripting basics
- Variables & User Input
- Conditional Statements
- Loops
- Functions
- File & Directory Operations
- Cron Jobs
- Apache Web Server
- Nginx Web Server
- Basic Web Server Configuration
- Log Management

---

## Weekly Task

| # | Script / Exercise | File |
|---|-------------------|------|
| 1 | Display system information | [`sysinfo.sh`](Task/scripts/sysinfo.sh) |
| 2 | Automate file backups | [`backup.sh`](Task/scripts/backup.sh) |
| 3 | Create users and directories | [`create_users_dirs.sh`](Task/scripts/create_users_dirs.sh) |
| 4 | Clean old log files | [`clean_logs.sh`](Task/scripts/clean_logs.sh) |
| 5 | Schedule a script with Cron | `crontab -e` |
| 6 | Install Apache or Nginx | `apt install apache2` |
| 7 | Host and verify an HTML page | [`index.html`](Task/website/index.html) |
| 8 | PDF report | [`Report.pdf`](Task/Report.pdf) |

### Script Highlights

```bash
# Backup with timestamp
tar -czf "backup_$(date +%Y%m%d_%H%M%S).tar.gz" -C "$(dirname "$SRC")" "$(basename "$SRC")"

# Delete logs older than 7 days
find "$LOG_DIR" -type f -name "*.log" -mtime +7 -delete
```

---

## Hands-on Activity: Automate Tasks and Deploy a Website

**Scenario:** As a Junior DevOps Engineer, automate routine Linux tasks and deploy a simple company website.

### Flow

```
Bash Script ──► Backup Archive ──► Cron Schedule
                                       │
Apache/Nginx ──► /var/www/html ──► Browser (HTTP 200)
```

### Steps Performed

1. Wrote [`project_backup.sh`](Activity/project_backup.sh) to create directories, copy files, generate a backup and compress it into an archive.
2. Scheduled it with Cron: `0 2 * * * /home/<user>/scripts/project_backup.sh`
3. Installed Apache and deployed the HTML website to `/var/www/html`.
4. Verified the site in the browser and with `curl -I http://localhost`.
5. Checked the Apache access and error logs.

### Implementation Summary

Wrote a Bash script that creates the project directories, copies files, generates a timestamped backup and compresses it into a `.tar.gz` archive. Scheduled it with Cron so backups run daily at 2:00 AM. Installed Apache, deployed a simple HTML website, and verified it in the browser and with `curl`.

---

## Cron Quick Reference

```
* * * * *  command
│ │ │ │ │
│ │ │ │ └─ day of week (0-7)
│ │ │ └─── month (1-12)
│ │ └───── day of month (1-31)
│ └─────── hour (0-23)
└───────── minute (0-59)
```

## Apache vs Nginx

| | Apache | Nginx |
|---|--------|-------|
| Architecture | Process/thread per connection | Event-driven, asynchronous |
| Static content | Good | Excellent |
| Configuration | `.htaccess` per-directory overrides | Central config only |
| Typical use | Flexible, module-rich setups | High traffic, reverse proxy, load balancing |

## Files in This Folder

| File | Description |
|------|-------------|
| [`Task/Report.pdf`](Task/Report.pdf) | Weekly task PDF report |
| [`Task/Task.txt`](Task/Task.txt) | Task steps and commands |
| [`Task/scripts/`](Task/scripts) | `sysinfo.sh`, `backup.sh`, `create_users_dirs.sh`, `clean_logs.sh` |
| [`Task/website/index.html`](Task/website/index.html) | Sample website |
| [`Activity/Activity.txt`](Activity/Activity.txt) | Activity steps and summary |
| [`Activity/Commands.txt`](Activity/Commands.txt) | Shell scripting cheat sheet |
| [`Activity/project_backup.sh`](Activity/project_backup.sh) | Activity automation script |

## Key Learnings

- Scripts turn repetitive manual work into repeatable, reliable automation.
- Checking exit codes and whether directories exist makes scripts safer.
- Cron schedules scripts, so backups and clean-ups run without manual effort.
- Apache and Nginx both serve content from `/var/www/html` by default; logs help diagnose problems.

---

**Previous:** [Week 2](../Week_2/README.md) | **Next:** [Week 4](../Week_4/README.md)