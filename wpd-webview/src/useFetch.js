// This is the global fetch function used to fetch data throughout the whole application
import { useEffect, useState } from 'react';

const useFetch = (url) => {
    // Using hooks to be able to store data and change data
    const [data, setData] = useState(null);
    const [isPending, setIsPending] = useState(true);
    const [error, setError] = useState(null);

    useEffect( () => {
        const abortCont = new AbortController();
        fetch(url, { signal: abortCont.signal })
        .then(res => {
            if(!res.ok){
                throw Error('Could not fetch the data for that ID.');
            }
            return res.json();
        })
        // This has the data and sets data state
        .then(data => {
            setData(data);
            setIsPending(false);
            setError(null);
        })
        // Display the error information
        .catch((err) => {
            if (err.name === 'AbortError'){
                console.log('Fetch aborted');
            } else{
                setIsPending(false);
                setError(err.message);
            }
        })
        return () => abortCont.abort();
    }, [url]);

    return { data, isPending, error }
}

export default useFetch;