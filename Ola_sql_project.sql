create database OlaDB;
use OlaDB;
SELECT 
    *
FROM
    ola;

-- 1.Retrieve all successful bookings:
SELECT 
    *
FROM
    ola
WHERE
    booking_status = 'success';

-- 2. Find the average ride distance for each vehicle type:
SELECT 
    vehicle_type, AVG(ride_distance) AS AVG_ride_distance
FROM
    ola
GROUP BY vehicle_type
ORDER BY AVG_ride_distance;

-- 3. Get the total number of cancelled rides by customers:
SELECT 
    COUNT(*)
FROM
    ola
WHERE
    Booking_Status = 'canceled by Customer';

-- 4. List the top 5 customers who booked the highest number of rides:
SELECT 
    Customer_ID, COUNT(Booking_ID) AS total_rides
FROM
    ola
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT 
    COUNT(*) AS total_cancelled
FROM
    ola
WHERE
    canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT 
    MAX(driver_ratings) AS max_rating,
    MIN(driver_ratings) AS min_rating
FROM
    ola
WHERE
    vehicle_type = 'Prime sedan';

-- 7. Retrieve all rides where payment was made using UPI:
SELECT 
    COUNT(*) AS total_rides
FROM
    ola
WHERE
    payment_method = 'UPI';

-- 8. Find the average customer rating per vehicle type:
SELECT 
    vehicle_type, ROUND(AVG(customer_rating), 2) AS avg_rating
FROM
    ola
GROUP BY vehicle_type;

-- 9. Calculate the total booking value of rides completed successfully:
SELECT 
    SUM(Booking_Value) AS total_successful_value
FROM
    ola
WHERE
    Booking_Status = 'Success';

-- 10. List all incomplete rides along with the reason:
SELECT 
    Booking_ID, Incomplete_Rides_Reason
FROM
    ola
WHERE
    Incomplete_Rides = 'Yes';