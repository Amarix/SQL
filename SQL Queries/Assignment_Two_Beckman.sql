USE Tour;

SELECT TripName, Type, MaxGrpSize
FROM Trip, Guide, TripGuide
WHERE Trip.TripID = TripGuide.TripID
AND Guide.GuideNum = TripGuide.GuideNum
AND LastName = 'Kelly';

SELECT ReservationID, LastName, TripName
FROM Reservation, Trip, Customer
WHERE Reservation.TripID = Trip.TripID
AND Reservation.CustomerNum = Customer.CustomerNum
AND NumPersons > 4;

SELECT ReservationID, TripName, LastName,
((TripPrice + OtherFees)*NumPersons)
AS TotalCost
FROM Reservation, Trip, Customer
WHERE Reservation.TripID = Trip.TripID
AND Reservation.CustomerNum = Customer.CustomerNum
AND NumPersons > 4;

INSERT INTO Reservation
VALUES(1600031, 12, 2016-10-01, 2, 40, 11, 123);

UPDATE Reservation
SET OtherFees = 14
WHERE OtherFees = 11;

SELECT State, COUNT(State)
FROM Trip
GROUP BY State