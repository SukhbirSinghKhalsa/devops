# 🐧 Linux Commands Cheat Sheet

## A categorized quick reference guide for commonly used Linux commands.

---

## 1️⃣ Basic Commands

| Command | Description | Example |
|----------|------------|----------|
| `ls` | List directory contents | `ls -l` |
| `cd` | Change directory | `cd /home/user` |
| `pwd` | Print working directory | `pwd` |
| `cp` | Copy files/directories | `cp file.txt backup.txt` |
| `mv` | Move or rename files | `mv old.txt new.txt` |
| `rm` | Remove files/directories | `rm file.txt` |
| `mkdir` | Create directory | `mkdir new_folder` |
| `rmdir` | Remove empty directory | `rmdir empty_folder` |
| `rm -rf` | Force remove directory | `rm -rf folder` |
| `touch` | Create empty file | `touch newfile.txt` |
| `clear` | Clear terminal | `clear` |

---

## 2️⃣ User Management

| Command | Description | Example |
|----------|------------|----------|
| `useradd` | Add new user | `sudo useradd testusr` |
| `adduser` | Interactive add user | `sudo adduser testusr` |
| `userdel` | Delete user | `sudo userdel -r testusr` |
| `groupadd` | Create group | `sudo groupadd testgrp` |
| `groupdel` | Delete group | `sudo groupdel testgrp` |
| `passwd` | Change password | `passwd testusr` |
| `usermod -aG` | Add user to group | `sudo usermod -aG sudo testusr` |
| `whoami` | Current user | `whoami` |
| `who` | Logged in users | `who` |
| `id` | UID/GID info | `id testusr` |
| `chage -l` | Account aging info | `sudo chage -l testusr` |

---

## 3️⃣ File & Directory Management

| Command | Description | Example |
|----------|------------|----------|
| `find` | Search files | `find /home -name "*.txt"` |
| `locate` | Find by name | `locate notes.txt` |
| `tree` | Directory tree view | `tree folder` |
| `stat` | File details | `stat file.txt` |
| `basename` | Extract filename | `basename /path/file.txt` |
| `dirname` | Extract directory | `dirname /path/file.txt` |
| `rsync` | Sync files | `rsync -avz src/ dest/` |

---

## 4️⃣ File Permissions & Ownership

| Command | Description | Example |
|----------|------------|----------|
| `chmod` | Change permissions | `chmod 755 script.sh` |
| `chown` | Change owner | `sudo chown user:user file.txt` |
| `chgrp` | Change group | `sudo chgrp group file.txt` |
| `umask` | Default permissions | `umask 022` |

---

## 5️⃣ Process Management

| Command | Description | Example |
|----------|------------|----------|
| `ps aux` | List processes | `ps aux` |
| `top` | Real-time processes | `top` |
| `htop` | Interactive monitor | `htop` |
| `kill -9` | Kill by PID | `kill -9 1234` |
| `killall` | Kill by name | `killall firefox` |
| `jobs` | List background jobs | `jobs` |
| `bg` | Background job | `bg %1` |
| `fg` | Foreground job | `fg %1` |
| `shutdown -h now` | Shutdown system | `sudo shutdown -h now` |
| `reboot` | Reboot system | `sudo reboot` |

---

## 6️⃣ Package Management

### Debian/Ubuntu (APT)

| Command | Example |
|----------|----------|
| Update packages | `sudo apt update` |
| Install package | `sudo apt install nginx` |
| Upgrade packages | `sudo apt upgrade` |
| Remove package | `sudo apt remove nginx` |

### RHEL/CentOS (YUM)

| Command | Example |
|----------|----------|
| Install package | `sudo yum install nginx` |
| Update packages | `sudo yum update` |
| Remove package | `sudo yum remove nginx` |

---

## 7️⃣ Network Commands

