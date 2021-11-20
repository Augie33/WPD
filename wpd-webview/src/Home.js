// Imports
import 'bootstrap/dist/css/bootstrap.min.css'


const Home = () => {
    return (
        // Basic information for home page
        <div className="home">
            <div className="container text-center py-4">
                <h2>Welcome to the Wichita Police Department</h2>
            </div>
            <div>
                <p>The Wichita Police Department's mission is "Working in partnership with our 
                    community to deliver exceptional police services with professionalism and fairness."
                </p>
                <h3>Strategic Goals:</h3>
                <ol>
                    <li>Build honest and open internal and external relationships through open communication, inclusion and trust.</li>
                    <li>Implement industry standards to obtain and maintain infrastructure that addresses rapidly changing needs.</li>
                    <li>Develop innovative approaches to prevent and reduce crime.</li>
                    <li>Create a flexible workforce that addresses community needs and enhances employee morale through training and health and wellness programming.</li>
                </ol>
            </div>
        </div>
    );
}

export default Home;