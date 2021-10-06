IF DB_ID('CarRental') IS NULL
	CREATE DATABASE CarRental
GO 
USE CarRental
GO
CREATE TABLE manufacturers
(
	manufacturer_id INT IDENTITY PRIMARY KEY,
	manufacturer_name NVARCHAR(50) NOT NULL,
	manufacturer_details NVARCHAR(150) NULL
)
GO
--Insert manufacture with procedure
CREATE PROC spInsertManufacturer	@manufacturer_name nvarchar(50) ,
							@manufacturer_details nvarchar(150) NOT NULL,
							@manufacturer_id INT  OUTPUT
AS
	DECLARE @id INT
	BEGIN TRY
		insert into manufacturers (manufacturer_name, manufacturer_details) values (@manufacturer_name, @manufacturer_details)
		SELECT @manufacturer_id = SCOPE_IDENTITY()
		
	END TRY
	BEGIN CATCH
		DECLARE @errmessage nvarchar(500)
		set @errmessage = ERROR_MESSAGE()
		RAISERROR( @errmessage, 11, 1)
		return 
	END CATCH
GO

--Update manufactur with Procedure
CREATE PROC spUpdateManufacturer @manufacturer_id INT,
								@manufacturer_name NVARCHAR(50)=null,
								@manufacturer_details NVARCHAR(150)=NULL
AS
BEGIN TRY
	UPDATE manufacturers SET manufacturer_name=ISNULL(@manufacturer_name,manufacturer_name),manufacturer_details=ISNULL(@manufacturer_details,manufacturer_details)
	WHERE manufacturer_details=@manufacturer_id
END TRY
BEGIN CATCH
	DECLARE @errmessage nvarchar(500)
	set @errmessage = ERROR_MESSAGE()
	RAISERROR( @errmessage, 11, 1)
	return 
END CATCH
return 
GO
--DELETE Manufacturer Procedure
CREATE PROC spDeleteManufacturer @manufacturer_id INT							
AS
BEGIN TRY
	DELETE manufacturers
	WHERE manufacturer_id=@manufacturer_id
END TRY
BEGIN CATCH
	;
	THROW 5002,'Can''t Delete',1
END CATCH
GO

CREATE TABLE models
(
	model_id INT IDENTITY PRIMARY KEY,
	model_name NVARCHAR(30) NOT NULL,
	manufacturer_id INT NOT NULL REFERENCES manufacturers (manufacturer_id)
)
GO
--insert model procedure
CREATE PROC spInsertModels	@model_name nvarchar(30) ,
							@manufacturer_id INT,
							@model_id INT  OUTPUT
AS
	DECLARE @id INT
	BEGIN TRY
		insert into models(model_id,model_name,manufacturer_id) values (@model_id,@model_name,@manufacturer_id)
		SELECT @model_id = SCOPE_IDENTITY()
		
	END TRY
	BEGIN CATCH
		DECLARE @errmessage nvarchar(500)
		set @errmessage = ERROR_MESSAGE()
		RAISERROR( @errmessage, 11, 1)
		return 
	END CATCH
GO
--Update Models with Procedure
CREATE PROC spUpdateModels 
							@model_name NVARCHAR(50),
							@manufacturer_id INT,
							@model_id INT
							
AS
BEGIN TRY
	UPDATE models
	SET model_name=@model_name,model_id=@model_id
	WHERE manufacturer_id=@manufacturer_id

END TRY
BEGIN CATCH
	;
	THROW 5002,'Update failed',1
END CATCH
GO
--DELETE Models Procedure
CREATE PROC spDeleteModels @model_id INT							
AS
BEGIN TRY
	DELETE models
	WHERE model_id=@model_id
END TRY
BEGIN CATCH
	;
	THROW 5002,'Can''t Delete',1
END CATCH
GO

CREATE TABLE customers
(
	customer_id INT IDENTITY PRIMARY KEY,
	customer_name NVARCHAR(50) NOT NULL,
	customer_email NVARCHAR(50) NOT NULL,
	customer_phone NVARCHAR(20) NOT NULL,
	customer_address NVARCHAR(150) NOT NULL
)
GO
--insert customers procedure
CREATE PROC spInsertCustomers	
								@customer_name nvarchar(30) ,
								@customer_email NVARCHAR(50),
								@customer_phone NVARCHAR(20),
								@customer_address NVARCHAR(150)

