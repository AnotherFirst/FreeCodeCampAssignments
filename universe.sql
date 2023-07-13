--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying NOT NULL,
    solar_masses_in_mio numeric NOT NULL,
    location text NOT NULL,
    special_features text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    size_in_kpc numeric,
    min_distance_in_kpc numeric,
    naked_eye_visible boolean,
    special_feature text NOT NULL,
    shape character varying(50)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    diameter_in_km integer,
    orbital_period_in_days numeric,
    surface_features text,
    discovery_date integer,
    discovering_entity text,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    earth_masses numeric,
    earth_radii numeric,
    orbital_period_in_earth_days numeric,
    surface_temp_in_k integer,
    atmosphere text,
    composition character varying(50),
    distinctive_feature text NOT NULL,
    planet_type character varying(50) NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    spectral_type character varying(10),
    luminosity numeric,
    solar_masses numeric,
    solar_radii numeric,
    temp_in_k numeric,
    binary_system boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A', 4.3, 'Center of Milky Way', 'supermassive black hole at the Milky Way’s center', 1);
INSERT INTO public.black_hole VALUES (2, 'M32', 2.5, 'Center of Andromeda', 'satellite galaxy’s central black hole', 2);
INSERT INTO public.black_hole VALUES (3, 'Virgo A', 6500, 'Center of M87', 'active galactic nucleus, relativistic jet', 5);
INSERT INTO public.black_hole VALUES (4, 'NGC 4151 Black Hole', 50, 'Center of NGC 4151', 'active galactic nucleus, accretion disk', 4);
INSERT INTO public.black_hole VALUES (5, 'NGC 6946 Black Hole', 0.00002, 'Unknown', 'supernova remnants, potential for active feeding', 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 26.8, 7.9, true, 'home to a semi-intelligent life form called "humans"', 'spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 46.56, 765, true, 'closest spiral galaxy to Milky Way, which is it predicted to collide with in 4 billion years', 'spiral');
INSERT INTO public.galaxy VALUES (3, 'Lindsay-Shapley Ring (AM 0644-741)', NULL, 0.09, false, 'The ring structure is a result of a rare cosmic collision between two galaxies that occurred hundreds of millions of years ago.', 'ring');
INSERT INTO public.galaxy VALUES (4, 'Eye of Sauron (NGC 4151)', NULL, 15800, false, 'nicknamed "Eye of Sauron" for its appearance', 'spiral');
INSERT INTO public.galaxy VALUES (5, 'Virgo A (M87)', 40.55, 16400, false, 'active supermassive black hole at its core', 'ellipsis');
INSERT INTO public.galaxy VALUES (6, 'Fireworks Galaxy (NGC 6946)', 26.77, 7720, false, 'bright and spotty appearance', 'spiral');
INSERT INTO public.galaxy VALUES (7, 'unspecified', NULL, NULL, NULL, 'nothing, anything', 'none');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474, 27.3, 'Impact craters, maria', NULL, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 27, 0.32, 'Stickney crater', 1877, 'Asaph Hall', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 15, 1.26, 'Unusual grooves', 1877, 'Asaph Hall', 4);
INSERT INTO public.moon VALUES (4, 'Io', 3642, 1.77, 'Active volcanoes', 1610, 'Galileo Galilei', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 3121, 3.55, 'Geologically young surface', 1610, 'Galileo Galilei', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268, 7.15, 'Craters, grooved terrain', 1610, 'Galileo Galilei', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4820, 16.69, 'Heavily cratered surface', 1610, 'Galileo Galilei', 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 167, 0.498, 'Pitted and grooved surface', 1892, 'Edward Emerson Barnard', 5);
INSERT INTO public.moon VALUES (9, 'Thyone', 4, 650.23, 'Irregular shape', 2001, 'Scott S. Sheppard', 5);
INSERT INTO public.moon VALUES (10, 'Titan', 5150, 15.95, 'Atmosphere mainly nitrogen', 1655, 'Christiaan Huygens', 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 1528, 4.52, 'Impact craters, bright wispy terrain', 1672, 'Giovanni Domenico Cassini', 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', 1470, 79.32, 'Light and dark hemispheres', 1671, 'Giovanni Domenico Cassini', 6);
INSERT INTO public.moon VALUES (13, 'Dione', 1123, 2.74, 'Craters, fractures', 1684, 'Giovanni Domenico Cassini', 6);
INSERT INTO public.moon VALUES (14, 'Tethys', 1062, 1.89, 'Impact craters, large Odysseus crater', 1684, 'Giovanni Domenico Cassini', 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 471, 1.41, 'Cliff-like structures', 1948, 'Gerard Kuiper', 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 1157, 2.52, 'Extensive fault systems', 1851, 'William Lassell', 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 1169, 4.14, 'Impact craters, dark terrain', 1851, 'William Lassell', 7);
INSERT INTO public.moon VALUES (18, 'Titania', 1578, 8.71, 'Impact craters, fractures', 1787, 'William Herschel', 7);
INSERT INTO public.moon VALUES (19, 'Oberon', 1522, 13.46, 'Impact craters, fractures', 1787, 'William Herschel', 7);
INSERT INTO public.moon VALUES (20, 'Triton', 2706, -5.88, 'Nitrogen geysers, cantaloupe terrain', 1846, 'William Lassell', 8);
INSERT INTO public.moon VALUES (21, 'Nereid', 340, 360.13, 'Irregular shape', 1949, 'Gerard P. Kuiper', 8);
INSERT INTO public.moon VALUES (22, 'Proteus', 420, 1.12, 'Heavily cratered surface', 1989, 'Voyager 2', 8);
INSERT INTO public.moon VALUES (23, 'Larissa', 194, 0.555, 'Impact craters, grooved terrain', 1981, 'Harold J. Reitsema', 8);
INSERT INTO public.moon VALUES (24, 'Galatea', 158, 0.429, 'Irregular shape', 1989, 'Voyager 2', 8);
INSERT INTO public.moon VALUES (25, 'Kepler-1625b I', NULL, NULL, NULL, 2018, NULL, 10);
INSERT INTO public.moon VALUES (26, 'Charon', 1212, 6.39, 'Large impact craters', 1978, 'James W. Christy', 11);
INSERT INTO public.moon VALUES (27, 'Nix', 42, 49.12, 'Irregular shape', 2005, 'Hubble Space Telescope', 11);
INSERT INTO public.moon VALUES (28, 'Hydra', 65, 38.20, 'Irregular shape', 2005, 'Hubble Space Telescope', 11);
INSERT INTO public.moon VALUES (29, 'Kerberos', 12, 32.21, 'Irregular shape', 2011, 'Hubble Space Telescope', 11);
INSERT INTO public.moon VALUES (30, 'Styx', 10, 26.56, 'Irregular shape', 2012, 'Hubble Space Telescope', 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.055, 0.383, 88, 440, 'Thin atmosphere, mostly gases', 'Rocky', 'extreme temperature variation between scorching hot day side and freezing night side', 'terrestrial', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0.815, 0.949, 225, 735, 'Dense atmosphere, mostly CO2', 'Rocky', 'hottest planet in its solar system', 'terrestrial', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1.000, 1.000, 365, 288, 'Nitrogen, oxygen', 'Rocky', 'abutdant water, diverse eco systems that support life', 'terrestrial', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0.107, 0.532, 687, 210, 'Thin atmosphere, mostly CO2', 'Rocky', 'reddish appearance caused by iron dioxide (rust)', 'terrestrial', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 317.8, 11.21, 4333, 165, 'Hydrogen, helium', 'Gas giant', 'the largest planet in its solar system, with a powerful magnetic field and iconic bands of clouds', 'gas giant', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 95.2, 9.45, 10759, 134, 'Hydrogen, helium', 'Gas giant', 'ring system, composed of countless particles of ice and rock', 'gas giant', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 14.6, 4.01, 30688, 76, 'Hydrogen, helium', 'Ice giant', 'ice giant with a tilted axis of rotation almost parallel to its orbital plane, causing it to appear to roll on its side', 'ice giant', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 17.2, 3.88, 60190, 72, 'Hydrogen, helium', 'Ice giant', 'striking blue color, strongest winds of any planet, reaching speeds of over 1500 mp/h / 2400 km/h', 'ice giant', 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 0.003, 1.08, 11186, 234, 'Unknown', 'Unknown', 'closest known start to Earth’s solar system, orbits within the habitable zone of its star', 'potentially terrestrial', 2);
INSERT INTO public.planet VALUES (10, 'Kepler-1625b', 1.49, 1.32, 2873, 162, 'Unknown', 'Unknown', 'potentially has an exomoon', 'gas giant', 3);
INSERT INTO public.planet VALUES (11, 'Pluto', 0.00218, 0.186, 90560, 44, 'Thin atmosphere, mostly N2', 'Icy dwarf', 'forms a unique binary system with Charon in which they are tidally locked with each other, meaning they always show the same face to one another as they orbit around their common center of mass', 'dwarf', 8);
INSERT INTO public.planet VALUES (12, 'Eris', 0.0028, 0.186, 203830, 30, 'Thin atmosphere, mostly N2', 'Icy dwarf', 'highly eccentric orbit, which means its distance from the Sun varies significantly over its orbital period', 'dwarf', 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 1, 1.00, 1.00, 5778, false, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'M5.5V', 0.0017, 0.12, 0.15, 3042, false, 1);
INSERT INTO public.star VALUES (3, 'Kepler-1625', 'G5', NULL, NULL, NULL, NULL, false, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'M1-2Ia', 120000, 17.5, 887, 3500, false, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 'B8Ia', 120000, 23.2, 78, 11000, true, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'A0V', 37, 2.1, 2.7, 9600, false, 1);
INSERT INTO public.star VALUES (7, 'Andromeda I', NULL, NULL, NULL, NULL, NULL, false, 2);
INSERT INTO public.star VALUES (8, 'none', NULL, NULL, NULL, NULL, NULL, NULL, 7);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 30, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

