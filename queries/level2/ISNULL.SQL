/*문제
ROOT 아이템을 찾아 아이템 ID(ITEM_ID), 아이템 명(ITEM_NAME)을 출력하는 SQL문을 작성해 주세요. 
이때, 결과는 아이템 ID를 기준으로 오름차순 정렬해 주세요.

2026-03-30
저번에 한 join예제를 보고 join 문법을 다시 확인한 뒤
한번에 통과
난이도를 올려도 괜찮을 듯?
*/
select info.ITEM_ID, info.ITEM_NAME
from ITEM_INFO as info
join ITEM_TREE as tree
on info.ITEM_ID = tree.ITEM_ID
where tree.PARENT_ITEM_ID is null
order by info.ITEM_ID asc