/*문제
USED_GOODS_BOARD 테이블에서 2022년 10월 5일에 등록된 중고거래 게시물의 
게시글 ID, 작성자 ID, 게시글 제목, 가격, 거래상태를 조회하는 SQL문을 작성해주세요. 
거래상태가 SALE 이면 판매중, RESERVED이면 예약중, DONE이면 거래완료 분류하여 출력해주시고, 
결과는 게시글 ID를 기준으로 내림차순 정렬해주세요.

2026-03-23
처음에는 오름차순 asc가 기억안나서 구글 검색 후 적용, 데이터는 잘 나왔지만 거래상태를 한글화 하지 않음
구글 검색 후 CASE 와 REPLACE 함수가 있는 것을 확인
치완해야할 데이터가 여러종류이기 때문에 CASE 사용
블로그에 나온데로 하는데 기존 데이터도 같이 나옴, 기존 컬럼을 없에고, as로 CASE 문 이름 변경
후에도 오류, 잘 보니 내림차순 정렬, desc로 변경후 정답.
*/
SELECT board_id, writer_id, title, price, 
CASE 
when status = 'SALE' then '판매중'
when status = 'RESERVED' then '예약중'
when status = 'DONE' then '거래완료'
END as 'STATUS'
from used_goods_board
where created_date = '2022-10-05'
order by board_id desc;