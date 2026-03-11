#!/bin/bash
# Ping sweep the Lab

runningsweep() {
  local base="onyxnode"
  local found=0
  local missing=0
  local total=200
  local log="ping.log"

  : > "$log"

  for q in {1..200}; do
    curr="$base$q"

    # Capture AND log output
    output=$(ping -c 1 -W 1 "$curr" 2>&1 | tee -a "$log")

    # Parse output text (regex via grep)
    if echo "$output" | grep -Eq '1 (packets )?received'; then
      ((found++))
    else
      ((missing++))
    fi

    progressBar "$q" 200
  done

  #Print results
  echo
  echo "Pingsweep Complete"
  echo "Nodes found:   $found"
  echo "Nodes missing: $missing"
}

progressBar(){
  local current=$1
  local total=$2
  local barWidth=50

  percent=$(( q * 100 / total ))
          filled=$(( percent * $barWidth / 100 ))

          printf "\rProgress: [%-${barWidth}s] %3d%% (%d/%d)" \
            "$(printf '#%.0s' $(seq 1 $filled))" \
            "$percent" "$current" "$total"
}

help() {
  echo "Usage: $(basename "$0") [-h] [-p]"
    echo "Optional arguments:"
    echo "  -h        Show this help message and exit"
    echo "  -p        Runs pingsweep command"
    exit 0
}

while getopts "hp" option; do
  # shellcheck disable=SC2220
  case "$option" in
    h) # If -h is provided, call the help function
      help
      ;;
    p) # If -p is provided, call pingsweep function
      runningsweep
      ;;
  esac
done
