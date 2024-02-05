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
-- Name: black_holes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_holes (
    black_holes_id integer NOT NULL,
    mass numeric,
    distance_from_earth integer,
    galaxy_id integer,
    name character varying(40) NOT NULL
);


ALTER TABLE public.black_holes OWNER TO freecodecamp;

--
-- Name: black_holes_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_holes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_holes_id_seq OWNER TO freecodecamp;

--
-- Name: black_holes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_holes_id_seq OWNED BY public.black_holes.black_holes_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description character varying(100),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    galaxy_types text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    ratio_planet numeric(4,2),
    description character varying(100),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: nebulae; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebulae (
    name character varying(40) NOT NULL,
    nebulae_id integer NOT NULL,
    mass numeric,
    distance_from_earth integer,
    galaxy_id integer
);


ALTER TABLE public.nebulae OWNER TO freecodecamp;

--
-- Name: nebulae_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebulae_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebulae_id_seq OWNER TO freecodecamp;

--
-- Name: nebulae_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebulae_id_seq OWNED BY public.nebulae.nebulae_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40),
    description character varying(40),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40),
    description character varying(100),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_holes black_holes_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes ALTER COLUMN black_holes_id SET DEFAULT nextval('public.black_holes_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: nebulae nebulae_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebulae ALTER COLUMN nebulae_id SET DEFAULT nextval('public.nebulae_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: black_holes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_holes VALUES (4, 5.2, 1000, 4, 'Black Hole A');
INSERT INTO public.black_holes VALUES (5, 8.9, 500, 2, 'Black Hole B');
INSERT INTO public.black_holes VALUES (6, 12.6, 2000, 3, 'Black Hole C');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral galaxy', false, true, 23, 2537000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 'Barred spiral galaxy', true, true, 46, 10, 'Barred Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical galaxy with a supermassive black hole', false, true, 6500, 53490000, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Spiral galaxy', false, true, 230, 2722000, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Messier 82', 'Irregular galaxy', false, false, 2, 12000000, 'Irregular');
INSERT INTO public.galaxy VALUES (7, 'Centaurus A', 'Elliptical galaxy with an active galactic nucleus', false, true, 10, 13250000, 'Elliptical');
INSERT INTO public.galaxy VALUES (8, 'Messier 51', 'Spiral galaxy interacting with a smaller galaxy', false, true, 3, 23500000, 'Spiral');
INSERT INTO public.galaxy VALUES (9, 'Whirlpool', 'Spiral galaxy with a prominent spiral arm', false, true, 10, 31000, 'Spiral');
INSERT INTO public.galaxy VALUES (10, 'Sombrero', 'Spiral galaxy with a bright nucleus and large central bulge', false, true, 8, 28000000, 'Spiral');
INSERT INTO public.galaxy VALUES (11, 'Messier 101', 'Spiral galaxy with a relatively small central bulge', false, true, 1500, 25000000, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 0.27, 'Earths natural satellite', true, true, 4543, 384400, 43);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.02, 'Marss inner moon', false, true, 4600, 9378, 44);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.00, 'Marss outer moon', false, true, 4600, 23460, 44);
INSERT INTO public.moon VALUES (4, 'Io', 0.29, 'Jupiters moon with active volcanoes', false, true, 4600, 421800, 45);
INSERT INTO public.moon VALUES (5, 'Europa', 0.25, 'Jupiters moon with an icy surface', false, true, 4600, 671100, 45);
INSERT INTO public.moon VALUES (6, 'Ganymede', 0.41, 'Largest moon of Jupiter', false, true, 4600, 1070400, 45);
INSERT INTO public.moon VALUES (7, 'Callisto', 0.38, 'Large and heavily cratered moon of Jupiter', false, true, 4600, 1882700, 45);
INSERT INTO public.moon VALUES (8, 'Titan', 0.40, 'Largest moon of Saturn', false, true, 4600, 1221870, 46);
INSERT INTO public.moon VALUES (9, 'Rhea', 0.12, 'Second-largest moon of Saturn', false, true, 4600, 527040, 46);
INSERT INTO public.moon VALUES (10, 'Iapetus', 0.12, 'Outermost large moon of Saturn', false, true, 4600, 3560820, 46);
INSERT INTO public.moon VALUES (11, 'Miranda', 0.03, 'Uranuss smallest spherical moon', false, true, 4600, 129860, 47);
INSERT INTO public.moon VALUES (12, 'Ariel', 0.06, 'One of Uranuss five major moons', false, true, 4600, 191020, 47);
INSERT INTO public.moon VALUES (13, 'Umbriel', 0.05, 'Uranuss third-largest moon', false, true, 4600, 266300, 47);
INSERT INTO public.moon VALUES (14, 'Titania', 0.11, 'Largest moon of Uranus', false, true, 4600, 435910, 47);
INSERT INTO public.moon VALUES (15, 'Oberon', 0.11, 'Second-largest moon of Uranus', false, true, 4600, 583520, 47);
INSERT INTO public.moon VALUES (16, 'Triton', 0.08, 'Neptunes largest moon', false, true, 4600, 354760, 48);
INSERT INTO public.moon VALUES (17, 'Nereid', 0.00, 'Neptunes third-largest moon', false, true, 4600, 5513818, 48);
INSERT INTO public.moon VALUES (18, 'Charon', 0.51, 'Dwarf planet Plutos largest moon', false, true, 4600, 19571, 49);
INSERT INTO public.moon VALUES (19, 'Hydra', 0.04, 'Plutos moon', false, true, 4600, 64738, 49);
INSERT INTO public.moon VALUES (20, 'Luna', 0.27, 'Earth satellite', false, true, 4500, 384400, 43);


