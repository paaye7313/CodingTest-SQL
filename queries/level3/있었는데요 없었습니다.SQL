/*문제
관리자의 실수로 일부 동물의 입양일이 잘못 입력되었습니다. 
보호 시작일보다 입양일이 더 빠른 동물의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 
이때 결과는 보호 시작일이 빠른 순으로 조회해야합니다.

2026-04-22
이 문제는 ANIMAL_INS 테이블의 DATETIME보다 ANIMAL_OUTS 테이블의 DATETIME이 더 빠른 경우의 ANIMAL_ID와 NAME을 출력하는 문제
그냥 보았을때는 DATETIME을 조인해서 둘이 비교하고 조건에 맞는 데이터만 출력하면 끝나 보임
일단 저번에 join 사용한 풀이들을 참고하고 날짜 계산에 대해서 구글에 검색해서 풀어봄
DATEDIFF()로 날짜의 차를 구할 수 있는 것을 확인
이후 테스트와 수정을 거쳐 테스트 성공, 채점 실패
DATEDIFF()을 사용해야 할줄 알았으나 그냥 부등호로도 연산이 정상적으로 되는 것을 확인
order by 문을 작성하여 다시 채점 성공

전에 풀어본 join+서브쿼리 문을 활용하니깐 간단하게 해결함

*/
SELECT ain.ANIMAL_ID, ain.NAME
from ANIMAL_INS as ain
join ( select ANIMAL_ID, DATETIME
      from ANIMAL_OUTS)
as aout
on ain.ANIMAL_ID = aout.ANIMAL_ID
where ain.DATETIME > aout.DATETIME
order by ain.DATETIME asc