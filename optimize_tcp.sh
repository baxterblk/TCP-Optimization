#!/bin/bash

# This script applies various TCP optimizations by updating /etc/sysctl.conf and applying the changes

# Ensure script is run with sudo
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or use sudo"
  exit 1
fi

# Backup the current sysctl.conf
cp /etc/sysctl.conf /etc/sysctl.conf.bak

# Apply TCP optimizations
cat <<EOF >> /etc/sysctl.conf

# TCP optimizations
net.ipv4.tcp_slow_start_after_idle = 0
net.ipv4.tcp_no_metrics_save = 0
net.ipv4.tcp_abort_on_overflow = 0
net.ipv4.tcp_window_scaling = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_rfc1337 = 1
net.ipv4.tcp_sack = 1
net.ipv4.tcp_fack = 1
net.ipv4.tcp_workaround_signed_windows = 1
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_syn_retries = 4
net.ipv4.tcp_synack_retries = 2
net.ipv4.tcp_orphan_retries = 2
net.ipv4.tcp_retries2 = 12
net.ipv4.tcp_max_tw_buckets = 262144
net.ipv4.tcp_max_syn_backlog = 8192
net.ipv4.tcp_mtu_probing = 1
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_keepalive_time = 7200
net.ipv4.tcp_keepalive_intvl = 75
net.ipv4.tcp_keepalive_probes = 9
net.ipv4.tcp_max_orphans = 262144
net.ipv4.tcp_timestamps = 0
net.ipv4.ip_no_pmtu_disc = 0
net.ipv4.tcp_rmem = 8192 2097152 16777216
net.ipv4.tcp_wmem = 4096 16384 33554432
net.ipv4.tcp_adv_win_scale = -2
net.ipv4.tcp_notsent_lowat = 4294967295
net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr
user.max_inotify_watches = 2097152
EOF

# Apply the changes
sysctl -p

echo "TCP optimizations applied successfully."