| Command | Description | Example |
|----------|------------|----------|
| `ping` | Test connectivity | `ping google.com` |
| `ip a` | Show IP addresses | `ip a` |
| `ss -tuln` | Socket stats | `ss -tuln` |
| `traceroute` | Trace route | `traceroute google.com` |
| `nslookup` | DNS query | `nslookup example.com` |
| `curl` | Fetch URL | `curl http://example.com` |
| `wget` | Download file | `wget http://file.zip` |
| `scp` | Secure copy | `scp file user@host:/tmp/` |
| `ssh` | Remote login | `ssh user@host` |

---

## 8️⃣ Disk Management

| Command | Description | Example |
|----------|------------|----------|
| `df -h` | Disk usage | `df -h` |
| `du -sh` | Directory size | `du -sh /home` |
| `lsblk` | List block devices | `lsblk` |
| `mount` | Mount filesystem | `mount /dev/sdb1 /mnt` |
| `umount` | Unmount filesystem | `umount /mnt` |
| `mkfs.ext4` | Create filesystem | `sudo mkfs.ext4 /dev/sdb1` |
| `fsck` | Check filesystem | `sudo fsck /dev/sdb1` |

---

## 9️⃣ System Monitoring

| Command | Description | Example |
|----------|------------|----------|
| `free -h` | Memory usage | `free -h` |
| `vmstat` | Virtual memory stats | `vmstat 1` |
| `iostat` | CPU/I/O stats | `iostat` |
| `uptime` | System uptime | `uptime` |
| `uname -a` | System info | `uname -a` |
| `lscpu` | CPU info | `lscpu` |
| `journalctl -xe` | System logs | `journalctl -xe` |

---

## 🔟 Security & Permissions

| Command | Description | Example |
|----------|------------|----------|
| `sudo` | Run as root | `sudo apt install nginx` |
| `su - user` | Switch user | `su - testusr` |
| `visudo` | Edit sudoers | `sudo visudo` |
| `ufw enable` | Enable firewall | `sudo ufw enable` |
| `iptables -L` | List firewall rules | `sudo iptables -L` |

---

## 1️⃣1️⃣ Text Processing

| Command | Description | Example |
|----------|------------|----------|
| `cat` | View file | `cat file.txt` |
| `less` | Scroll file | `less file.txt` |
| `head` | First lines | `head file.txt` |
| `tail` | Last lines | `tail file.txt` |
| `grep` | Search text | `grep "hello" file.txt` |
| `sed` | Stream editor | `sed 's/old/new/g' file.txt` |
| `awk` | Pattern processing | `awk '{print $1}' file.txt` |
| `sort` | Sort lines | `sort names.txt` |
| `uniq` | Remove duplicates | `uniq sorted.txt` |
| `wc` | Count lines/words | `wc file.txt` |

---

## 1️⃣2️⃣ Compression & Archiving

| Command | Description | Example |
|----------|------------|----------|
| `tar -cvzf` | Create archive | `tar -cvzf archive.tar.gz folder/` |
| `tar -xvzf` | Extract archive | `tar -xvzf archive.tar.gz` |
| `gzip` | Compress file | `gzip file.txt` |
| `zip` | Create zip archive | `zip archive.zip file.txt` |
| `unzip` | Extract zip | `unzip archive.zip` |

---

## 1️⃣3️⃣ Scheduling & Automation

| Command | Description | Example |
|----------|------------|----------|
| `crontab -e` | Edit cron jobs | `crontab -e` |
| `at` | Schedule one-time job | `echo "shutdown now" \| at 10:00` |
| `sleep` | Delay execution | `sleep 10s` |
| `watch` | Run periodically | `watch -n 1 free` |

---

## 1️⃣4️⃣ Shell & Scripting

| Command | Description | Example |
|----------|------------|----------|
| `bash` | Run bash script | `bash script.sh` |
| `sh` | Run shell script | `sh script.sh` |
| `source` | Run in current shell | `source ~/.bashrc` |
| `export` | Set env variable | `export PATH=$PATH:/bin` |
| `alias` | Create shortcut | `alias ll='ls -la'` |
| `read` | Read input | `read name` |
| `echo` | Print text | `echo "Hello"` |

---

# 📌 Notes
- Most administrative commands require `sudo`.
- Use `man <command>` for detailed documentation.
- Always double-check destructive commands like `rm -rf`.
