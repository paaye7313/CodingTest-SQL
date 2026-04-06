/*문제
보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다. 
09:00부터 19:59까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 
이때 결과는 시간대 순으로 정렬해야 합니다.

2026-04-06
지난번에 month()를 다뤄 보았지만 hour()는 다뤄보지 않았기에 구글에 검색
hour()로 시간대를 구할 수 있다는 것을 확인
hour()로 시간대를 구함
지난번에 했던 분기구하기를 참고하여 작성
테스트와 수정을 거쳐 성공적으로 통과
*/
SELECT hour(DATETIME) as HOUR, count(ANIMAL_ID) as COUNT
from ANIMAL_OUTS
where hour(DATETIME) between 9 and 19
group by HOUR
order by HOUR asc