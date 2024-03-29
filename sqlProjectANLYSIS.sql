SELECT * FROM subq.hotel_reservation;

-- 1. What is the total number of reservations in the dataset?
SELECT COUNT(*) AS "Total_reservation" FROM subq.hotel_reservation;

-- 2. Which meal plan is the most popular among guests?
SELECT COUNT(type_of_meal_plan),type_of_meal_plan
FROM subq.hotel_reservation
GROUP BY type_of_meal_plan;

-- 3. What is the average price per room for reservations involving children?
SELECT Booking_id,Avg_Price_Per_Room,No_of_Children
FROM subq.hotel_reservation
WHERE no_of_children > 0;

-- 4. How many reservations were made for the year 20XX (replace XX with the desired year)?
SELECT COUNT(Booking_ID) AS 'Total_Reservations'
FROM subq.hotel_reservation
WHERE YEAR(arrival_date) = 2017;

-- 5. What is the most commonly booked room type?
SELECT COUNT(Booking_ID) AS 'total_Booking_ID', room_type_reserved FROM subq.hotel_reservation
GROUP BY  room_type_reserved 
ORDER BY total_Booking_ID DESC LIMIT 1 ;

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
SELECT COUNT(*) AS 'FALL_ON_WEEKEND'
FROM  subq.hotel_reservation
WHERE no_of_weekend_nights > 0;

-- 7. What is the highest and lowest lead time for reservations?
SELECT MAX(lead_time), MIN(lead_time) FROM subq.hotel_reservation;

-- 8. What is the most common market segment type for reservations?
SELECT COUNT(Booking_ID), market_segment_type FROM subq.hotel_reservation
GROUP BY market_segment_type
ORDER BY COUNT(Booking_ID) DESC LIMIT 1;


-- 9. How many reservations have a booking status of "Confirmed"?
SELECT COUNT(Booking_ID) AS "total_Confirmed"  FROM subq.hotel_reservation
WHERE booking_status= "Not_Canceled";

-- 10. What is the total number of adults and children across all reservations?
SELECT SUM(no_of_adults) AS "total_no_of_adults",SUM(no_of_children) AS "total_no_of_children" 
FROM subq.hotel_reservation;

-- 11. What is the average number of weekend nights for reservations involving children?
SELECT AVG(no_of_weekend_nights)
FROM subq.hotel_reservation
WHERE no_of_children > 0;

-- 12. How many reservations were made in each month of the year?

SELECT  Month(arrival_date) AS 'Month',COUNT(arrival_date) FROM subq.hotel_reservation 
GROUP BY Month 
ORDER BY Month ASC;

-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type.
SELECT  room_type_reserved,AVG(no_of_week_nights) AS "avg_no_of_week" ,
AVG(no_of_weekend_nights)  AS "avg_no_of_weekend" 
FROM subq.hotel_reservation
GROUP BY room_type_reserved;


-- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
SELECT room_type_reserved,AVG(avg_price_per_room)
FROM subq.hotel_reservation
WHERE room_type_reserved = (
                            SELECT room_type_reserved
                            FROM subq.hotel_reservation
                            WHERE no_of_children>0
                            GROUP BY room_type_reserved
                            ORDER BY COUNT(room_type_reserved) DESC LIMIT 1)
GROUP BY room_type_reserved;

-- 15. Find the market segment type that generates the highest average price per room.
SELECT market_segment_type, AVG(avg_price_per_room)
FROM subq.hotel_reservation
GROUP BY market_segment_type
ORDER BY AVG(avg_price_per_room) DESC LIMIT 1;












