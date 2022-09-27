INSERT INTO public."Rol"
(id, "name")
VALUES('85ee7df7-a7d3-481f-ade2-5be7d8ea7c05', 'Administrador');
INSERT INTO public."Rol"
(id, "name")
VALUES('5a3311d6-775a-482b-aa66-fc4337956338', 'Vendedor');
INSERT INTO public."Rol"
(id, "name")
VALUES('666d227b-3bc9-40cc-8f50-31c752477f5b', 'Cliente');


INSERT INTO public."Person" (id, names, lastname, "document", email, "phoneNumber", "Address", city, age, created_at) 
VALUES('9818097b-9e4b-4f26-b55a-43bbc9893668', 'Admin', 'Admin','19283', 'admin@gameCreed.com', 3154445588, 'calle 66 #55', 'Medellín', 28, CURRENT_TIMESTAMP);

INSERT INTO public."User"
(id, "userName", "password", "rolId", "personId", created_at)
VALUES('2b596d9e-ad10-4c64-9b14-535d610a5601', 'Admin', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
'85ee7df7-a7d3-481f-ade2-5be7d8ea7c05', '9818097b-9e4b-4f26-b55a-43bbc9893668', CURRENT_TIMESTAMP);
