/*문제
PRODUCT 테이블에서 판매 중인 상품 중 가장 높은 판매가를 출력하는 SQL문을 작성해주세요.
이때 컬럼명은 MAX_PRICE로 지정해주세요.

2026-03-23
간단한 문제.
난이도를 올려도 괜찮을듯?
*/
SELECT max(price) as 'MAX_PRICE'
from product