AS
	DECLARE @customer_id INT
	BEGIN TRY
		insert into customers(customer_name,customer_email,customer_phone,customer_address) values (@customer_name,@customer_email,@customer_phone,@customer_address)
		SELECT @customer_id = SCOPE_IDENTITY()
		
	END TRY
	BEGIN CATCH
		DECLARE @errmessage nvarchar(500)
		set @errmessage = ERROR_MESSAGE()
		RAISERROR( @errmessage, 11, 1)
		return 
	END CATCH
GO
--Update Customers with Procedure
CREATE PROC spUpdateCustomers @customer_id INT,
							@customer_name nvarchar(30) ,
								@customer_email NVARCHAR(50),
								@customer_phone NVARCHAR(20)
							
AS
BEGIN TRY
	UPDATE customers
	SET customer_name =@customer_name,customer_email=@customer_email,customer_phone=@customer_phone
	WHERE customer_id=@customer_id

END TRY
BEGIN CATCH
	;
	THROW 5002,'Update failed',1
END CATCH
GO
--DELETE Customers Procedure
CREATE PROC spDeleteCustomers @customer_id INT							
AS
BEGIN TRY
	DELETE customers
	WHERE customer_id=@customer_id
END TRY
BEGIN CATCH
	;
	THROW 5002,'Can''t Delete',1
END CATCH
GO

CREATE TABLE bookingstatus
(
	status_id INT IDENTITY PRIMARY KEY,
	status_desc NVARCHAR(20) NOT NULL
)
GO
--Insert Procedure for Booking Status
CREATE PROC spInsertBookingstatus @status_desc nvarchar(20),
												@status_id INT OUTPUT
AS
	DECLARE @id INT
	BEGIN TRY
		INSERT INTO bookingstatus(status_desc) VALUES (@status_desc)
		SELECT @status_id=SCOPE_IDENTITY()
	END TRY
	BEGIN CATCH
		DECLARE @errmessage nvarchar(500)
		set @errmessage = ERROR_MESSAGE()
		RAISERROR( @errmessage, 11, 1)
		return 
	END CATCH
GO
--Update BookingStatus with Procedure
CREATE PROC spUpdateBookingStatus 
								@status_id INT,
								@status_desc NVARCHAR(20)
								
							
AS
BEGIN TRY
	UPDATE BookingStatus
	SET status_desc =@status_desc
	WHERE status_id=@status_id

END TRY
BEGIN CATCH
	;
	THROW 5002,'Update failed',1
END CATCH
GO
--DELETE Customers Procedure
CREATE PROC spDeleteBookingStatus @status_id INT							
AS
BEGIN TRY
	DELETE bookingstatus
	WHERE status_id=@status_id
END TRY
BEGIN CATCH
	;
	THROW 5002,'Can''t Delete',1
END CATCH
GO

CREATE TABLE vehicle_categories
(
	category_id INT IDENTITY PRIMARY KEY,
	category_name  NVARCHAR(40) NOT NULL
)
GO
--Insert VehicleCategories Procedure 
CREATE PROC spInsertVrhicleCategories	
										@category_name  NVARCHAR(40)
										

AS
	DECLARE @category_id INT
	BEGIN TRY
		insert into vehicle_categories(category_name) values (@category_name)
		SELECT @category_id = SCOPE_IDENTITY()
		
	END TRY
	BEGIN CATCH
		DECLARE @errmessage nvarchar(500)
		set @errmessage = ERROR_MESSAGE()
		RAISERROR( @errmessage, 11, 1)
		return 
	END CATCH
GO
--Update VehicleCategories with Procedure
CREATE PROC spUpdateVrhicleCategories @category_id INT,
							@category_name  NVARCHAR(40)
							
AS
BEGIN TRY
	UPDATE vehicle_categories
	SET category_name=@category_name
	WHERE category_id=@category_id

END TRY
BEGIN CATCH
	;
	THROW 5002,'Update failed',1
END CATCH
GO
--DELETE VehicleCategories Procedure
CREATE PROC spDeleteVrhicleCategories @category_id INT							
AS
BEGIN TRY
	DELETE vehicle_categories
	WHERE category_id=@category_id

