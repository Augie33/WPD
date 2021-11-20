// Imports
import 'bootstrap/dist/css/bootstrap.min.css';
import { Spinner, Container, Row, Col } from 'react-bootstrap';
import { useParams } from "react-router";
import { url } from './constants/global';
import useFetch from "./useFetch";


const CaseDetails = () => {
    // Destruct the id from url
    const { id } = useParams();
    // Fetch the case information using id and global url
    const { data:caseInfo, error, isPending } = useFetch(`${url}cases/${id}`);

    return ( 
        <div className="case-details">
            {/* If the data is still loading, it will display this */}
            { isPending && (
                <Container> 
                    <Row className="justify-content-center align-items-center pt-4">
                        <Col xs="2" sm="1" className="">
                        <Spinner animation="border" role="status">
                            <span className="visually-hidden">Loading...</span>
                        </Spinner>
                        </Col>
                    </Row>
                </Container>
            )}
            {/* If the data fails then it will display the error */}
            { error && <div> { error } </div> }
            {/* If the data is obtained and successful, it will display the information */}
            { caseInfo && (
                <article>
                    <h2 className="text-center pt-4">Category - { caseInfo.data.category.title }</h2>
                    <div className="container-fluid mx-auto my-4">
                        <div className="row justify-content-center">
                            <div className="col-12 col-lg-10">
                                <div className="card">
                                    <h5 className="card-header">Title: {caseInfo.data.title}</h5>
                                    <div className="card-body">
                                        <p className="card-text"><strong>Description:</strong> {caseInfo.data.description}</p>
                                        <div id="buttonGroup" className="text-center">
                                            {caseInfo.data.url !== '' && <a href={caseInfo.data.url} className="btn btn-primary mx-1" rel="noreferrer" target="_blank">Useful URL</a>}
                                            {caseInfo.data.urlPDF !== '' && <a href={caseInfo.data.urlPDF} className="btn btn-primary mx-1" rel="noreferrer" target="_blank">Useful PDF</a>}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
            )}
        </div>
     );
}
 
export default CaseDetails;