#!/bin/bash

get_gcp_ip_ranges() {
  dig @8.8.8.8 +short txt "$1" | tr ' ' '\n' |
    while read -r line; do
      case "$line" in
        include:*)
          get_gcp_ip_ranges "${line#*:}"
          ;;
        ip[46]:*)
          echo "${line#*:}"
          ;;
      esac
  done
}

get_gcp_ip_ranges "_cloud-netblocks.googleusercontent.com"
