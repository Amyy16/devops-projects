# LOG ARCHIVE TOOL

## Overview
A simple Bash CLI tool that archives log files from a specified directory, compresses them into a timestamped .tar.gz file, and records each archive event in a log file.

## Features
- Accepts a log directory as a command line argument
- Archives all files into a compressed .tar.gz file
- Uses timestamps to prevent overwriting archives
- Logs archive events with date and time
- Handles missing arguments and invalid directories

## Getting Started
### 1.  Clone the Repository
```
  git clone https://github.com/Amyy16/devops-projects.git
  cd log_archive

```
### 2. Make the Script executable
```
  chmod +x log_archive.sh

```

### 3. Execute the script

```
  ./log_archive.sh <log directory>
```

This Project is a part of [Roadmap.sh](https://roadmap.sh/) Devops Project
