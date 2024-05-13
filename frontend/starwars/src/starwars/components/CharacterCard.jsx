
import { Link } from "react-router-dom";

export const CharacterCard = (character) => {
  const {
    name,
    people_id,
    dob,
    gender,
    home_world,
  } = character;
  const characterImageUrl = `/assets/characters/${ people_id }.png`;


  const calculateAge = (dob) => {
    const birthDate = new Date(dob);
    const currentDate = new Date();
    const ageInMilliseconds = currentDate - birthDate;
    const ageInYears = Math.floor(ageInMilliseconds / (1000 * 60 * 60 * 24 * 365));
    return ageInYears;
  };
  return (
    <div className="col animate__animated animate__fadeIn">
    
      <div className="card">
        <div className="row no-gutters">
          <div className="col-4">
            <img src={characterImageUrl} className="card-img" alt={name}/>
          </div>

          <div className="col-8">
            <div className="card-body">
              <h5 className="card-title">{name}</h5>
              <p className="card-text">World: {home_world} </p>
              <p className="card-text">
                <small className="text-muted">Age: {calculateAge(dob)}</small>
              </p>

              <Link className="link-se-more"
                to={`/character/${people_id}`}
                state={{
                  character
                }}
              >
                Detail
              </Link>
            
            </div>
          </div>
        </div>
      </div>

    </div>
    
  );
};