--
-- Data for Name: nebulae; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebulae VALUES ('Nebula A', 1, 35.2, 1000, 2);
INSERT INTO public.nebulae VALUES ('Nebula B', 2, 44.9, 500, 3);
INSERT INTO public.nebulae VALUES ('Nebula C', 3, 82.6, 2000, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (41, 'Mercury', 'Innermost planet', false, true, 4600, 57900, 1);
INSERT INTO public.planet VALUES (42, 'Venus', 'Similar to Earth in size', false, true, 4500, 108200, 1);
INSERT INTO public.planet VALUES (43, 'Earth', 'Home sweet home', true, true, 4543, 0, 1);
INSERT INTO public.planet VALUES (44, 'Mars', 'The Red Planet', false, true, 4603, 225000, 1);
INSERT INTO public.planet VALUES (45, 'Jupiter', 'Largest planet in our solar system', false, true, 4600, 778300, 1);
INSERT INTO public.planet VALUES (46, 'Saturn', 'Known for its rings', false, true, 4600, 1426000, 1);
INSERT INTO public.planet VALUES (47, 'Uranus', 'Tilted on its side', false, true, 4500, 2870990, 1);
INSERT INTO public.planet VALUES (48, 'Neptune', 'Blue and stormy', false, true, 4500, 4498250, 1);
INSERT INTO public.planet VALUES (49, 'Pluto', 'Dwarf planet', false, true, 4600, 5906380, 1);
INSERT INTO public.planet VALUES (50, 'Eris', 'Dwarf planet in the scattered disc', false, true, 4500, 10118000, 1);
INSERT INTO public.planet VALUES (51, 'Ceres', 'Dwarf planet in the asteroid belt', false, true, 4600, 414000, 1);
INSERT INTO public.planet VALUES (52, 'Haumea', 'Dwarf planet with an elongated shape', false, true, 4500, 6452000, 1);
INSERT INTO public.planet VALUES (53, 'Makemake', 'Dwarf planet in the scattered disc', false, true, 4500, 6850000, 1);
INSERT INTO public.planet VALUES (54, 'Interamnia', 'Largest asteroid by volume', false, true, 4600, 360000, 1);
INSERT INTO public.planet VALUES (55, 'Pallas', 'One of the largest asteroids', false, true, 4600, 414000, 1);
INSERT INTO public.planet VALUES (56, 'Vesta', 'Brightest asteroid', false, true, 4600, 352000, 1);
INSERT INTO public.planet VALUES (57, 'Junocam', 'Asteroid', false, true, 4600, 300000, 1);
INSERT INTO public.planet VALUES (58, 'Davida', 'Large asteroid in the asteroid belt', false, true, 4500, 359000, 1);
INSERT INTO public.planet VALUES (59, 'Psyche', 'Metallic asteroid', false, true, 4600, 370000, 1);
INSERT INTO public.planet VALUES (60, 'Hidalgo', 'Unusual elongated asteroid', false, true, 4500, 418000, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'Earths home star', true, true, 3500, 0, 3);
INSERT INTO public.star VALUES (2, 'Sun', 'The star at the center of our solar system', true, true, 4600, 149600000, 3);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant in the Orion constellation', false, false, 10000, 643735, 3);
INSERT INTO public.star VALUES (4, 'Sirius', 'Brightest star in Earths night sky', false, true, 230, 9, 3);
INSERT INTO public.star VALUES (5, 'Alpha Centauri', 'Triple star system closest to Earth', false, true, 6500, 4, 3);
INSERT INTO public.star VALUES (6, 'Vega', 'Bright star in the Lyra constellation', false, true, 455, 25, 3);
INSERT INTO public.star VALUES (7, 'Arcturus', 'Bright red giant in the Bootes constellation', false, true, 7000, 38, 3);
INSERT INTO public.star VALUES (8, 'Antares', 'Red supergiant in the Scorpius constellation', false, true, 12000, 550, 3);
INSERT INTO public.star VALUES (9, 'Proxima Centauri', 'Closest known star to the Sun', false, true, 6, 4, 3);
INSERT INTO public.star VALUES (10, 'Rigel', 'Blue supergiant in the Orion constellation', false, false, 8000, 860, 3);
INSERT INTO public.star VALUES (11, 'Pollux', 'Bright giant star in the Gemini constellation', false, true, 2000, 34, 3);


--
-- Name: black_holes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_holes_id_seq', 6, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 11, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: nebulae_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebulae_id_seq', 3, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 60, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 11, true);


--
-- Name: black_holes black_holes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes
    ADD CONSTRAINT black_holes_pkey PRIMARY KEY (black_holes_id);


--
-- Name: star ga; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT ga UNIQUE (star_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: nebulae ne; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebulae
    ADD CONSTRAINT ne UNIQUE (nebulae_id);


--
-- Name: nebulae nebulae_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebulae
    ADD CONSTRAINT nebulae_pkey PRIMARY KEY (nebulae_id);


--
-- Name: galaxy pe; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT pe UNIQUE (galaxy_id);


--
-- Name: moon pl; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT pl UNIQUE (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet st; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT st UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: black_holes un; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes
    ADD CONSTRAINT un UNIQUE (name);


--
-- Name: black_holes black_holes_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes
    ADD CONSTRAINT black_holes_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: nebulae nebulae_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebulae
    ADD CONSTRAINT nebulae_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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