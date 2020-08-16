
#!/bin/sh
if [ -z "$1" ] 
then
  echo "Name of suite must be supplied"
  exit 1 ;
fi

EXCLUDE_TAGS="-v"
if [ "$2" == "production" ] 
then
  EXCLUDE_TAGS=""
fi

> tmp/latest_versions.txt
while read app; do
  grep -i "$app" tmp/deployable_apps.txt  | grep -i -m 1 $EXCLUDE_TAGS ":v"  >> tmp/latest_versions.txt
done < suites/$1

 cat tmp/latest_versions.txt