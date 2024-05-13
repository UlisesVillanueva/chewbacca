import { useMemo } from "react";
import {
  Navigate,
  useNavigate,
  useParams,
  useLocation,
} from "react-router-dom";

export const CharacterPage = () => {
  const navigate = useNavigate();
  const location = useLocation();

  const { character } = location.state;

  const {
    dob,
    gender,
    hairColor,
    height,
    mass,
    name,
    people_id,
    created_at,
    films=[],
    home_world,
  } = character;
  // const Character = useMemo( () => getCharacterById( id ), [ id ]);

  const onNavigateBack = () => {
    navigate(-1);
  };

  function formatDate(date) {
    const parsedDate = new Date(date);
    const day = parsedDate.getDate();
    const month = parsedDate.getMonth() + 1;
    const year = parsedDate.getFullYear();
    return `${day < 10 ? "0" + day : day}-${
      month < 10 ? "0" + month : month
    }-${year}`;
  }

  function formatYear(date) {
    const parsedDate = new Date(date);
    const year = parsedDate.getFullYear();
    return `${year}`;
  }

  return (
    <div className="card-character mt-5">
      <div className="col-4">
        <img
          src={`/assets/characters/${people_id}.png`}
          alt={dob}
          className="img-thumbnail animate__animated animate__fadeInLeft"
        />
      </div>

      <div className="col-4 character-content">
        <h2>{name}</h2>
        <p>World: {home_world}</p>
        <p>Year of birth: {formatYear(dob)}</p>
        <p>Gender: {gender} </p>
        <p>Hair color: {hairColor}</p>
        <p>Height: {height} Cm</p>
        <p>Masa: {mass} kg</p>
        <p>Created: {formatDate(created_at)}</p>
        <button
          className="btn btn-outline-warning"
          style={{ width: "100%" }}
          onClick={onNavigateBack}
        >
          Back
        </button>
      </div>

      <div className="col-4 character-content">
        {films.length>0 && <h2>Movies</h2>}
        <ul className="list-group list-group-flush dark">
        {films.length > 0 &&
           films.map((film, index) => (
            <li className="list-group-item">{film.title}</li>
          ))}
        </ul>
      </div>
    </div>
  );
};
