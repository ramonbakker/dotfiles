#!/bin/bash
# Script for Timewarrior that outputs the logged time for today.
# The output can be used for the tmux status line.
TIMEW_EXPORT=`timew export :day`
TIMEW_DAY_TOTAL=0

DAY_ENTRY_NUMBER=0
CURRENT_DAY_ENTRY=`echo $TIMEW_EXPORT | jq --argjson day_entry_number $DAY_ENTRY_NUMBER '.[$day_entry_number]'`
while [ "$CURRENT_DAY_ENTRY" != null ]
do
    TIMEW_DAY_START=`echo $CURRENT_DAY_ENTRY | jq ".start" | sed -e 's/"//g'`
    TIMEW_DAY_END=`echo $CURRENT_DAY_ENTRY | jq ".end" | sed -e 's/"//g'`

    if [ $TIMEW_DAY_END == null ]
    then
        TIMEW_DAY_END="now"
    fi

    CURRENT_DAY_ENTRY_DIFF=`/usr/bin/dateutils.ddiff -i '%Y%m%dT%H%M%SZ' -f '%S' $TIMEW_DAY_START $TIMEW_DAY_END`
    TIMEW_DAY_TOTAL=$(($TIMEW_DAY_TOTAL + $CURRENT_DAY_ENTRY_DIFF))

    DAY_ENTRY_NUMBER=$(($DAY_ENTRY_NUMBER + 1))
    CURRENT_DAY_ENTRY=`echo $TIMEW_EXPORT | jq --argjson day_entry_number $DAY_ENTRY_NUMBER '.[$day_entry_number]'`
done

SECONDS_IN_HOUR=3600

TIMEW_DAY_HOURS=`printf "%02.0f" $(($TIMEW_DAY_TOTAL / $SECONDS_IN_HOUR))`
TIMEW_DAY_MINUTES=`printf "%02.0f" $(($TIMEW_DAY_TOTAL % $SECONDS_IN_HOUR / 60))`
TIMEW_DAY_SECONDS=`printf "%02.0f" $(($TIMEW_DAY_TOTAL % $SECONDS_IN_HOUR % 60))`
echo $TIMEW_DAY_HOURS:$TIMEW_DAY_MINUTES:$TIMEW_DAY_SECONDS
