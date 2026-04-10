/*문제
REST_INFO 테이블에서 음식종류별로 즐겨찾기수가 가장 많은 식당의 
음식 종류, ID, 식당 이름, 즐겨찾기수를 조회하는 SQL문을 작성해주세요. 
이때 결과는 음식 종류를 기준으로 내림차순 정렬해주세요.

2026-04-10
이 문제는 같은 FOOD_TYPE별로 FAVORITES가 가장 큰 식당을 찾는 문제
문제의 카테고리가 group by이므로 group by를 사용하여 FOOD_TYPE별로 그룹화
그룹화된 FOOD_TYPE별로 FAVORITES가 가장 큰 식당을 찾는 방법은 MAX()함수를 사용하는 것
저번에 풀어본 문제 중 서브쿼리를 사용하여 그룹화된 컬럼의 최대값을 구하는 방법이 있었는데 그것을 활용하여 서브쿼리를 작성
서브쿼리에서는 FOOD_TYPE별로 FAVORITES의 최대값을 구하는데, 이때 서브쿼리에서 FOOD_TYPE을 그룹화하여 최대값을 구하는 것이 중요
서브쿼리에서 FOOD_TYPE별로 FAVORITES의 최대값을 구한 후, 메인 쿼리에서는 서브쿼리에서 구한 최대값과 FAVORITES가 일치하는 식당을 찾는 방법을 사용
했으나 FOOD_TYPE이 다르지만 FAVORITES이 같은 경우가 발생하여 오류가 발생하는 것을 확인
기본으로 돌아와 그냥 group by를 사용하여 FOOD_TYPE별로 그룹화한 후, FAVORITES가 가장 큰 식당을 찾는 방법을 사용
일식에서 FAVORITES가 가장 큰 식당의 이름이 다르다는 것을 확인
FAVORITES와 식당 이름, id가 다른게 출력되는 상황을 확인
구글에 검색하여 join으로 문제를 해결하는 방법을 찾음
테스트 후 통과

FOOD_TYPE과 max(FAVORITES)을 구하는 서브쿼리를 join하여 FOOD_TYPE과 FAVORITES가 일치하는 식당을 찾는 방법을 사용
내부적으로 어떤 동작을 하는지 이해하지 못하였으나 where절을 제거하는 등 거의 join만 남겨 테스트 한 결과 모든 컬럼을 확인하여 이해 하는데 성공
join으로 REST_INFO 테이블 뒤에 FOOD_TYPE과 max(FAVORITES)를 추가로 붙여 where로 이것에 맞는 row를 찾는 것이였음

3단계 답게 좀 어려웠음
*/
SELECT RI1.FOOD_TYPE, RI1.REST_ID, RI1.REST_NAME, RI1.FAVORITES
from REST_INFO as RI1
join (
    select FOOD_TYPE, max(FAVORITES) as FAVORITES
    from REST_INFO
    group by FOOD_TYPE
) as RI2
where RI1.FOOD_TYPE = RI2.FOOD_TYPE and RI1.FAVORITES = RI2.FAVORITES
order by FOOD_TYPE desc, FAVORITES desc