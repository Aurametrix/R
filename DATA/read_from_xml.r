library(xml2)
x <- read_xml("<foo>
  <bar>text <baz id = 'a' /></bar>
  <bar>2</bar>
  <baz id = 'b' /> 
</foo>")

xml_name(x)
#> [1] "foo"
xml_children(x)
#> {xml_nodeset (3)}
#> [1] <bar>text <baz id="a"/></bar>
#> [2] <bar>2</bar>
#> [3] <baz id="b"/>

# Find all baz nodes anywhere in the document
baz <- xml_find_all(x, ".//baz")
baz
#> {xml_nodeset (2)}
#> [1] <baz id="a"/>
#> [2] <baz id="b"/>
xml_path(baz)
#> [1] "/foo/bar[1]/baz" "/foo/baz"
xml_attr(baz, "id")
#> [1] "a" "b"
