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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    is_spherical boolean,
    galaxy_id integer NOT NULL,
    distance_from_earth numeric(6,2)
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
    name character varying(30) NOT NULL,
    diameter_in_km integer,
    description text NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL
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
    size_in_abs_magn double precision,
    name character varying(30) NOT NULL,
    has_life boolean,
    star_id integer NOT NULL,
    planet_id integer NOT NULL
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
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planets character varying(30)[] NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_ss_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_ss_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_ss_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_ss_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_ss_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    diameter_in_km integer,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    luminosity double precision
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_ss_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Alpha Centauri', 4500, true, 1, 4.37);
INSERT INTO public.galaxy VALUES ('Betelgeuse', 8000, true, 2, 642.50);
INSERT INTO public.galaxy VALUES ('Vega', 455, true, 3, 25.00);
INSERT INTO public.galaxy VALUES ('Proxima Centauri', 4500, true, 4, 4.24);
INSERT INTO public.galaxy VALUES ('Barnards Star', 11000, true, 5, 5.96);
INSERT INTO public.galaxy VALUES ('Sirius', 242, true, 6, 8.60);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Luna', 3475, 'Earth''s only natural satellite', 1, 1);
INSERT INTO public.moon VALUES ('Phobos', 22, 'Mars''s innermost moon', 2, 2);
INSERT INTO public.moon VALUES ('Deimos', 12, 'Mars''s outer moon', 2, 3);
INSERT INTO public.moon VALUES ('Ganymede', 5268, 'Jupiter''s largest moon', 3, 4);
INSERT INTO public.moon VALUES ('Callisto', 4821, 'Second-largest moon of Jupiter', 3, 5);
INSERT INTO public.moon VALUES ('Io', 3642, 'Volcanically active moon of Jupiter', 3, 6);
INSERT INTO public.moon VALUES ('Europa', 3122, 'Icy moon of Jupiter with a subsurface ocean', 3, 7);
INSERT INTO public.moon VALUES ('Titan', 5150, 'Saturn''s largest moon and has a dense atmosphere', 4, 8);
INSERT INTO public.moon VALUES ('Rhea', 1527, 'Second-largest moon of Saturn', 4, 9);
INSERT INTO public.moon VALUES ('Enceladus', 504, 'Moon of Saturn with active water geysers', 4, 10);
INSERT INTO public.moon VALUES ('Triton', 2707, 'Neptune''s largest moon and has a retrograde orbit', 5, 11);
INSERT INTO public.moon VALUES ('Charon', 1208, 'Pluto''s largest moon and is tidally locked to Pluto', 6, 12);
INSERT INTO public.moon VALUES ('Dione', 1123, 'Moon of Saturn with bright ice cliffs', 4, 13);
INSERT INTO public.moon VALUES ('Oberon', 1523, 'Uranus''s second-largest moon', 7, 14);
INSERT INTO public.moon VALUES ('Miranda', 472, 'Small moon of Uranus with a chaotic terrain', 7, 15);
INSERT INTO public.moon VALUES ('Titania', 1578, 'Largest moon of Uranus', 7, 16);
INSERT INTO public.moon VALUES ('Ariel', 1158, 'Moon of Uranus with varied terrain and valleys', 7, 17);
INSERT INTO public.moon VALUES ('Proteus', 420, 'Neptune''s second-largest moon', 5, 18);
INSERT INTO public.moon VALUES ('Nereid', 340, 'Neptune''s third-largest moon and irregular shape', 5, 19);
INSERT INTO public.moon VALUES ('Sycorax', 150, 'Irregular moon of Uranus with a dark surface', 7, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (4.83, 'Earth', true, 101, 1);
INSERT INTO public.planet VALUES (5.03, 'Mars', false, 101, 2);
INSERT INTO public.planet VALUES (6.67, 'Jupiter', false, 101, 3);
INSERT INTO public.planet VALUES (6.92, 'Saturn', false, 101, 4);
INSERT INTO public.planet VALUES (5.51, 'Venus', false, 101, 5);
INSERT INTO public.planet VALUES (4.82, 'Proxima b', NULL, 102, 6);
INSERT INTO public.planet VALUES (5.95, 'Gliese 581g', NULL, 102, 7);
INSERT INTO public.planet VALUES (6.8, 'Kepler-22b', NULL, 103, 8);
INSERT INTO public.planet VALUES (5.22, 'Barnard b', NULL, 103, 9);
INSERT INTO public.planet VALUES (4.89, 'Kepler-452b', NULL, 104, 10);
INSERT INTO public.planet VALUES (5.9, 'TRAPPIST-1d', NULL, 104, 11);
INSERT INTO public.planet VALUES (4.95, 'HD 209458 b', NULL, 105, 12);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 1, 101, '{Mercury,Venus,Earth,Mars,Jupiter,Saturn,Uranus,Neptune}', 'Solar System');
INSERT INTO public.solar_system VALUES (2, 2, 102, '{"Betelgeuse I","Betelgeuse II"}', 'Betelgeuse System');
INSERT INTO public.solar_system VALUES (3, 3, 103, '{"Vega I","Vega II","Vega III","Vega IV","Vega V"}', 'Vega System');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Alpha Centauri A', 1237200, 1, 101, 1.519);
INSERT INTO public.star VALUES ('Betelgeuse', 887000000, 2, 102, 126000);
INSERT INTO public.star VALUES ('Vega', 2720550, 3, 103, 40);
INSERT INTO public.star VALUES ('Proxima Centauri', 200000, 1, 104, 0.0017);
INSERT INTO public.star VALUES ('Barnards Star', 274000, 1, 105, 0.0004);
INSERT INTO public.star VALUES ('Sirius A', 2396000, 1, 106, 25.4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: solar_system_ss_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_ss_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: solar_system galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT galaxy_id UNIQUE (galaxy_id);


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
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


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
-- Name: solar_system solar_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_name_key UNIQUE (name);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


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
-- Name: solar_system solar_system_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: solar_system solar_system_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

