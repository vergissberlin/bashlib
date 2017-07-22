#!/usr/bin/env bash

####################################################################################
# Bashlib     : 0.0.1
# Copyright		: 2017, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlib
####################################################################################


# Run commands on remotes
function remote() {
    ssh ${USER}@${IP} ${1}
}

# 1:    USER
# 2:    IP
# 3:    source directory
# 4:    target directory
function scpCopyServerToServer {
    messageCode "scp -rp ${3} ${1}@${2}:${4}"
    remote "scp -rp ${3} ${1}@${2}:${4}"
}

# Uploads files via scp
# 1:    USER
# 2:    IP
# 3:    source directory
# 4:    target directory
function scpUpload() {
    if [ -d "${3}" ]
    then
        messageInfo "Upload files:"
        messageCode "scp -rp ${3} ${1}@${2}:${4}"
        scp -r ${3} ${1}@${2}:${4} \
            && messageOk "Upload files to ${2} successfully: ${code}${4}${norm}" \
            || messageError $? "Upload failed: ${code}${4}${norm}"
    else
        messageMissingDirectory ${3}
    fi
}

# Uploads files via scp
# 1:    USER
# 2:    IP
# 3:    source directory
function scpDownload() {
    messageInfo "Download files:"
    messageCode "scp -r ${1}@${2}:${3} ."
    scp -rp ${1}@${2}:${3} . \
        && messageOk "Download files from ${3} to ${2} successfully!" \
        || messageError $? "Download failed!"
}
