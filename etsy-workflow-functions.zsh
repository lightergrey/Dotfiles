export VM_HOST=jstewart.vm.dev.etsycloud.com
export REPO_DIR="~/development/workflow-testing"

function wf_is_branch_clean() {
    if [[ -z $(git status -s) ]]; then
        return 0
    else
        echo "Error: branch not clean"
        return 1
    fi
}

function wf_is_branch_master() {
    branch=$(git rev-parse --abbrev-ref HEAD);
    if [[ $branch = 'master' ]]; then
        return 0
    else
        echo "Error: branch not master"
        return 1
    fi
}

function wf_checkout_branch() {
    if [[ "$#" -ne 1 ]]; then
        echo "Check out branch. Usage: $0 [branch-name]"
        return 1
    fi

    echo "Checking out branch $1"

    git fetch
    git checkout $1
    if [[ $? -ne 0 ]]; then
        echo "Error: check out branch"
        return 1
    else
        return 0
    fi
}

function wf_new_branch() {
    if [[ "$#" -ne 1 ]]; then
        echo "Create a new branch on both the VM and locally. Usage: $0 [branch-name]"
        return 1
    fi

    echo "Making branch $1"

    wf_is_branch_clean
    if [ $? -ne 0 ]; then
        return 1
    fi


    wf_is_branch_master
    if [[ $? -ne  0 ]]; then
        return 1
    fi

    git pull -r
    git checkout -b $1
    git push -u origin "$1"

    ssh -T $VM_HOST "cd $REPO_DIR && . ~/.zsh/etsy-workflow-functions.zsh && wf_checkout_branch $1"
}

