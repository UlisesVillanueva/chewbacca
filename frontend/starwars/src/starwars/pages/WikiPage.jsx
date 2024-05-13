import { showLoading } from 'react-global-loading';
import { CharacterList } from '../components';

import { getPeople } from '../helpers/getPeople';
import { useState } from 'react';
import { useEffect } from 'react';

export const WikiPage = () => {
  const [characters, setCharacters] = useState([]);
  const [page, setPage] = useState(0);

  const getCharacters = async () => {
    showLoading(true);
    try {
        const resp = await getPeople( page );
        setCharacters(resp);
    } catch (error) {
    }
    showLoading(false);
}
    useEffect( () => {
        
         getCharacters();
    }, [page]);




  return (
    <>


      <h1>StarWars Wiki</h1>
      <hr />



      <CharacterList characters={characters} />
      <div className="container" style={{display:"flex", direction:"row", justifyContent:"space-around;", marging:"30px",padding:"40px"}}>
      {
        page > 0 && (
          <button className="btn btn-outline-warning" onClick={() => setPage(page - 1)} style={{width:"10%"}}>Previous</button>
        )
      }
      <button className="btn btn-outline-warning" onClick={() => setPage(page + 1)} style={{width:"10%"}}>Next</button>
      
      {/* <h3>Page: {page + 1}</h3> */}
      </div>
    </>
  )
}
