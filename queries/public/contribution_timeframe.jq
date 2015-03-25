(:
 : Contribution timeframe for each user and the number
 : of questions answered during this timeframe.
 :)
for $answer in collection("answers")
group by $name := $answer.owner.display_name
let $created := $answer ! $$.creation_date
let $duration := max($created) - min($created)
order by $duration descending
let $count := count($answer)
where $count gt 1
return {
  name  : $name,
  days  : days-from-duration($duration),
  count : $count,
  start : format-dateTime(min($created),  "[D]. [MNn] [Y]", "de_AT", (), ())
}
