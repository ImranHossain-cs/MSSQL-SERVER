USE CarRental
GO
--Insert data in manufacturers using procedure spInsertManufacturer
DECLARE @id INT
EXEC spInsertManufacturer'Audi', 'Made in Germany', @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertManufacturer'Marcedes', 'Made in Germany', @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertManufacturer'BMW', 'Made in Germany', @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertManufacturer'Range Rover', 'Owning this company Jaguar Land', @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertManufacturer'Toyota', 'Made in Japan', @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertManufacturer'Hyundai', 'Made in South Korea', @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertManufacturer'Ford', 'Made in USA', @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertManufacturer'tesla', 'Made in USA', @id OUTPUT
SELECT @id as 'inserted with id'
GO
SELECT * FROM manufacturers
GO
--Update Data in manufacturer with  Procedure
EXEC spUpdateManufacturer @manufacturer_id=1, @manufacturer_name = 'Bentley'
EXEC spUpdateManufacturer @manufacturer_id=4, @manufacturer_name = 'Volvo'
EXEC spUpdateManufacturer @manufacturer_id=5, @manufacturer_name = 'Mclaren'
GO
SELECT * FROM manufacturers
GO
--Insert models data
DECLARE @id INT
EXEC spInsertModels 'AX1 ', 1, @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertManufacturer'MDS-01',2, @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertManufacturer'b-01', 3, @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertManufacturer'RV-1', 4, @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertManufacturer'TT-01',5, @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertManufacturer'H-06',6, @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertManufacturer'Ford-1', 7, @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertManufacturer'T-S1', 8, @id OUTPUT
SELECT @id as 'inserted with id'
GO
SELECT * FROM models
GO