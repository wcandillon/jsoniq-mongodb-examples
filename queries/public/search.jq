(:
 : Questions whose title contains the terms "nosql" and "database"
 : and which are tagged with "mongodb".
 :)
for $faq in collection("faqs")
let $title := $faq.title,
    $lc-title := lower-case($title)
where contains($lc-title, "nosql") and
      contains($lc-title, "database") and
      $faq.tags()[$$ eq "mongodb"]
return {
  title : $title,
  tags  : $faq.tags
}
