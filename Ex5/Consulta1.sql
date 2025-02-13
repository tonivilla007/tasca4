use exercici5;
select idCita as num, Data as Dia, Hora as hora, Marca as Marca, Model as Modelo, Nom as Nom  
From Cita as c, Vehicle as v, Client as cl 
where v.idVehicle=c.Vehicle_idVehicle and cl.idClient=v.Client_idClient and c.Data>"13/03/2025";