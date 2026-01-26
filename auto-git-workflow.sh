#!/bin/bash

# SYNOPSIS
#     Automated Git Workflow - Handles Pull, Push, Commit, and Merge
# DESCRIPTION
#     Bash port of auto-git-workflow.ps1

Action="auto"
Branch=""
Message=""
timestamp=$(date "+%Y-%m-%d %H:%M:%S")
repoPath=$(pwd)

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -Action) Action="$2"; shift ;;
        -Branch) Branch="$2"; shift ;;
        -Message) Message="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Helper Functions
write_status() {
    local message="$1"
    local type="$2"
    local color="$NC"

    case "$type" in
        "Success") color="$GREEN" ;;
        "Warning") color="$YELLOW" ;;
        "Error") color="$RED" ;;
        "Info") color="$CYAN" ;;
        *) color="$NC" ;;
    esac

    echo -e "${color}${message}${NC}"
}

get_current_branch() {
    git branch --show-current 2>/dev/null
}

get_changed_files() {
    git status --porcelain
}

generate_commit_message() {
    local changedFiles=$(get_changed_files)

    if [ -z "$changedFiles" ]; then
        echo "Update: No changes detected - $timestamp"
        return
    fi

    local addCount=$(echo "$changedFiles" | grep "^A " | wc -l)
    local modifyCount=$(echo "$changedFiles" | grep "^M " | wc -l)
    local deleteCount=$(echo "$changedFiles" | grep "^D " | wc -l)
    local untrackedCount=$(echo "$changedFiles" | grep "^??" | wc -l)

    local psScripts=$(echo "$changedFiles" | grep "\.ps1$" | wc -l)
    local shScripts=$(echo "$changedFiles" | grep "\.sh$" | wc -l)
    local mdDocs=$(echo "$changedFiles" | grep "\.md$" | wc -l)

    local msg="Auto-update: "

    [ "$psScripts" -gt 0 ] && msg+="PowerShell scripts, "
    [ "$shScripts" -gt 0 ] && msg+="Bash scripts, "
    [ "$mdDocs" -gt 0 ] && msg+="documentation, "

    [ "$addCount" -gt 0 ] && msg+="added $addCount, "
    [ "$modifyCount" -gt 0 ] && msg+="modified $modifyCount, "
    [ "$deleteCount" -gt 0 ] && msg+="deleted $deleteCount, "
    [ "$untrackedCount" -gt 0 ] && msg+="new $untrackedCount, "

    # Remove trailing comma and space
    msg=$(echo "$msg" | sed 's/, $//')
    msg+=" - $timestamp"

    echo "$msg"
}

invoke_auto_pull() {
    write_status "\n[AUTO-PULL] Pulling latest changes..." "Info"
    local currentBranch=$(get_current_branch)

    # Fetch all remotes
    write_status "  Fetching from all remotes..." "Info"
    git fetch --all >/dev/null 2>&1

    # Try to pull
    if git pull origin "$currentBranch" --no-edit >/dev/null 2>&1; then
        write_status "  [OK] Successfully pulled from origin/$currentBranch" "Success"
        return 0
    fi

    write_status "  [WARNING] Pull failed or conflicts detected." "Warning"
    # Basic conflict resolution logic could go here, but omitted for simplicity in this port
    # as mostly we care about local commits in this environment.
    return 1
}

invoke_auto_commit() {
    local commitMessage="$1"
    write_status "\n[AUTO-COMMIT] Committing changes..." "Info"

    local changes=$(get_changed_files)
    if [ -z "$changes" ]; then
        write_status "  [INFO] No changes to commit" "Info"
        return 0
    fi

    write_status "  Adding all changes..." "Info"
    git add . >/dev/null 2>&1

    if [ -z "$commitMessage" ]; then
        commitMessage=$(generate_commit_message)
    fi

    write_status "  Commit message: $commitMessage" "Info"

    if git commit -m "$commitMessage"; then
        write_status "  [OK] Changes committed successfully" "Success"
        return 0
    else
        write_status "  [ERROR] Commit failed" "Error"
        return 1
    fi
}

