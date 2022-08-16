# spacewar-dev,~/dev.moschata.net/spacewar,github.com/thelearned1/spacewar,dev,
# \std.sh
# spacewar,public_html/spacewar,github.com/thelearned1/spacewar,main,std.sh
while IFS=',' read -r name loc repo branch script;
do 
  if [[ $1 = $name ]]; then 
    echo "Deploying $repo into $loc from branch $branch"
    exit
  fi
done < deploy.cfg
echo "I don't recognize a project called '$1'" 1>&2
exit 1
