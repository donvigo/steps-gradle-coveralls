#!/bin/bash

if [ -z "${gradlew_file_path}" ] ; then
	printf "\e[31mgradlew_file_path was not defined\e[0m\n"
    exit 1
fi

if [ ! -f "${gradlew_file_path}" ] ; then
    printf "\e[31mDidn't find a gradlew file in the root directory\e[0m\n"
    exit 1
fi

if [ -z "${coveralls_task}" ] ; then
    printf "\e[31mcoveralls_task was not defined\e[0m\n"
    exit 1
fi

if [ -z "${coveralls_repo_token}" ] ; then
    printf "\e[31mcoveralls_repo_token was not defined.\e[0m\n"
    exit 1
fi

export COVERALLS_REPO_TOKEN=${coveralls_repo_token}

echo "$" ${gradlew_file_path} ${coveralls_task}
${gradlew_file_path} ${coveralls_task}
return_code=$?

exit ${return_code}

