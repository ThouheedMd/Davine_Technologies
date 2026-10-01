# Davine Technologies - DevOps Internship

This repository contains my practical work completed during the
DevOps Internship at Davine Technologies.

# Week 1: Linux Fundamentals, Linux Administration & Networking Basics

**DevOps Internship | Davine Technologies | Release Date: 27 July 2026**

## Objective

Build a strong foundation in Linux, the base for every DevOps tool covered in later weeks (Docker, Jenkins, Terraform, Kubernetes). This week covers the Linux file system, users and groups, permissions, package management, processes, environment variables, networking and SSH.

## Topics Covered

- Introduction to Linux & Open Source
- Linux File System Hierarchy (FHS)
- Ubuntu Installation (VirtualBox / VMware / WSL)
- File & Directory Management
- File Permissions & Ownership
- Users & Groups Management
- Package Management
- Process Management
- Environment Variables
- Basic Networking Concepts
- SSH Fundamentals
- Common Linux Commands

---

## Weekly Task

Practical exercises completed:

| # | Exercise | Key Commands |
|---|----------|--------------|
| 1 | Install Ubuntu | VirtualBox / VMware / WSL |
| 2 | Explore the Linux file system | `ls /`, `cd`, `pwd`, `tree` |
| 3 | Create and manage users and groups | `useradd`, `groupadd`, `usermod`, `passwd` |
| 4 | File and directory management | `mkdir`, `touch`, `cp`, `mv`, `rm` |
| 5 | File permissions and ownership | `chmod`, `chown`, `chgrp`, `ls -l` |
| 6 | Install and update packages | `apt update`, `apt upgrade`, `apt install` |
| 7 | Monitor running processes | `ps aux`, `top`, `htop`, `kill` |
| 8 | Configure environment variables | `export`, `echo $VAR`, `printenv`, `~/.bashrc` |
| 9 | Networking commands | `hostname`, `hostnamectl`, `ip addr`, `ping`, `ifconfig` |
| 10 | Connect using SSH | `ssh user@host` |
| 11 | Prepare PDF report | See `Task/Report.pdf` |

**Deliverable:** [`Task/Report.pdf`](Task/Report.pdf) (Linux fundamentals, file system, users & groups, permissions, package management, environment variables, networking, SSH and 20 common commands)

---

## Hands-on Activity: Linux Server Preparation

**Scenario:** As a Junior DevOps Engineer, prepare a Linux server for a new development team by configuring users, directories, permissions and basic networking.

### Steps Performed

**1. Create the DevOps directory structure**
```bash
mkdir -p DevOps/{Projects,Scripts,Logs,Backup}
```

**2. Create sample files in each folder**
```bash
echo "Sample project file" > DevOps/Projects/app.txt
echo "echo Hello DevOps"   > DevOps/Scripts/sysinfo.sh
echo "[INFO] Server started" > DevOps/Logs/system.log
echo "Backup notes"        > DevOps/Backup/backup_notes.txt
```

**3. Create the `developers` group and two users**
```bash
sudo groupadd developers
sudo useradd -m -s /bin/bash user1
sudo useradd -m -s /bin/bash user2
```

**4. Add both users to the group**
```bash
sudo usermod -aG developers user1
sudo usermod -aG developers user2
getent group developers
```

**5. Assign file permissions**
```bash
sudo chgrp -R developers DevOps
sudo chmod -R 770 DevOps
chmod +x DevOps/Scripts/sysinfo.sh
ls -lR DevOps
```

**6. Configure the hostname**
```bash
sudo hostnamectl set-hostname devops-server
hostnamectl
```

**7. Verify internet connectivity**
```bash
ping -c 4 google.com
```

**8. Display IP address and system information**
```bash
ip addr
hostname -I
uname -a
cat /etc/os-release
```

**9. Compress the DevOps directory**
```bash
tar -czvf DevOps.tar.gz DevOps/
```

### Implementation Summary

Created the DevOps directory with Projects, Scripts, Logs and Backup folders and added sample files to each. Created the `developers` group with two users (user1 and user2) and added both to the group. Applied group-based permissions using `chgrp` and `chmod 770` so only the owner and developers can access the files. Configured the hostname, verified connectivity with `ping`, and checked the IP address. Finally, compressed the directory into `DevOps.tar.gz`.

---

## Files in This Folder

| File | Description |
|------|-------------|
| [`Task/Report.pdf`](Task/Report.pdf) | Weekly task PDF report |
| [`Task/Task.txt`](Task/Task.txt) | Task checklist |
| [`Activity/Activity.txt`](Activity/Activity.txt) | Activity steps and summary |
| [`Activity/Commands.txt`](Activity/Commands.txt) | Commands used |
| `Activity/DevOps.tar.gz` | Compressed DevOps directory |

## Permissions Quick Reference

| Value | Meaning |
|-------|---------|
| `7` | read + write + execute |
| `6` | read + write |
| `5` | read + execute |
| `4` | read only |

`chmod 770` gives the owner and group full access, and others none.

## Key Learnings

- Linux permissions use three levels (owner, group, others), and group-based access is the cleanest way to share files in a team.
- Package management (`apt`) and process tools (`ps`, `top`) are everyday tools for server administration.
- `hostnamectl` and `ip addr` are the modern replacements for `hostname` and `ifconfig` on current distributions.
- Scripting and automation in later weeks build directly on these command-line basics.

## Challenges & Fixes

- *(Add any issue you faced, for example a permission denied error fixed with `sudo` or `chmod`, or a network problem on VirtualBox solved by switching to bridged mode.)*

---

**Next:** [Week 2: Git, GitHub & DevOps Collaboration](../Week_2/README.md)