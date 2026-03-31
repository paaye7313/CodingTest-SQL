/*문제
각 분기(QUARTER)별 분화된 대장균의 개체의 총 수(ECOLI_COUNT)를 출력하는 SQL 문을 작성해주세요. 
이때 각 분기에는 'Q' 를 붙이고 분기에 대해 오름차순으로 정렬해주세요. 대장균 개체가 분화되지 않은 분기는 없습니다.

2026-03-31
날짜 데이터를 분기로 구분하는 방법을 모르기에 구글에 검색
DATENAME으로 날짜 데이이터를 여러 형식으로 변환 가능 하다는 것을 확인
DATENAME(QUARTER, DIFFERENTIATION_DATE)로 분기를 구함
CONCAT으로 뒤에 Q를 붙임
실패 (1305, 'FUNCTION programmers.DATENAME does not exist')
아마 프로그래머스에서 DATENAME을 지원하지 않는 것으로 파악
DATEPART로 바꾸어 사용
실패 (1305, 'FUNCTION programmers.DATEPART does not exist')
DATEPART도 지원 되지 않아서 다른 방법을 모색
MONTH로 월을 구하고 CASE를 통해 분기를 구하는 방법을 찾음
나머지는 이미 해본 것들 이여서 손쉽게 통과
*/
select case
  when month(DIFFERENTIATION_DATE) between 1 and 3 then '1Q'
  when month(DIFFERENTIATION_DATE) between 4 and 6 then '2Q'
  when month(DIFFERENTIATION_DATE) between 7 and 9 then '3Q'
  ELSE '4Q' END as QUARTER,
count(ID) as ECOLI_COUNT
from ECOLI_DATA
group by QUARTER
order by QUARTER asc

