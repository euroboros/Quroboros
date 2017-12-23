#/bin/bash
DATE=`date +%F`
git add commit.sh pushmaster.sh gitstatus.sh
git commit -m "$DATE running with MPI now"
