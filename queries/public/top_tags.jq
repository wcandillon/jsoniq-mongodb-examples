(:
 : Most used tags.
 :)
for $tag in collection("faqs").tags()
group by $tag
count $count
order by $count descending
return {
  tag   : $tag,
  count : $count
}
