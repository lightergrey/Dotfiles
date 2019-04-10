export VM_HOST=jstewart.vm.dev.etsycloud.com

function wf_is_branch_clean() {
    if [[ -z $(git status -s) ]]; then
        return 0
    else
        echo "branch not clean"
        return 1
    fi
}

function wf_is_branch_master() {
    branch=$(git rev-parse --abbrev-ref HEAD);
    if [[ $branch = 'master' ]]; then
        return 0
    else
        echo "branch not master"
        return 1
    fi
}

function wf_new_branch() {
    if [ "$#" -ne 1 ]; then
        echo "Create a new branch on both the VM and locally. Usage: $0 [branch-name]"
        return 1
    fi

    echo "Making branch $1"

    wf_is_branch_clean
    if [ $? == 0 ]; then
        return 0
    fi

    wf_is_branch_master
    if [ $? == 0 ]; then
        return 0
    fi

    git checkout -b $1
    # git push -u origin $1
}

