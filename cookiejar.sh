pattern=${1%,*}
jar=${1#*,}

prefix_len=$(sed -r "s/(.*)$pattern(.*)/\1/" <<< $jar | wc -c)
echo $(($prefix_len * 2 + ${#pattern} - 3))
