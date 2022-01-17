#!/bin/sh
baseurl="https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/"
flag=0
echo "Latest curl: $(date)" > $XDG_CACHE_HOME/vaccinecache.txt

get_response () {
  echo $(curl -s "$1" \
    --header 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36' \
    | jq '.sessions[] | select(.min_age_limit == 18 and .available_capacity_dose1 > 5)')
}

# loop through districts
for i in "$@"; do
  # check for 7 days
  a=0
  while [ "$a" -lt 7 ]
  do
    date=$(date -d "+$a days" "+%d-%m-%Y")
    url="${baseurl}findByDistrict?district_id=${i}&date=${date}"
    response=$(get_response $url)
    [ -n "$response" ] && flag=1 && echo -e "\nSlot Date: $date" >> $XDG_CACHE_HOME/vaccinecache.txt \
      && echo "$response" | jq '.' >> $XDG_CACHE_HOME/vaccinecache.txt
    a=`expr $a + 1`
  done
done

cat $XDG_CACHE_HOME/vaccinecache.txt >> $XDG_CACHE_HOME/vaccinelog.txt
if [ $flag -eq 0 ]; then
  echo "none"
else
  # notify-send -u critical "Vaccine"
  echo "!!"
fi

