UPDATE AmbulanceDriver
SET hasPCRKnowledge = 1
WHERE idAmbulanceDriver=1;

UPDATE Medics
set firstName = "Satrapa"
where idMedics = 1;

UPDATE Medics
set lastName = "Sacarepopa"
where idMedics = 1;

UPDATE DeliveryRooms	
set isAvailable = 0
where idDeliveryRooms = 1;

Update Chirophane
set floor = 3
where idChirophane = 1;

UPDATE Patients
set lastName = "Chacacampeon"
where idPatients = 2;

Update Ambulances
set ambulanceDriverId = 2222
where idAmbulances = 1;

Update MedicTrainees
set idMedicTrainees = 777
where idMedicTrainees = 1;

Update ChirophaneTrainees
set firstName = "Saul"
where idChirophanTrainees = 1;

Update ChirophaneTrainees
set lastName = "Goodman"
where idChirophanTrainees = 1;