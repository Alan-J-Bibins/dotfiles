#!/bin/bash

# A very smol script to setup Makefiles for c/cpp projects, very minimal, just sets up a output dir, along with the command for compiling automatically

makefile_content() {
    local project_name="$1"
    local project_language=$(case "$2" in "c") echo "c" ;; "cpp") echo "cpp" ;; *) echo "c" ;; esac)
    local compiler=$(case "$project_language" in "c") echo "gcc" ;; "cpp") echo "g++" ;; *) echo "g++" ;; esac)
    local content=$(
        cat <<EOF
all: output/${project_name}.out
	./output/${project_name}.out

output/${project_name}.out: ${project_name}.c
	mkdir -p output/
	${compiler} ${project_name}.${project_language} -o output/${project_name}.out

clean:
	rm output/*
EOF
    )
    echo "$content" >>"$project_name/Makefile"
}

project_name="$1"
project_language="$2"

if [ "$#" -eq 0 ]; then
    echo "Usage: tpc.sh '<project name>' '<project language(either c or cpp)>'"
    exit 1
fi

mkdir -p "$project_name/output"
makefile_content "$project_name" "$project_language"
cd "$project_name"
touch "$project_name.$project_language"
