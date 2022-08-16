# spacewar-dev,~/dev.moschata.net/spacewar,github.com/thelearned1/spacewar,dev,
# spacewar,public_html/spacewar,github.com/thelearned1/spacewar,main,
while IFS=',' read -r name loc repo branch script;
do 
  if [[ $1 = $name ]]; then 
    echo "Deploying $repo into $loc from branch $branch"
    if [[ -z $script ]]; then 
      if [[ -d $loc ]]; then 
        cd $loc 
        git pull origin $branch
      else 
        git clone $repo $loc
      fi
    else 
      $($script $name $loc $repo $branch)
    fi 
    exit 0
  fi
done < deploy.cfg
echo "I don't recognize a project called '$1'" 1>&2
exit 1
