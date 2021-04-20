function compara($1,$2)
{
if (( $1 == $2 )); then
return 0
elif (( $1 > $2 ));then
return 1
else
return 2
}
