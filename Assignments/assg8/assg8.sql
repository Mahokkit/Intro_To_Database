SELECT p_insurer AS Insurer, 
	   s_name AS Service, 
	   SUM(as_quantity) AS [Number Covered], 
	   SUM(as_quantity * s_costperunit) AS [Cost Covered]
FROM service INNER JOIN 
	(person INNER JOIN 
	(appointment INNER JOIN app_svc 
	ON appointment.a_id = app_svc.as_a_id) 
	ON person.p_id = appointment.a_p_id) 
	ON service.s_id = app_svc.as_s_id
GROUP BY p_insurer, s_name;
