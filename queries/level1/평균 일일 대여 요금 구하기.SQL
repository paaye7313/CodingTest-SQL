/* 문제
CAR_RENTAL_COMPANY_CAR 테이블에서 자동차 종류가 'SUV'인 자동차들의
평균 일일 대여 요금을 출력하는 SQL문을 작성해주세요.
이때 평균 일일 대여 요금은 소수 첫 번째 자리에서 반올림하고, 컬럼명은 AVERAGE_FEE 로 지정해주세요.

2026-03-20
첫 시도만에 성공? 오류는 나지 않음 채점은 오답
문제를 다시 읽고 반올림 조건을 확인
첫 번째 자리 까지 반올림 해서 오답
수정 후 정답
*/
SELECT Round(AVG(Daily_fee), 0) as AVERAGE_FEE
from car_rental_company_car
where car_type = 'SUV'
