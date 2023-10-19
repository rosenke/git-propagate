#!/bin/bash

# Purpose:	git-propagate.bash
# Usage:	git-propagate.bash
# Example:	git-propagate.bash
# Responsible:	Stephan Rosenke <r01-571@r0s.de>
# License:	CC BY-SA 4.0
# Version:	2023-10-19
# Based on:	n/a

################################################################################
# set some user serviceable vars                                               #
################################################################################
branches_literal=""
branches_pattern="(main|master)"

################################################################################
################################################################################
######################### DON'T MESS BEHIND THIS LINE ##########################
################################################################################
################################################################################

################################################################################
# set some non-user serviceable vars                                           #
################################################################################
branches_matching=""

# unset LANG if you parse stdout-put of your commands for preventing problems
# with unanticipated languages
unset LANG

################################################################################
# define some functions                                                        #
################################################################################
# n/a

################################################################################
################################################################################
##################################### Main #####################################
################################################################################
################################################################################

# use $branches_pattern for getting $branches_matching
if [[ ! -z "${branches_pattern}" ]] ; then
 branches_matching="$(git branch | cut -c 3- | egrep ${branches_pattern})"
fi

# construct $branches
branches="${branches_literal} ${branches_matching}"

# get remote repositories
repositories="$(git remote | sort -u)"

# iterate over repositories and branches and do the pushing
for i in ${repositories} ; do
 for j in ${branches} ; do
  echo "*** Push ${j} to ${i}"
  git push "${i}" "${j}"
 done
done

#cleanup
# n/a

################################################################################
##################################### EOF ######################################
################################################################################
