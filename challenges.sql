select result_table.hacker_id,result_table.name ,result_table.challenge_count from 
(
SELECT left_table.*, lead(left_table.challenge_count) over(order by left_table.challenge_count)as lead_challenge_count,
lag(left_table.challenge_count) over(order by left_table.challenge_count)as lag_challenge_count
from
(
select challenges_count_table.*,max_count_table.*  from 
(SELECT  count_table.hacker_id,hackers.name ,count_table.challenge_count 
FROM hackers RIGHT JOIN  
(SELECT hacker_id, COUNT(challenge_id) AS challenge_count
FROM challenges GROUP BY hacker_id) count_table
ON hackers.hacker_id=count_table.hacker_id
) challenges_count_table
left join 
(
SELECT max(count_table.challenge_count) as max_challenges from (SELECT hacker_id, COUNT(challenge_id) AS challenge_count FROM challenges GROUP BY hacker_id) count_table
) max_count_table
on 1=1

) left_table
) result_table
where challenge_count!=lead_challenge_count and challenge_count!=lag_challenge_count and  challenge_count<max_challenges
union all 
(
SELECT  count_table.hacker_id,hackers.name ,count_table.challenge_count 
FROM hackers RIGHT JOIN  
(SELECT hacker_id, COUNT(challenge_id) AS challenge_count
FROM challenges GROUP BY hacker_id ) count_table
ON hackers.hacker_id=count_table.hacker_id
where count_table.challenge_count=50 )


order by challenge_count desc,hacker_id
