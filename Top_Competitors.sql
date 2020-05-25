/*
Enter your query here.
*/
SELECT H.HACKER_ID,H.NAME
FROM HACKERS H
INNER JOIN SUBMISSIONS S
ON H.HACKER_ID=S.HACKER_ID
INNER JOIN CHALLENGES C
ON S.CHALLENGE_ID=C.CHALLENGE_ID
INNER JOIN DIFFICULTY D
ON C.DIFFICULTY_LEVEL=D.DIFFICULTY_LEVEL
WHERE S.SCORE=D.SCORE AND C.DIFFICULTY_LEVEL=D.DIFFICULTY_LEVEL
GROUP BY H.HACKER_ID,H.NAME
HAVING COUNT(S.HACKER_ID)>1
ORDER BY COUNT(S.HACKER_ID) DESC, S.HACKER_ID ASC;
