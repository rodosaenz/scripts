#!/bin/bash

BUCKET_SRC=mybucket1
BUCKET_DST=mybucket2

INPUT="files.txt"
while IFS= read -r line
do
  	FILE=$line
	RESULT=$(aws s3 cp "s3://$BUCKET_SRC/$FILE" "s3://$BUCKET_DST/$FILE" --storage-class STANDARD)
	echo "$RESULT $FILE"
done < "$INPUT"
