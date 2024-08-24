-- Por cada tabla (table), un comando create table
CREATE TABLE usuario (
    id VARCHAR2(20) CONSTRAINT id_key PRIMARY KEY,
    updated_at DATE,
    created_at DATE,
    email VARCHAR2(25),
    password VARCHAR2(20),
    first_name VARCHAR2(15),
    last_name VARCHAR2(15)
);

CREATE TABLE Amenity (
    id VARCHAR2(20) CONSTRAINT am_id_key PRIMARY KEY,
    updated_at DATE,
    created_at DATE,
    name VARCHAR2(25)
);

CREATE TABLE State (
    id VARCHAR2(20) CONSTRAINT st_id_key PRIMARY KEY,
    updated_at DATE,
    created_at DATE,
    name VARCHAR2(25)
);

CREATE TABLE City (
    id VARCHAR(20) CONSTRAINT ct_id_key PRIMARY KEY,
    state_id VARCHAR2(25),
    updated_at DATE,
    created_at DATE
);

CREATE TABLE Place (
    id VARCHAR(20) CONSTRAINT pl_id_key PRIMARY KEY,
    updated_at DATE,
    created_at DATE,
    user_id VARCHAR2(25),
    name VARCHAR2(25),
    city_id VARCHAR2(25),
    descripcion VARCHAR2(4000),
    number_rooms INTEGER DEFAULT 0,
    max_guest INTEGER DEFAULT 0,
    price_by_night INTEGER DEFAULT 0,
    latitude FLOAT,
    longitude FLOAT
);

CREATE TABLE PlaceAmenity (
    amenity_id VARCHAR2(20),
    place_id VARCHAR2(20)
);

CREATE TABLE Review (
    id VARCHAR(20) CONSTRAINT re_id_key PRIMARY KEY,
    updated_at DATE,
    created_at DATE,
    user_id VARCHAR2(25),
    place_id VARCHAR2(25),
    text VARCHAR2(500)
);

--Por cada restricción (constraint), un comando alter table
ALTER TABLE City 
ADD CONSTRAINT cit_id_fk FOREIGN KEY (state_id) REFERENCES State(id);
--
ALTER TABLE PlaceAmenity
ADD CONSTRAINT ame_id_fk FOREIGN KEY (amenity_id) REFERENCES Amenity(id);
ALTER TABLE PlaceAmenity
ADD CONSTRAINT place_id_fk FOREIGN KEY (place_id) REFERENCES Place(id);
--
ALTER TABLE Place
ADD CONSTRAINT use_id_fk FOREIGN KEY (user_id) REFERENCES Usuario(id);
ALTER TABLE Place
ADD CONSTRAINT city_id_fk FOREIGN KEY (city_id) REFERENCES City(id);
--
ALTER TABLE Review
ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES Usuario(id);
ALTER TABLE Review
ADD CONSTRAINT places_id_fk FOREIGN KEY (place_id) REFERENCES Place(id);