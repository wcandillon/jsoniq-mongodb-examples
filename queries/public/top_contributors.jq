(:
 : Users who answered the most questions.
 :)
for $answer in collection("answers")
group by $user := $answer.owner.display_name
let $count := count($answer)
order by $count descending
return {
  name  : $user,
  count : $count,
  title: collection("faq")[$$.question_id eq $answer[1].question_id].title
}
