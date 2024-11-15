--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(35) NOT NULL,
    number_of_stars integer,
    age_million_years integer,
    mass_trillion_solar_masses numeric(10,3),
    average_star_density numeric(7,3),
    galaxy_type text,
    description text,
    has_supermassive_black_holes boolean,
    is_active_galactic_nucleus boolean
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
    name character varying(35) NOT NULL,
    distance_from_planet_km integer,
    age_million_years integer,
    mass_planet_masses numeric(4,3),
    surface_gravity_m_s2 numeric(4,2),
    moon_type text,
    surface_features text,
    is_tidal_locked boolean,
    has_atmosphere boolean,
    planet_id integer
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer,
    type character varying(50),
    distance_from_earth numeric(10,2)
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(35) NOT NULL,
    number_of_moons integer,
    rotation_period_hours integer,
    gravity_m_s2 numeric(4,2),
    orbital_eccentricity numeric(3,2),
    planet_type text,
    atmosphere_composition text,
    has_rings boolean,
    is_habitable_zone boolean,
    star_id integer
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
    name character varying(35) NOT NULL,
    luminosity integer,
    temperature_kelvin integer,
    mass_solar_masses numeric(5,3),
    radius_solar_radii numeric(5,3),
    spectral_class text,
    constellation text,
    is_variable_star boolean,
    has_planetary_system boolean,
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, NULL, NULL, NULL, 'Barred Spiral', 'Our galaxy, home to the Solar System. It has a spiral structure with a central bar and contains billions of stars.', true, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda (M31)', NULL, NULL, NULL, NULL, 'Spiral', 'The nearest spiral galaxy to the Milky Way and the largest galaxy in the Local Group. It is visible to the naked eye from Earth.', true, false);
INSERT INTO public.galaxy VALUES (3, 'Sombrero (M104)', NULL, NULL, NULL, NULL, 'Spiral', 'Features a bright core surrounded by a dark dust ring, giving it a hat-like appearance.', true, false);
INSERT INTO public.galaxy VALUES (4, 'Black Eye (M64)', NULL, NULL, NULL, NULL, 'Spiral', 'Known for its dark dust region in the core, giving it the appearance of a "black eye." It has active star formation.', true, false);
INSERT INTO public.galaxy VALUES (5, 'Triangulum (M33)', NULL, NULL, NULL, NULL, 'Spiral', 'The third largest galaxy in the Local Group, with a well-defined spiral structure without a prominent central bar.', true, false);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A (NGC 5128)', NULL, NULL, NULL, NULL, 'Lenticular', 'A peculiar lenticular galaxy with a prominent dark dust band. It is a strong radio emitter and contains an active nucleus.', true, true);
INSERT INTO public.galaxy VALUES (7, 'Cygnus A', NULL, NULL, NULL, NULL, 'Radio Galaxy', 'One of the strongest radio sources in the sky, with jets of particles emerging from its core. Known as an active radio galaxy.', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', NULL, NULL, NULL, NULL, 'Natural Satellite', NULL, NULL, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, NULL, NULL, NULL, 'Natural Satellite', NULL, NULL, false, 1);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, NULL, NULL, NULL, 'Natural Satellite', NULL, NULL, false, 1);
INSERT INTO public.moon VALUES (4, 'Europa', NULL, NULL, NULL, NULL, 'Galilean Moon', NULL, NULL, true, 1);
INSERT INTO public.moon VALUES (5, 'Ganymede', NULL, NULL, NULL, NULL, 'Galilean Moon', NULL, NULL, true, 1);
INSERT INTO public.moon VALUES (6, 'Callisto', NULL, NULL, NULL, NULL, 'Galilean Moon', NULL, NULL, false, 1);
INSERT INTO public.moon VALUES (7, 'Io', NULL, NULL, NULL, NULL, 'Volcanic Moon', NULL, NULL, true, 1);
INSERT INTO public.moon VALUES (8, 'Titan', NULL, NULL, NULL, NULL, 'Saturns Moon', NULL, NULL, true, 1);
INSERT INTO public.moon VALUES (9, 'Enceladus', NULL, NULL, NULL, NULL, 'Icy Moon', NULL, NULL, false, 1);
INSERT INTO public.moon VALUES (10, 'Triton', NULL, NULL, NULL, NULL, 'Retrograde Moon', NULL, NULL, false, 1);
INSERT INTO public.moon VALUES (11, 'Charon', NULL, NULL, NULL, NULL, 'Binary Dwarf Partner', NULL, NULL, false, 1);
INSERT INTO public.moon VALUES (12, 'Oberon', NULL, NULL, NULL, NULL, 'Uranian Moon', NULL, NULL, false, 1);
INSERT INTO public.moon VALUES (13, 'Titania', NULL, NULL, NULL, NULL, 'Uranian Moon', NULL, NULL, false, 1);
INSERT INTO public.moon VALUES (14, 'Mimas', NULL, NULL, NULL, NULL, 'Icy Moon', NULL, NULL, false, 1);
INSERT INTO public.moon VALUES (15, 'Hyperion', NULL, NULL, NULL, NULL, 'Irregular Moon', NULL, NULL, false, 1);
INSERT INTO public.moon VALUES (16, 'Rhea', NULL, NULL, NULL, NULL, 'Icy Moon', NULL, NULL, false, 1);
INSERT INTO public.moon VALUES (17, 'Dione', NULL, NULL, NULL, NULL, 'Icy Moon', NULL, NULL, false, 1);
INSERT INTO public.moon VALUES (18, 'Iapetus', NULL, NULL, NULL, NULL, 'Icy Moon', NULL, NULL, false, 1);
INSERT INTO public.moon VALUES (19, 'Miranda', NULL, NULL, NULL, NULL, 'Uranian Moon', NULL, NULL, false, 1);
INSERT INTO public.moon VALUES (20, 'Amalthea', NULL, NULL, NULL, NULL, 'Irregular Inner Moon', NULL, NULL, false, 1);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Orion Nebula', NULL, 'Emission Nebula', 1344.00);
INSERT INTO public.nebula VALUES (2, 'Crab Nebula', NULL, 'Supernova Remnant', 6500.00);
INSERT INTO public.nebula VALUES (3, 'Helix Nebula', NULL, 'Planetary Nebula', 694.00);
INSERT INTO public.nebula VALUES (4, 'Eagle Nebula', NULL, 'Star-Forming Nebula', 7000.00);
INSERT INTO public.nebula VALUES (5, 'Carina Nebula', NULL, 'Emission Nebula', 7500.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, NULL, NULL, NULL, 'Terrestrial', NULL, false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, NULL, NULL, NULL, 'Terrestrial', NULL, false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, NULL, NULL, NULL, 'Terrestrial', NULL, false, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, NULL, NULL, NULL, 'Terrestrial', NULL, false, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 95, NULL, NULL, NULL, 'Gas Giant', NULL, true, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 145, NULL, NULL, NULL, 'Gas Giant', NULL, true, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, NULL, NULL, NULL, 'Ice Giant', NULL, true, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, NULL, NULL, NULL, 'Ice Giant', NULL, true, false, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 0, NULL, NULL, NULL, 'Exoplanet', NULL, false, true, 1);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 0, NULL, NULL, NULL, 'Super-Earth', NULL, false, true, 1);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 0, NULL, NULL, NULL, 'Hot Jupiter', NULL, false, false, 1);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 0, NULL, NULL, NULL, 'Terrestrial (Exoplanet)', NULL, false, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sirius', 25, 9940, NULL, NULL, 'A1V', 'Canis Major', NULL, true, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 120000, 3500, NULL, NULL, 'M1-2Ia', 'Orion', NULL, false, 3);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 0, 3042, NULL, NULL, 'M5.5Ve', 'Centaurus', NULL, true, 4);
INSERT INTO public.star VALUES (5, 'Vega', 40, 9602, NULL, NULL, 'A0V', 'Lyra', NULL, false, 5);
INSERT INTO public.star VALUES (6, 'Polaris', 2500, 6015, NULL, NULL, 'F7Ib-II', 'Ursa Minor', NULL, true, 6);
INSERT INTO public.star VALUES (7, 'Rigel', 120000, 11000, NULL, NULL, 'B8Ia', 'Orion', NULL, false, 7);
INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, NULL, NULL, 'G2V', NULL, NULL, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 5, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: nebula nebula_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: nebula nebula_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

