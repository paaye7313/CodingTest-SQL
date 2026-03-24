/*문제
SUBWAY_DISTANCE 테이블에서 노선별로 노선, 총 누계 거리, 평균 역 사이 거리를 
노선별로 조회하는 SQL문을 작성해주세요.

총 누계거리는 테이블 내 존재하는 역들의 역 사이 거리의 총 합을 뜻합니다. 
총 누계 거리와 평균 역 사이 거리의 컬럼명은 각각 TOTAL_DISTANCE, AVERAGE_DISTANCE로 해주시고, 
총 누계거리는 소수 둘째자리에서, 평균 역 사이 거리는 소수 셋째 자리에서 
반올림 한 뒤 단위(km)를 함께 출력해주세요.
결과는 총 누계 거리를 기준으로 내림차순 정렬해주세요.

2026-03-24
테스트 해보며 수정한 결과 테이터는 잘 나온걸 확인함.
그러나 단위를 함께 출력하는 방법을 모름
구글에 검색
CONCAT을 발견하여 적용 해봄
테스트는 성공, 하지만 정답 제출에서는 실패
그냥 눈으로 봐서는 왜 실패인지 파악되지 않음
AI에 넣어봄 -> 결과 order by 절에서 TOTAL_DISTANCE로 정렬했지만 
이것은 'km'를 포함 한 데이터여서 오류가 나는 것이였음
이것을 sum(D_BETWEEN_DIST)로 수정하여 실행하니 성공, 정답
*/
select ROUTE, CONCAT(round(sum(D_BETWEEN_DIST), 1), 'km') as TOTAL_DISTANCE, 
CONCAT(round(avg(D_BETWEEN_DIST), 2), 'km') as AVERAGE_DISTANCE
from subway_distance
group by route
order by sum(D_BETWEEN_DIST) desc