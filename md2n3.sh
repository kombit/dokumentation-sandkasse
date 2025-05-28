#!/bin/bash

GITCOMMIT=`git log | grep "commit" | head -1 | gawk '{print $2}'`
GITURL="https://github.com/kombit/dokumentation-sandkasse/wiki"


echo "@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> ."
echo "@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> ."
echo "@prefix sesame: <http://www.openrdf.org/schema/sesame#> ."
echo "@prefix owl: <http://www.w3.org/2002/07/owl#> ."
echo "@prefix xsd: <http://www.w3.org/2001/XMLSchema#> ."
echo "@prefix fn: <http://www.w3.org/2005/xpath-functions#> ."
echo "@prefix dcmi: <http://purl.org/dc/terms/> .";
echo "";

for f in `ls -R *.md`
do
    BASENAME=`basename $f .md`
    cat $f | \
    gawk 'BEGIN {
#      print "@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> ."
#      print "@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> ."
#      print "@prefix sesame: <http://www.openrdf.org/schema/sesame#> ."
#      print "@prefix owl: <http://www.w3.org/2002/07/owl#> ."
#      print "@prefix xsd: <http://www.w3.org/2001/XMLSchema#> ."
#      print "@prefix fn: <http://www.w3.org/2005/xpath-functions#> ."
#      print "@prefix dcmi: <http://purl.org/dc/terms/> .";
#      print "";
    }
    {
     if(NR==1)
     { 
      subject=url "/" basename 
      print "<" subject ">\ta\tdcmi:BibliographicResource  ; "
      print "\t\t<https://www.w3.org/Addressing/url>\t\"" url "/" basename "/" commit "\" ;"  
      print "\t\tdcmi:title\t\"" basename "\" ;"  
      print "\t\tdcmi:format\t\"text/markdown\" ;"  
     }
     if(match($0,"\\(http:|\\(https:"))
     {
       split($0,urlarray,"\\(");
       #split($0,urlarray,"\");
       for(ix in urlarray)
       {
         url=urlarray[ix];
	 url=substr(url,0,match(url,"\\)")-1);
	 if(match(url,"^http"))
	   print "\t\tdcmi:references\t<" url "> ;"  
         #print url;
       }
     }
    }
    END {
      print "\t."
    }' filename="$f" basename=$BASENAME commit="$GITCOMMIT" url="$GITURL"
done

