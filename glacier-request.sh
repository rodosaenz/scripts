#!/bin/bash

BUCKET=mybucket

INPUT="glacier-files.txt"
while IFS= read -r line
do
  	FILE=$line
	aws s3api restore-object --bucket $BUCKET --key "$FILE" --restore-request '{"Days":10,"GlacierJobParameters":{"Tier":"Standard"}}'
done < "$INPUT"
