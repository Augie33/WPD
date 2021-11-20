// Imports
import { Link } from 'react-router-dom'

const NotFound = () => {
    return ( 
        // Not found information
        <div className="not-found">
            <h2>Sorry</h2>
            <p>That page cannot be found</p>
            <Link to="/">Home page...</Link>
        </div>
     );
}
 
export default NotFound;