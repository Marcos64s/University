function max()
{
if [ $1 -gt $2 ];then
echo "1"
return 1
elif(($1 == $2)); then
echo "0"
return 0
else
echo "-1"
return -1
fi
}
