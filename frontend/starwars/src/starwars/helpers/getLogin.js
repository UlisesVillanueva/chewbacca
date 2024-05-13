export const getLogin= async( user ) => {

    const url = `http://127.0.0.1:5001/auth/login`;
    const resp = await fetch( url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify( user )
    });

    const data = await resp.json();


    return data;
}
    
