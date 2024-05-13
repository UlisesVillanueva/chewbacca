

export const getSearch= async( q ) => {

    const url = `http://127.0.0.1:5001/people/search?q=${q}`;
    const user = JSON.parse(localStorage.getItem('user')) || '';

    const resp = await fetch( url, {
         method: 'GET',
    
        headers: {
            'Authorization': `Bearer ${user.access_token}`,
            'Content-Type': 'application/json'}
    });

    const { data } = await resp.json();

    const persons = data.people.map( character => ({
    dob: character.dob,
    gender: character.gender,
    hairColor: character.hairColor,
    height: character.height,
    img:   character.img,
    mass: character.mass,
    name: character.name,
    people_id: character.people_id,
    created_at: character.created_at,
    films: character.films,
    home_world: character.home_world,
    }));
    
    return persons;
}
