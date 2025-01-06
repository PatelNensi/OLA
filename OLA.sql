CREATE DATABASE OLA;
SELECT * FROM ola_booking;

-- 1. Retrieve all successful bookings:
SELECT * FROM SUCCESSFUL_BOOKING;

CREATE VIEW SUCCESSFUL_BOOKING AS
SELECT * FROM ola_booking
WHERE Booking_Status = "SUCCESS"; 

-- 2. Find the average ride distance for each vehicle type:
SELECT * FROM avg_dist_ride;

CREATE VIEW AVG_DIST_RIDE AS
SELECT VEHICLE_TYPE, AVG(Ride_Distance)
FROM ola_booking
GROUP BY 1;

-- 3. Get the total number of cancelled rides by customers:
SELECT * FROM cancle_ride_customer;

CREATE VIEW CANCLE_RIDE_CUSTOMER AS
SELECT COUNT(*) FROM ola_booking
WHERE Booking_Status = "Canceled by Customer";

-- 4. List the top 5 customers who booked the highest number of rides:
SELECT * FROM top5_cust;

CREATE VIEW TOP5_CUST AS
SELECT CUSTOMER_ID, count(BOOKING_ID) AS TOTAL_RIDE
FROM ola_booking
GROUP BY Customer_ID
ORDER BY TOTAL_RIDE DESC LIMIT 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT * FROM CANCLE_BY_DRIVERS_PERSONAL;

CREATE VIEW CANCLE_BY_DRIVERS_PERSONAL AS
SELECT COUNT(*) FROM ola_booking
WHERE Canceled_Rides_by_Driver = "Personal & Car related issue";

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT * FROM max_min_driver_rating;

CREATE VIEW MAX_MIN_DRIVER_RATING AS
SELECT MAX(Driver_Ratings) AS MAX_RATING,
MIN(Driver_Ratings) AS MIN_RATING
FROM ola_booking
WHERE Vehicle_Type = "Prime Sedan";


-- 7. Retrieve all rides where payment was made using UPI:
SELECT * FROM UPI_TRASNSATION;

CREATE VIEW UPI_TRASNSATION AS
SELECT * FROM ola_booking
WHERE PAYMENT_METHOD = "UPI";

-- 8. Find the average customer rating per vehicle type:
SELECT * FROM avg_cust_rating;

CREATE VIEW AVG_CUST_RATING AS
SELECT VEHICLE_TYPE, ROUND(AVG(CUSTOMER_RATING),2)
FROM ola_booking
GROUP BY 1;

-- 9. Calculate the total booking value of rides completed successfully:
SELECT * FROM BOOK_SUCCESS;

CREATE VIEW BOOK_SUCCESS AS 
SELECT SUM(BOOKING_VALUE) AS BOOKING_SUCCESS
FROM ola_booking
WHERE Booking_Status = "SUCCESS";

-- 10. List all incomplete rides along with the reason
SELECT * FROM incomp_ride_reason_list;

CREATE VIEW INCOMP_RIDE_REASON_LIST AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM ola_booking
WHERE Incomplete_Rides = 'YES'; 