invoke_auto_push() {
    write_status "\n[AUTO-PUSH] Pushing to all remotes..." "Info"
    local currentBranch=$(get_current_branch)
    local remotes=$(git remote)

    if [ -z "$remotes" ]; then
        write_status "  [WARNING] No remotes configured" "Warning"
        return 1
    fi

    local successCount=0
    for remote in $remotes; do
        write_status "  Pushing to: $remote/$currentBranch" "Info"
        if git push "$remote" "$currentBranch" >/dev/null 2>&1; then
            write_status "    [OK] Pushed to $remote" "Success"
            ((successCount++))
        else
            write_status "    [WARNING] Push to $remote failed (auth or network issue?)" "Warning"
        fi
    done

    if [ "$successCount" -gt 0 ]; then
        write_status "  [OK] Successfully pushed to $successCount remote(s)" "Success"
        return 0
    fi

    return 1
}

invoke_auto_merge() {
    local targetBranch="$1"
    write_status "\n[AUTO-MERGE] Merging branches..." "Info"
    local currentBranch=$(get_current_branch)

    if [ -z "$targetBranch" ]; then targetBranch="main"; fi

    if [ "$currentBranch" == "$targetBranch" ]; then
        write_status "  [INFO] Already on target branch: $targetBranch" "Info"
        return 0
    fi

    write_status "  Switching to: $targetBranch" "Info"
    git checkout "$targetBranch" >/dev/null 2>&1

    write_status "  Merging: $currentBranch -> $targetBranch" "Info"
    if git merge "$currentBranch" --no-edit >/dev/null 2>&1; then
        write_status "  [OK] Successfully merged $currentBranch into $targetBranch" "Success"
        git checkout "$currentBranch" >/dev/null 2>&1
        return 0
    else
        write_status "  [ERROR] Merge failed (conflicts?)" "Error"
        git merge --abort >/dev/null 2>&1
        git checkout "$currentBranch" >/dev/null 2>&1
        return 1
    fi
}

# Main
write_status "========================================" "Info"
write_status "  Automated Git Workflow (Bash)" "Info"
write_status "========================================" "Info"
write_status ""
write_status "Repository: $repoPath" "Info"
write_status "Current Branch: $(get_current_branch)" "Info"
write_status "Action: $Action" "Info"
write_status ""

pull_res=false
commit_res=false
push_res=false
merge_res=false

case "$Action" in
    pull)
        invoke_auto_pull; pull_res=$? ;;
    commit)
        invoke_auto_commit "$Message"; commit_res=$? ;;
    push)
        invoke_auto_push; push_res=$? ;;
    merge)
        invoke_auto_merge "$Branch"; merge_res=$? ;;
    auto)
        if ! invoke_auto_pull; then
            write_status "  [ERROR] Auto-pull failed. Aborting workflow." "Error"
            exit 1
        fi
        pull_res=0
        sleep 1

        if ! invoke_auto_commit "$Message"; then
            write_status "  [ERROR] Auto-commit failed. Aborting workflow." "Error"
            exit 1
        fi
        commit_res=0
        sleep 1

        # Push failure doesn't necessarily mean we should stop, but often it does.
        # For now, we'll log it but maybe not hard exit if it's just a network/auth issue,
        # however standard workflow usually wants push success.
        if ! invoke_auto_push; then
             write_status "  [WARNING] Auto-push failed. Continuing..." "Warning"
             push_res=1
        else
             push_res=0
        fi
        sleep 1

        if [ -n "$Branch" ]; then
            if ! invoke_auto_merge "$Branch"; then
                 write_status "  [ERROR] Auto-merge failed. Aborting workflow." "Error"
                 exit 1
            fi
            merge_res=0
        fi
        ;;
esac

write_status "\n========================================" "Info"
write_status "  Workflow Complete" "Info"
write_status "========================================" "Info"

# Logging not fully implemented to file, just output
