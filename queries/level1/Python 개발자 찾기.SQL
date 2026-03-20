/* 문제 
DEVELOPER_INFOS 테이블에서 Python 스킬을 가진 개발자의 정보를 조회하려 합니다.
Python 스킬을 가진 개발자의 ID, 이메일, 이름, 성을 조회하는 SQL 문을 작성해 주세요.
결과는 ID를 기준으로 오름차순 정렬해 주세요.

2026-03-20
처음 풀어보는 문제
where절과 order by 문의 순서가 바꿔서 오류
조건을 or로 처리 했지만 AI가 in을 사용하면 효율적이라고 추천하여 수정
*/
select ID, EMAIL, first_name, last_name
from DEVELOPER_INFOS
where 'Python' in (skill_1, skill_2, skill_3)
order by ID asc
