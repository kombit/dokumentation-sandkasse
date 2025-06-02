#!/bin/bash



echo "@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> ."
echo "@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> ."
echo "@prefix sesame: <http://www.openrdf.org/schema/sesame#> ."
echo "@prefix owl: <http://www.w3.org/2002/07/owl#> ."
echo "@prefix xsd: <http://www.w3.org/2001/XMLSchema#> ."
echo "@prefix fn: <http://www.w3.org/2005/xpath-functions#> ."
echo "@prefix dcmi: <http://purl.org/dc/terms/> .";
echo "";

#for f in `ls -R *.md`

GITROOT=`find . -name '.git' -type d -exec dirname {} \;`

for d in $GITROOT
do
(    
  cd $d

  GITCOMMIT=`git log | grep "commit" | head -1 | gawk '{print $2}'`
  GITURL=`cat ./.git/config |grep "url = " | gawk '{print $3}'| sed 's/\.git$//g'`

  for f in `find . -name '*.md'`
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
     if(match($0,"\\[.*\\]\\(.*\\)")) # Wildcard kunne godt strammes op
     {
       split($0,furlarray,"\\(");
       #split($0,furlarray,"\");
       for(ix in furlarray)
       {
         furl=furlarray[ix];
	 furl=substr(furl,0,match(furl,"\\)")-1);
	 if(match(furl,"^http"))                                # Link ud på web
	   print "\t\tdcmi:references\t<" furl "> ;"
	 else
	 if(match(furl,"\.md$"))                                # Lokal fil med md extension
	   print "\t\tdcmi:references\t<" url "/" furl "> ;"
	 else
	 if(length(furl)>0)                                     # GitHub Wiki links udelader .md extension
	   print "\t\tdcmi:references\t<" url "/" furl ".md> ;"
         #print furl;
       }
     }
    }
    END {
      print "\t."
    }' filename="$f" basename=$BASENAME commit="$GITCOMMIT" url="$GITURL"
  done
)
done
