import { useEffect, useState } from "react";
import { getPeople } from "../starwars/helpers/getPeople";
import { showLoading } from "react-global-loading";

export const useFetch = (page) => {
  const [characters, setCharacters] = useState([]);

  useEffect(() => {
    const getCharacters = async () => {
      showLoading(true);
      try {
        const resp = await getPeople(page);
        setCharacters(resp);
      } catch (error) {}
      showLoading(false);
    };
    getCharacters();
  }, []);

  return {
    characters,
  };
};
