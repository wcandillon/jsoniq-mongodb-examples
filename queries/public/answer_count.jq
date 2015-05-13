(:
 : Number of answers per question.
 :)
for $answers in collection("answers")
let $id := $answers.question_id
group by $id
let $title := collection("faq")[$$.question_id eq $id].title
let $count := count($answers)
order by $count descending
return {
  title : $title,
  count : $count
}
