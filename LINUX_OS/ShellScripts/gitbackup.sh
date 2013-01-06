#!/bin/bash

#add the cron entry for periodic backup from 22 to 24 PM each hour and daily
#0 22-24 * * * /home/harisha/HARISHA_CODING/gitbackup.sh /home/harisha/GIT_BACKUP

github_url="git://github.com/stf-admin/stf_datarepository.git"
output_dir=$1

if [ "x$output_dir" = "x" ] ; then
	echo "enter the destination path !!!"
	exit -1
fi

repo_name=$(basename ${github_url})
repo_path=${output_dir}/${repo_name}

echo "Taking backup of GITHUB repo"

if [ -d ${output_dir} ] ; then
    echo "$output_dir does not exist !!!"
    echo "creating output directory"
    mkdir -p ${output_dir}
else
    echo "output directory already exists"
fi

#check if git repository already exists  - yes update
if [ -d $repo_path ] ; then
    prev_path=$PWD
    cd $repo_path
    git pull origin master
    cd $prev_path
#clone
else
    git clone ${github_url} ${output_dir}/$repo_name
fi
