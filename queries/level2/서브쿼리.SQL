/*문제
분화된 연도(YEAR), 분화된 연도별 대장균 크기의 편차(YEAR_DEV), 대장균 개체의 ID(ID) 를 출력하는 SQL 문을 작성해주세요. 
분화된 연도별 대장균 크기의 편차는 분화된 연도별 가장 큰 대장균의 크기 - 각 대장균의 크기로 구하며 결과는 연도에 대해 오름차순으로 정렬하고 
같은 연도에 대해서는 대장균 크기의 편차에 대해 오름차순으로 정렬해주세요.

2026-04-07
날짜 데이터에서 연도를 구하려고 YEAR함수를 사용
큰 대장균의 크기(MAX()) - 각 대장균
ID는 그대로 출력
알아서 시도해봤지만 오류가 있어 오류를 구글에 검색
집계 함수와 일반 컬럼을 동시에 조회할 때는 GROUP BY를 사용하거나 집계 함수만 사용해야 한다는 것을 확인
OVER()함수를 사용하여 연도별로 가장 큰 대장균의 크기를 구하는 방법을 찾음
하지만 좀더 검색해본 결과 서브쿼리를 사용하면 더 간단하게 해결할 수 있다는 것을 확인
MAX()함수를 서브쿼리로 대신하여 연도별로 가장 큰 대장균의 크기를 구하는 방법을 사용
테스트 중 오류의 원인을 파악
MAX()함수로 가장 큰 대장균의 크기구했지만 그것이 연도별로 구한것이 아니기때문에 오류가 발생한 것으로 파악
여기서 서브쿼리로 구하려는 컬럼에 해당하는 연도의 대장균 크기 중 가장 큰 것을 구하는 방법을 사용
테스트 통과

*/
select YEAR(DIFFERENTIATION_DATE) as YEAR,
    (
        SELECT
            MAX(ED2.SIZE_OF_COLONY)
        FROM
            ECOLI_DATA AS ED2
        WHERE
            YEAR = YEAR(ED2.DIFFERENTIATION_DATE)
    ) - ANY_VALUE(SIZE_OF_COLONY) as YEAR_DEV,
    ID
from ECOLI_DATA
order by YEAR asc, YEAR_DEV asc