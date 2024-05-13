import { useContext } from "react";
import { useNavigate } from "react-router-dom";
import { AuthContext } from "../context/AuthContext";
import { useState } from "react";
import { showLoading } from "react-global-loading";


export const LoginPage = () => {
  const { login } = useContext(AuthContext);
  const navigate = useNavigate();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [formError, setFormError] = useState("");

  const handleLogin = async (e) => {
    e.preventDefault();
    showLoading(true);
    setFormError('')
    const lastPath = localStorage.getItem('lastPath') || '/';
    try {
      let loginData = {
        username,
        password,
      };
      const resp = await login(loginData);
      showLoading(false);
      if(resp){
        navigate( lastPath, {
          replace: true
        });
      } else {
        setFormError('Usuario o contraseña incorrectos')
      }
      showLoading(false);
      
    } catch (error) {}
  };



  return (
    <div className="container " style={{ width:"500px", paddingTop:"100px"}}>
      <div className="card mt-10 mx-auto">
        <div className="card-body" style={{alignItems:"center"}}>

        <div id="card-title">

        <img src='/assets/sw.png' className="card-img" />
        <h2>LOGIN</h2>
      </div>
          <form>
            <div className="form-group">
              <label htmlFor="username">Username</label>
              <input
                type="text"
                className="form-control"
                id="username"
                onChange={(e) => setUsername(e.target.value)}
              />
            </div>
            <div className="form-group">
              <label htmlFor="password">Password</label>
              <input
                type="password"
                className="form-control"
                id="password"
                onChange={(e) => setPassword(e.target.value)}
              />
            </div>

            <div className="form-group">
             
            <button
              type="submit"
              onClick={handleLogin}
              className="btn btn-warning"
            > 
              Come to the dark side
            </button>



           
            
            </div>
          </form>
          {formError && <div className="alert alert-danger mt-3">{formError}</div>}
        </div>
      </div>
    </div>
  );
};
