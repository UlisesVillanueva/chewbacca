import { useReducer } from 'react';
import { AuthContext } from './AuthContext';
import { authReducer } from './authReducer';

import { types } from '../types/types';
import { getLogin } from '../../starwars/helpers/getLogin';

// const initialState = {
//     logged: false,
// }

const init = () => {
  const user = JSON.parse( localStorage.getItem('user') );

  return {
    logged: !!user,
    user: user,
  }
}


export const AuthProvider = ({ children }) => {
    
  const [ authState, dispatch ] = useReducer( authReducer, {}, init );

    const login = async ( userData) => {
    const {username,password} = userData;

    const response = await getLogin( {username,password} );
    if( response.success ){
      const user={
        username,
        password,
        access_token: response.access_token,
      }
      const action = { type: types.login, payload: user }
  
      localStorage.setItem('user', JSON.stringify( user ) );
  
      dispatch(action);
      return true;
    }else{
      return false;
    }
   
  }

  const logout = () => {
    localStorage.removeItem('user');
    const action = { type: types.logout };
    dispatch(action);
  }


  return (
    <AuthContext.Provider value={{
      ...authState,

      // Methods
      login,
      logout,
    }}>
        { children }
    </AuthContext.Provider>
  );
}
