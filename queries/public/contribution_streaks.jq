for $answers in collection("answers")
group by $user-id := $answers.owner.user_id

let $answers := for $answer in $answers
                order by $answer.creation_date
                return $answer

let $streaks := for tumbling window $answers in $answers
start $start when true
end $end next $next when $next.creation_date - $end.creation_date gt dayTimeDuration("P1D")
return $end.creation_date - $start.creation_date

let $streak := max($streaks)
let $rep   := sum($answers.score)
let $count := count($answers)
order by $streak descending
return {
    "username": $answers[1].owner.display_name,
    "number of answers": $count,
    "reputation": $rep,
    "largest contribution streak": days-from-duration($streak)
}
