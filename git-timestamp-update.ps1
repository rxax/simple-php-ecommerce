# Change only the year of Git author and committer timestamps.
# Month, day, time, and timezone are preserved.

$NewYear = 2026

py -m git_filter_repo --force --commit-callback @"
import re


def change_year(timestamp):
    # Git timestamp format:
    # <unix timestamp> <timezone offset>
    #
    # Convert the timestamp to a datetime, replace the year,
    # then convert it back to a Unix timestamp.

    from datetime import datetime, timezone, timedelta

    unix_timestamp, timezone_offset = timestamp.decode().split()

    timestamp_int = int(unix_timestamp)

    # Parse timezone offset, e.g. +0300 or -0500
    sign = 1 if timezone_offset[0] == '+' else -1
    hours = int(timezone_offset[1:3])
    minutes = int(timezone_offset[3:5])

    offset = timedelta(
        hours=sign * hours,
        minutes=sign * minutes
    )

    original = datetime.fromtimestamp(
        timestamp_int,
        timezone(offset)
    )

    updated = original.replace(year=$NewYear)

    return str(int(updated.timestamp())).encode() + b' ' + timezone_offset.encode()


commit.author_date = change_year(commit.author_date)
commit.committer_date = change_year(commit.committer_date)
"@

Write-Host ""
Write-Host "Done. Author and committer years have been changed to $NewYear."
