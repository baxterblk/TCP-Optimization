# TCP Optimization Script

This script applies various TCP optimizations by updating the `/etc/sysctl.conf` file and then applying the changes. These optimizations are intended to improve network performance and reliability.

## Purpose

The purpose of this script is to easily configure TCP settings on a Linux system to optimize network performance. This includes adjustments to TCP windows, retries, timeouts, and enabling BBR congestion control.

## What It Does

1. Backs up the current `/etc/sysctl.conf` file.
2. Adds a set of TCP optimization parameters to `/etc/sysctl.conf`.
3. Applies the changes using `sysctl -p`.

## Usage

1. Clone the repository or download the script.
2. Make the script executable:
    ```bash
    chmod +x optimize_tcp.sh
    ```
3. Run the script with `sudo`:
    ```bash
    sudo ./optimize_tcp.sh
    ```

## TCP Parameters Applied

- `net.ipv4.tcp_slow_start_after_idle = 0`
- `net.ipv4.tcp_no_metrics_save = 0`
- `net.ipv4.tcp_abort_on_overflow = 0`
- `net.ipv4.tcp_window_scaling = 1`
- `net.ipv4.tcp_tw_reuse = 1`
- `net.ipv4.tcp_rfc1337 = 1`
- `net.ipv4.tcp_sack = 1`
- `net.ipv4.tcp_fack = 1`
- `net.ipv4.tcp_workaround_signed_windows = 1`
- `net.ipv4.tcp_syncookies = 1`
- `net.ipv4.tcp_syn_retries = 4`
- `net.ipv4.tcp_synack_retries = 2`
- `net.ipv4.tcp_orphan_retries = 2`
- `net.ipv4.tcp_retries2 = 12`
- `net.ipv4.tcp_max_tw_buckets = 262144`
- `net.ipv4.tcp_max_syn_backlog = 8192`
- `net.ipv4.tcp_mtu_probing = 1`
- `net.ipv4.tcp_fin_timeout = 30`
- `net.ipv4.tcp_keepalive_time = 7200`
- `net.ipv4.tcp_keepalive_intvl = 75`
- `net.ipv4.tcp_keepalive_probes = 9`
- `net.ipv4.tcp_max_orphans = 262144`
- `net.ipv4.tcp_timestamps = 0`
- `net.ipv4.ip_no_pmtu_disc = 0`
- `net.ipv4.tcp_rmem = 8192 2097152 16777216`
- `net.ipv4.tcp_wmem = 4096 16384 33554432`
- `net.ipv4.tcp_adv_win_scale = -2`
- `net.ipv4.tcp_notsent_lowat = 4294967295`
- `net.core.default_qdisc = fq`
- `net.ipv4.tcp_congestion_control = bbr`
- `user.max_inotify_watches = 2097152`

## Notes

- Ensure you have a backup of your current `/etc/sysctl.conf` before running the script.
- These settings are designed for general network performance improvement and may not be suitable for all environments. Adjustments might be necessary based on specific needs.

## License

This project is licensed under the MIT License.
