-- SELECT Queries:

-- List every appointment involving a cow.
SELECT APPOINTMENT.* FROM APPOINTMENT
JOIN ANIMAL ON APPOINTMENT.animalID = ANIMAL.animalID
WHERE ANIMAL.species = 'cow';

-- List all staff members that attended the leg surgery (appointmentID = 4)
SELECT STAFF.* FROM STAFF 
JOIN ATTENDANCE ON STAFF.staffID = ATTENDANCE.staffID 
WHERE ATTENDANCE.appointmentID=4;

-- List all appointments that are check ups
SELECT * FROM APPOINTMENT
WHERE appointmentType="Check up";

-- Show the owner details for each animal
SELECT ANIMAL.*, OWNER.* FROM ANIMAL
JOIN OWNER ON ANIMAL.ownerID = OWNER.ownerID;

-- List the medication that Charlie the dog is prescribed (animalID = 5)
SELECT MEDICATION.name AS drugName FROM ANIMAL
JOIN PRESCRIPTION ON ANIMAL.animalID = PRESCRIPTION.animalID
JOIN PRESCRIPTION_MEDICATION ON PRESCRIPTION.prescriptionID = PRESCRIPTION_MEDICATION.prescriptionID
JOIN MEDICATION ON PRESCRIPTION_MEDICATION.medicationID = MEDICATION.medicationID
WHERE ANIMAL.animalID = 5;

-- INSERT Queries:

-- Add a new animal to the records, a dog named Mike that belongs to Jake Smith.
INSERT INTO ANIMAL(name, age, species, breed, type, ownerID)
VALUES ("Mike", 6, "dog", "Pug", "pet", 3);

-- Add an appointment record for vaccinations, for Mike the dog.
INSERT INTO APPOINTMENT(appointmentDate, appointmentTime, animalID, appointmentType, appointmentNotes)
VALUES('2022-01-06', '11:00:00', 9, "Vaccination", "Booster vaccines needed");

-- Add invoice for Mike the dog's appointment.
INSERT INTO BILLING (date, balance, paymentStatus, appointmentID)
VALUES ('2022-01-06', 80.00, "UNPAID", 6);

-- Add a stray animal without an owner.
INSERT INTO ANIMAL(name, age, species, breed, type)
VALUES("Jim", 4, "dog", "Chihuahua", "pet");

-- UPDATE Queries:

-- Update an invoice to status paid.
UPDATE BILLING
SET paymentStatus="PAID", paymentType="Card"
WHERE invoiceID=106;

-- Assign cat food to every cat in the ANIMAL table
UPDATE ANIMAL
SET foodID=3
WHERE species="cat";

-- Change an owners address
UPDATE OWNER 
SET address="48 wainsfort road, Galway"
WHERE ownerID=1;

-- Update the notes for an appointment
UPDATE APPOINTMENT
SET appointmentNotes="Leg fracture repair, need to rebook follow up appointment"
WHERE appointmentID = 4;

-- DELETE Queries

-- Remove an appointment record from the APPOINTMENT table.
DELETE FROM APPOINTMENT 
WHERE appointmentID=6;

-- Remove an invoice associated with an appointment thats been removed.
DELETE FROM BILLING
WHERE appointmentID=6;

-- Remove a diagnosis record associated with a specific animal.
DELETE FROM DIAGNOSIS
WHERE animalID = 5;

-- Remove any invoice record that is already paid
DELETE FROM BILLING
WHERE paymentStatus="PAID";


