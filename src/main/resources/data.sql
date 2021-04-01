/* CLEAR */
DELETE FROM public.asset;
--
DELETE FROM public.address;
--
DELETE FROM public.address_mapping;
--
/* CREATE MAPPINGS */
INSERT INTO public.address_mapping(business_unit, level_1, level_2, level_3, level_4, level_5)
VALUES('UK', 'tvArea', 'conurbation', 'district', 'town', 'posterTown');
--
INSERT INTO public.address_mapping(business_unit, level_1, level_2, level_3)
VALUES('UK-NI', 'province', 'settlement', 'town');
--
INSERT INTO public.address_mapping(business_unit, level_1, level_2)
VALUES('ES', 'province', 'city');
--
/* CREATE */
INSERT INTO public.address(address_id, level_1, level_2, level_3, level_4, address, postcode, latitude, longitude)
VALUES(1, 'YORKSHIRE', 'SOUTH YORKS CONURBATION', 'SHEFFIELD', 'Sheffield',
       'Walkabout Sheffield Carver Street Sheffield', 'S1 4FS', 53.381091175726304, -1.4746462976581094);
--
INSERT INTO public.asset(asset_id, business_unit, frame_id, address_id)
VALUES(1, 'UK', 289393, 1);
--
INSERT INTO public.address(address_id, level_1, level_2, level_3, level_4, address, postcode, latitude, longitude)
VALUES(2, 'CARLTON', 'GREATER LONDON', 'LEWISHAM', 'Sydenham',
       'The Alfred 178 Sydenham Road London', 'SE26 5RP', 51.42590080217083, -0.04361715773521578);
--
INSERT INTO public.asset(asset_id, business_unit, frame_id, address_id)
VALUES(2, 'UK', 898323, 2);
--
INSERT INTO public.address(address_id, level_1, level_2, level_3, level_4, address, postcode, latitude, longitude)
VALUES(3, 'H.T.V', 'H.T.V', 'OGWR', 'MAESTEG UD',
       'Asda Bridgend Ffald Road Pyle Bridgend', 'S1 4FS', 51.53071879696844, -3.6910894198707775);
--
INSERT INTO public.asset(asset_id, business_unit, frame_id, address_id)
VALUES(3, 'UK', 601002, 3);
--
INSERT INTO public.address(address_id, level_1, level_2, level_3, address, postcode, latitude, longitude)
VALUES(4, 'ULSTER', 'ANTRIM', 'BALLYCLARE U.D.',
       'Asda Antrim Junction 1 Retail Park Antrim', 'BT41 4LL', 54.72611167218461, -6.228404857448751);
--
INSERT INTO public.asset(asset_id, business_unit, frame_id, address_id)
VALUES(4, 'UK-NI', 728732, 4);
--
INSERT INTO public.address(address_id, level_1, level_2, level_3, address, postcode, latitude, longitude)
VALUES(5, 'ULSTER', 'CRAIGAVON', 'PORTADOWN M.B.',
       'Asda Portadown Bridge Street Portadown', 'BT63 5AW', 54.42851835067586, -6.434728117150269);
--
INSERT INTO public.asset(asset_id, business_unit, frame_id, address_id)
VALUES(5, 'UK-NI', 92222, 5);
--
INSERT INTO public.address(address_id, level_1, level_2, level_3, address, postcode, latitude, longitude)
VALUES(6, 'ULSTER', 'LARNE', 'LARNE M.B.',
       'Asda Larne 1 Redlands Road Larne', 'BT40 1AX', 54.846756112902, -5.808095615285199);
--
INSERT INTO public.asset(asset_id, business_unit, frame_id, address_id)
VALUES(6, 'UK-NI', 3654546, 6);
--
INSERT INTO public.address(address_id, level_1, level_2, address, postcode, latitude, longitude)
VALUES(7, 'Madrid', 'ARANJUEZ', 'PASEO DEL DELEITE, FTE C/ ABUBILLA JTO B', '28300', 40.02536, -3.61282);
--
INSERT INTO public.asset(asset_id, business_unit, frame_id, address_id)
VALUES(7, 'ES', 67564576, 7);
--
INSERT INTO public.address(address_id, level_1, level_2, address, postcode, latitude, longitude)
VALUES(8, 'Alicante', 'Torrevieja', 'CARREFOUR Ctra. Crevillente', '03184', 37.99045823, -0.687536635);
--
INSERT INTO public.asset(asset_id, business_unit, frame_id, address_id)
VALUES(8, 'ES', 43434, 8);
