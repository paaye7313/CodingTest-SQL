/*문제
동물 보호소에 들어온 동물 중 이름이 Lucy, Ella, Pickle, Rogan, Sabrina, Mitty인 
동물의 아이디와 이름, 성별 및 중성화 여부를 조회하는 SQL 문을 작성해주세요.
이때 결과는 아이디 순으로 조회해주세요.

2026-04-08
이 문제는 단순히 where 절에서 in 연산자를 사용하여 특정 이름을 가진 동물들을 조회하는 문제입니다.
in 연산자를 사용한다는 것을 인지했지만 정확한 사용법을 알아보기 위해 구글에 검색
괄호안에 찾으려는 이름들을 나열하면 된다는 것을 파악
문제의 이름을 그대로 복사하지만 데이터이기 때문에 따옴표도 잊지 않음
마무리로 order by 절을 사용하여 아이디 순으로 정렬하는 것을 잊지 않음

슬슬 level2 문제는 쉬워지기 때문에 다음날 부터 level3문제를 풀어볼 예정
*/
SELECT ANIMAL_ID, NAME, SEX_UPON_INTAKE
from ANIMAL_INS
where NAME in ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty')
order by ANIMAL_ID asc