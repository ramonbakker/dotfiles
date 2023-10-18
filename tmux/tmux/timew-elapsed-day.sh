#!/bin/bash
# Script for Timewarrior that outputs the logged time for today and the active entry.
# The output can be used for the tmux status line.
TIMEW_BIN="timew"
JQ_BIN="jq"
DATEDIFF_BIN="datediff"

TIMEW_EXPORT=`$TIMEW_BIN export :day`
TIMEW_DAY_TOTAL=0

DAY_ENTRY_NUMBER=0
CURRENT_DAY_ENTRY=`echo $TIMEW_EXPORT | $JQ_BIN --argjson day_entry_number $DAY_ENTRY_NUMBER '.[$day_entry_number]'`
CURRENT_DAY_ENTRY_TAG=''

while [ "$CURRENT_DAY_ENTRY" != null ]
do
    TIMEW_DAY_START=`echo $CURRENT_DAY_ENTRY | $JQ_BIN ".start" | sed -e 's/"//g'`
    TIMEW_DAY_END=`echo $CURRENT_DAY_ENTRY | $JQ_BIN ".end" | sed -e 's/"//g'`

    if [ $TIMEW_DAY_END == null ]
    then
        TIMEW_DAY_END="now"
    fi

    CURRENT_DAY_ENTRY_DIFF=`$DATEDIFF_BIN -i '%Y%m%dT%H%M%SZ' -f '%S' $TIMEW_DAY_START $TIMEW_DAY_END`
    TIMEW_DAY_TOTAL=$(($TIMEW_DAY_TOTAL + $CURRENT_DAY_ENTRY_DIFF))

    CURRENT_DAY_ENTRY_TAG=`echo $TIMEW_EXPORT | $JQ_BIN --argjson day_entry_number $DAY_ENTRY_NUMBER '.[$day_entry_number].tags[0]'`
    CURRENT_DAY_ENTRY_TAG=`echo $CURRENT_DAY_ENTRY_TAG | sed -e 's/"//g'`

    DAY_ENTRY_NUMBER=$(($DAY_ENTRY_NUMBER + 1))
    CURRENT_DAY_ENTRY=`echo $TIMEW_EXPORT | $JQ_BIN --argjson day_entry_number $DAY_ENTRY_NUMBER '.[$day_entry_number]'`
done

SECONDS_IN_HOUR=3600

TIMEW_DAY_HOURS=`printf "%02.0f" $(($TIMEW_DAY_TOTAL / $SECONDS_IN_HOUR))`
TIMEW_DAY_MINUTES=`printf "%02.0f" $(($TIMEW_DAY_TOTAL % $SECONDS_IN_HOUR / 60))`
TIMEW_DAY_SECONDS=`printf "%02.0f" $(($TIMEW_DAY_TOTAL % $SECONDS_IN_HOUR % 60))`

TIMEW_CURRENT_HOURS=`printf "%02.0f" $(($CURRENT_DAY_ENTRY_DIFF / $SECONDS_IN_HOUR))`
TIMEW_CURRENT_MINUTES=`printf "%02.0f" $(($CURRENT_DAY_ENTRY_DIFF % $SECONDS_IN_HOUR / 60))`
TIMEW_CURRENT_SECONDS=`printf "%02.0f" $(($CURRENT_DAY_ENTRY_DIFF % $SECONDS_IN_HOUR % 60))`

if [ "$CURRENT_DAY_ENTRY_TAG" == null ]
then
    CURRENT_DAY_ENTRY_TAG="N/A"
fi

STATUS_INDICATOR="☕"

if [ $($TIMEW_BIN get dom.active) == 1 ]
then
    STATUS_INDICATOR="⏱"
fi

echo "$TIMEW_DAY_HOURS:$TIMEW_DAY_MINUTES:$TIMEW_DAY_SECONDS [$STATUS_INDICATOR $TIMEW_CURRENT_HOURS:$TIMEW_CURRENT_MINUTES:$TIMEW_CURRENT_SECONDS $CURRENT_DAY_ENTRY_TAG]"
