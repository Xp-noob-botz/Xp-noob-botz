#!/bin/bash

# Colors
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
CYAN="\033[36m"
BOLD="\033[1m"
RESET="\033[0m"

function step() {
    echo -e "${BOLD}${CYAN}[$1/$2]${RESET} ${YELLOW}$3${RESET}"
}

function done_step() {
    echo -e "   ${GREEN}✔${RESET} $1"
}

TOTAL=5

echo -e "${BOLD}${BLUE}=== Docker Cleanup ===${RESET}"

step 1 $TOTAL "Removing stopped containers..."
docker container prune -f >/dev/null
done_step "Stopped containers removed"

step 2 $TOTAL "Removing dangling images..."
docker image prune -f >/dev/null
done_step "Dangling images removed"

step 3 $TOTAL "Removing unused networks..."
docker network prune -f >/dev/null
done_step "Unused networks removed"

step 4 $TOTAL "Removing unused volumes..."
docker volume prune -f >/dev/null
done_step "Unused volumes removed"

step 5 $TOTAL "Running full system prune..."
docker system prune -f >/dev/null
done_step "System prune complete"

echo -e "${BOLD}${GREEN}=== Docker cleanup done! ===${RESET}"
