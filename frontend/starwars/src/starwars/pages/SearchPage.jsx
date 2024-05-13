import { useLocation, useNavigate } from 'react-router-dom';
import queryString from 'query-string'

import { useForm } from '../../hooks/useForm';
import { CharacterCard } from '../components';
import { getSearch } from '../helpers/getSearch';
import { useState } from 'react';


export const SearchPage = () => {

  const navigate = useNavigate();
  const location = useLocation();

  const { q = '' } = queryString.parse( location.search );


  const [characters,setCharacters] = useState([]);

  const showSearch = (q.length === 0);
  const showError  = (q.length > 0) && characters.length === 0;


  const { searchText, onInputChange } = useForm({
    searchText: q
  });



  const onSearchSubmit = (event) =>{
    event.preventDefault();
    navigate(`?q=${ searchText }`);
    getSearch( searchText )
      .then( characters => {
        setCharacters( characters)
      })
  }


  return (
    <>
      <h1>Search</h1> 
      <hr />

      <div className="row">

          <div className="col-5">
            <h4>Searching</h4>
            <hr />
            <form onSubmit={ onSearchSubmit } aria-label="form">
              <input 
                type="text"
                placeholder="Search a character by name or by world"
                className="form-control"
                name="searchText"
                autoComplete="off"
                value={ searchText }
                onChange={ onInputChange }
              />

              <button className="btn btn-outline-primary mt-1">
                Search
              </button>
            </form>
          </div>

          <div className="col-7">
            <h4>Results</h4>
            <hr />


            
            <div className="alert alert-primary animate__animated animate__fadeIn" 
                style={{ display: showSearch ? '' : 'none' }}>
              Search a character
            </div>

            <div aria-label="alert-danger" className="alert alert-danger animate__animated animate__fadeIn" 
                style={{ display: showError ? '' : 'none' }}>
              No character with <b>{ q }</b>
            </div>


            {
              characters.map( character => (
                <CharacterCard key={ character.people_id } {...character } />

              ))
            }

          </div>
      </div>
      

    </>
  )
}