END TRY
BEGIN CATCH
	;
	THROW 5002,'Can''t Delete',1
END CATCH
GO

CREATE TABLE vehicles
(
	vehicle_id INT IDENTITY PRIMARY KEY,
	current_milage INT NOT NULL,
	hire_rate MONEY NOT NULL,
	engine_size INT NOT NULL,
	category_id INT NOT NULL REFERENCES vehicle_categories(category_id),
	model_id INT NOT NULL REFERENCES models(model_id)
)
GO
--INSERT PROCEDURE FOR  VEHICLES
CREATE PROC spInsertVehicles @current_milage INT,
								@hire_rate MONEY ,
								@engine_size INT,
								@category_id INT,
								@model_id INT,
								@vehicle_id INT OUTPUT
AS
	DECLARE @id INT
	BEGIN TRY
		INSERT INTO vehicles(vehicle_id,current_milage,hire_rate,engine_size,category_id,model_id) VALUES (@vehicle_id,@current_milage,@hire_rate,@engine_size,@category_id,@model_id)
		SELECT @vehicle_id=SCOPE_IDENTITY()
	END TRY
	BEGIN CATCH
		DECLARE @errmessage nvarchar(500)
		set @errmessage = ERROR_MESSAGE()
		RAISERROR( @errmessage, 11, 1)
		return 
	END CATCH
GO
--Update Vehicles with Procedure
CREATE PROC spUpdateVehicles 
								@vehicle_id INT,
								@current_milage INT,
								@hire_rate MONEY ,
								@engine_size INT
							
AS
BEGIN TRY
	UPDATE vehicles
	SET current_milage=@current_milage,hire_rate=@hire_rate,engine_size=@engine_size
	WHERE vehicle_id=@vehicle_id

END TRY
BEGIN CATCH
	;
	THROW 5002,'Update failed',1
END CATCH
GO
--DELETE Vehicles Procedure
CREATE PROC spDeleteVehicles @vehicle_id INT							
AS
BEGIN TRY
	DELETE vehicles
	WHERE vehicle_id=@vehicle_id
END TRY
BEGIN CATCH
	;
	THROW 5002,'Can''t Delete',1
END CATCH
GO

CREATE TABLE bookings
(
	booking_id INT IDENTITY PRIMARY KEY,
	date_from DATE NOT NULL,
	date_to DATE NOT NULL,
	payment_recieved_on DATE  NULL,
	customer_id INT NOT NULL REFERENCES customers (customer_id),
	vehicle_id INT NOT NULL REFERENCES vehicles (vehicle_id)
	
)
GO
--Insert Bookings Procedure 
CREATE PROC spInsertBookings	
								@date_from DATE ,
								@date_to DATE,
								@payment_recieved_on DATE,
								@customer_id INT,
								@vehicle_id INT

AS
	DECLARE @booking_id INT
	BEGIN TRY
		insert into bookings(date_from,date_to,payment_recieved_on,customer_id,vehicle_id) values (@date_from,@date_to,@payment_recieved_on,@customer_id,@vehicle_id)
		SELECT @booking_id = SCOPE_IDENTITY()
		
	END TRY
	BEGIN CATCH
		DECLARE @errmessage nvarchar(500)
		set @errmessage = ERROR_MESSAGE()
		RAISERROR( @errmessage, 11, 1)
		return 
	END CATCH
GO

--Update Bookings with Procedure
CREATE PROC spUpdateBookings @booking_id INT,
							@date_from DATE,
							@date_to DATE
							
AS
BEGIN TRY
	UPDATE bookings
	SET date_from=@date_from,date_to=@date_to
	WHERE booking_id=@booking_id

END TRY
BEGIN CATCH
	;
	THROW 5002,'Update failed',1
END CATCH
GO
--DELETE bookings Procedure
CREATE PROC spDeleteBookings @booking_id INT							
AS
BEGIN TRY
	DELETE bookings
	WHERE booking_id=@booking_id
END TRY
BEGIN CATCH
	;
	THROW 5002,'Can''t Delete',1
END CATCH
GO

----VIEW Car Models & Manufactur Records-----
CREATE VIEW Models_Manufacturer_Records
WITH ENCRYPTION
AS
	
