/*문제
PRODUCT 테이블과 OFFLINE_SALE 테이블에서 상품코드 별 매출액(판매가 * 판매량) 합계를 
출력하는 SQL문을 작성해주세요. 
결과는 매출액을 기준으로 내림차순 정렬해주시고 
매출액이 같다면 상품코드를 기준으로 오름차순 정렬해주세요.

2026-03-26
join문 문법이 기억나지 않아서 구글에 검색
데이터를 곱하는 법 구글에 검색
정렬을 여러조건으로 하는 방법 구글에 검색
테스트 해보기에는 정상으로 보이는데 채점에서는 오답이라고 나와서 AI를 사용
AI는 sum 집계함수를 안넣었다고 지적, 하지만 넣어서도 테스트 했었음
예상되는 문제로는 넣어서 테스트 했을때 group by절을 빼고 테스트 했기 때문으로 추정
*/
SELECT p.PRODUCT_CODE, sum(p.PRICE * o.SALES_AMOUNT) as SALES
from PRODUCT as p
join OFFLINE_SALE as o
on p.PRODUCT_ID = o.PRODUCT_ID
group by p.PRODUCT_CODE
order by SALES desc, p.PRODUCT_CODE asc