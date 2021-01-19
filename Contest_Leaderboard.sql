SELECT score_table.hacker_id,hackers.name, score_table.score from hackers RIGHT JOIN 
(
SELECT subq.hacker_id , sum(max_score) AS score from 
(SELECT hacker_id, challenge_id , max(score) AS max_score from submissions GROUP BY hacker_id, challenge_id) subq
GROUP BY subq.hacker_id 
HAVING score>0
) score_table
ON hackers.hacker_id=score_table.hacker_id
ORDER BY score_table.score DESC, score_table.hacker_id;




