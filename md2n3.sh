#!/bin/bash



echo "@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> ."
echo "@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> ."
echo "@prefix owl: <http://www.w3.org/2002/07/owl#> ."
echo "@prefix xsd: <http://www.w3.org/2001/XMLSchema#> ."
echo "@prefix dcterms: <http://purl.org/dc/terms/> .";
echo "@prefix qw:    <http://www.qualiware.com/> .";
echo "@prefix kombitrm: <http://kombit.dk/releasemanagement/> .";
echo "@prefix provo: <https://www.w3.org/TR/prov-o/#> .";
echo "@prefix prov:  <http://www.w3.org/ns/prov#> .";
echo "@prefix www-addr: <https://www.w3.org/Addressing/> .";
echo "";

#for f in `ls -R *.md`

GITROOT=`find . -name '.git' -type d -exec dirname {} \;`

for d in $GITROOT
do
(    
  cd $d

  GITCOMMIT=`git log | grep "commit" | head -1 | gawk '{print $2}'`
  GITURL=`cat ./.git/config |grep "url = " | gawk '{print $3}'| sed 's/\.git$//g' | sed 's/\.wiki/\/wiki/g'`

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
      print "<" subject ">\ta\tdcterms:BibliographicResource  ; "
      print "\t\twww-addr:url\t\"" url "/" basename "/" commit "\" ;"  
      print "\t\tdcterms:title\t\"" basename "\" ;"  
      print "\t\tdcterms:format\t\"text/markdown\" ;"  
     }
     if(match($0,"\\[.*\\]\\(.*\\)")) # Wildcard kunne godt strammes op
     {
       split($0,furlarray,"\\]\\(");
       #split($0,furlarray,"\");
       for(ix in furlarray)
       {
         furl=furlarray[ix];
	 furl=substr(furl,0,match(furl,"\\)")-1);
	 if(!match(furl,"\\("))                                   # Ikke have tilfældige indskudte paranteser i tekster
	 {
	   if(match(furl,"^http"))                                # Link ud på web
	     print "\t\tdcterms:references\t<" furl "> ;"
	   else
	   if(match(furl,"\.md$") || match(furl, "[0-9a-f]{40}$")) # Lokal fil med md extension eller specifik version
	     print "\t\tdcterms:references\t<" url "/" furl "> ;"
	   else
	   if(length(furl)>0)                                     # GitHub Wiki links udelader .md extension
	     print "\t\tdcterms:references\t<" url "/" furl ".md> ;"
           #print furl;
	 }
       }
     }
    }
    END {
      print "\t."
    }' filename="$f" basename=$BASENAME commit="$GITCOMMIT" url="$GITURL"
  done
)
done
