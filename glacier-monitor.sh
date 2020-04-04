
BUCKET=mybucket

INPUT="glacier-files.txt"
while IFS= read -r line
do
  	FILE=$line
	RESULT=$(aws s3api head-object --bucket $BUCKET --key "$FILE" | grep Restore)
	echo "$RESULT $FILE"
done < "$INPUT"
