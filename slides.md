# Social Tagging and Folksonomies

## Social Tagging

* Keywords/tags manually assigned to documents by\
  members of a distributed community of volunteers
* Tags freely chosen (or easy to create new)
* Outcome of tagging activity in a tagging system:\
  *Folksonomy*

## Properties of Social Tagging

* Tagging systems are very dynamic\
  --- *especially compared to normal KOS*
* Different types of tagging systems exist:\
  --- *don't compare apples and oranges!*

      * source of resources
	  * tagging rights, tagging support, tag management
	  * *tag aggregation*
	  * *tag connectivity*

## Tag aggregation: Bag-Model

![](img/bag-model.png)

## Tag aggregation: Bag-Model

![](img/bag-model-analysis.png)

## Tag aggregation: Set-Model

![](img/set-model.png)

## Tag aggregation: Set-Model

![](img/set-model-analysis.png)

## Folksonomies in set-model tagging systems

*Dynamic knowledge organization systems\
created by communities of distributed volunteers*

* Directly given as snapshot of community consensus
* Limited awareness among community members
* Two popular examples:

	  * Categories in Wikipedia
      * Tags in Stack Exchange

# Wikipedia and Stack Exchange

## Categories in Wikipedia

![](img/wpcategory.png)

----

<!-- 
http://en.wikipedia.org/wiki/Special:CategoryTree
http://meta.wikimedia.org/wiki/User:Dapete/Catgraph 
-->

![](img/wpcattree.png)

![](img/wpcatgraph.png)

* folksonomy is a thesaurus

## Tags in Stack Exchange

![](img/se-tags.png)

* tags in a question
* anyone can edit tags (after a while)
* folksonomy is a flat file of keywords (with some synonyms)

# Linking Folksonomies to KOS

## Knowledge Organization Systems (KOS)

* Classifications, thesauri, taxonomies, authority files...
* Common model of KOS for exchange and interlinking:\
  Simple Knowledge Organization System (SKOS):
 
~~~
<http://example.org/a> a skos:Concept ;
  skos:broader    <http://example.org/b> ;
  skos:narrower   <http://example.org/c> ;
  skos:related    <http://example.org/d> ;
  skos:exactMatch <http://example.com/A> ;
  skos:closeMatch <http://example.com/aa> .
~~~

## Harvest and SKOSify folksonomy 

![](img/harvesting.png)

## Additional links from tag names

![](img/cstheory-tags.png)

* Reuse of Computing Research Repository (CoRR) notations

## Mapping to CoRR classification

    @prefix cst: <http://cstheory.stackexchange.com/tags/> . 
	[ skos:notation "LO"; 
	  skos:prefLabel "Logic in Computer Science"@en ]
	  skos:closeMatch cst:lo.logic .

	[ skos:notation  "DS" ; 
	  skos:prefLabel "Data Structures and Algorithms"@en ]
	  skos:narrowMatch
		cst:ds.algorithms ,
		cst:ds.data-structures .

## Feedback of enrichment and links into the community

![](img/feedback.png)

## Enrichtment of tag description in Wikipedia

![](img/kategorie-hoerspiel-slide.png)

## Enrichtment of tag description in Wikipedia

~~~~
<http://de.dbpedia.org/resource/Kategorie:H%C3%B6rspiel> 
  a skos:Concept ; skos:prefLabel "Hörspiel"@de ;
  skos:narrowMatch
    <http://data.bib.uni-mannheim.de/data/rvk/AP_36320> ,
    <http://data.bib.uni-mannheim.de/data/rvk/EC_7980> ;
  skos:closeMatch 
    <http://dewey.info/class/791.447/> , # DDC
    <http://d-nb.info/gnd/4025435-5> .   # GND
~~~~

## Enrichtment of tag description in Stack Exchange

![](img/tag-info-ils-slide.png)

## Enrichtment of tag description in Stack Exchange

~~~~
@prefix libse: <http://libraries.stackexchange.com/tags/>

libse:ils a skos:Concept ;
  skos:broader 
    libse:software ;
  skos:narrower 
    libse:circulation> ,
    libse:collection-management ,
    libse:cataloging> ,
    libse:opac ;
  skos:closeMatch
    <http://dbpedia.org/resource/Integrated_library_system> ,
    <http://id.loc.gov/authorities/subjects/sh95003216> ,
    <http://eprints.rclis.org/handle/10760/3775> ,
    <http://d-nb.info/gnd/4583297-3> .
~~~~

## Feedback of enrichment and links into the community

* Feedback with additional benefit: find related documents 
* One must be able to directly link to a rich collected of 
  documents indexed with the concept notation/identifier of each KOS

# Results

## hierarchical links

![](img/libraries-graph.png)

## Mappings to other KOS

* Published in SKOS/RDF as shown
* Simple mappings in form of BEACON files

~~~~
#PREFIX: http://libraries.stackexchange.com/tags/
#RELATION: http://www.w3.org/2004/02/skos/core#closeMatch

ils|http://dbpedia.org/resource/Integrated_library_system
ils|http://id.loc.gov/authorities/subjects/sh95003216
ils|http://eprints.rclis.org/handle/10760/3775
ils|http://d-nb.info/gnd/4583297-3
archives|http://eprints.rclis.org/handle/10760/3660
~~~~

## Outcome and Benefits

* Show related documents\
  guide people from communities to collections
* Catalog enrichment\
  guide people from collections to communities
* Collection analysis

## Compare collections with measuring at one KOS

Collection of papers at arXiv.org compared to question at theoretical computer
science Stack Exchange:

* *complexity theory* is asked much more then published
* *information theory* is published much more then asked about

## References

* Scripts and data harvested available at\
  <http://github.com/nichtich/se2skos>.
* Source of paper and slides available at\
  <http://github.com/jakobib/mtsr2012>.
* Both Wikipedia and Stack Exchange data available
  under CC-BY-SA accessible via open APIs:

      * <http://stackapps.com/>
	  * <http://en.wikipedia.org/w/api.php>

* Icons CC-BY based on [picol.org](http://picol.org)
