// Imports
import 'bootstrap/dist/css/bootstrap.min.css';
import { Spinner, Container, Row, Col } from 'react-bootstrap';
import { useParams } from "react-router";
import { url } from "./constants/global";
import useFetch from "./useFetch";


const UserCaseDetails = () => {
    // Destruct id from the params
    const { caseid, userid } = useParams();
    // Fetching data from the id in the URL with the global url
    const { data:usercaseInfo, error, isPending } = useFetch(`${url}cases/${caseid}/${userid}`);

    return ( 
        <div className="user-details">
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
            { usercaseInfo && (
                <article>
                    {/* <!-- Hero Section --> */}
                    <div className="container-fluid mx-auto my-4">
                        <div className="row justify-content-center">
                            <div className="col-12 col-lg-6 text-center">
                                <div className="card">
                                    <h5 className="card-header">Department: { usercaseInfo.data.user.department }</h5>
                                    <div className="card-body">
                                        <h5 className="card-title">First: { usercaseInfo.data.user.firstName }</h5>
                                        <h5 className="card-title">Last: { usercaseInfo.data.user.lastName }</h5>
                                        <h5 className="card-title">Rank: { usercaseInfo.data.user.rank }</h5>
                                        <h5 className="card-title">Email: { usercaseInfo.data.user.email }</h5>
                                        <h5 className="card-title">Number: { usercaseInfo.data.user.phoneNumber }</h5>
                                        <h5 className="card-title">Station Number: { usercaseInfo.data.user.stationPhoneNumber}</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="container-fluid mx-auto my-4">
                        <div className="row justify-content-center">
                            <div className="col-12 col-lg-10">
                                <div className="card">
                                    <h5 className="card-header">{usercaseInfo.data.case.title}</h5>
                                    <div className="card-body">
                                        <h5 className="card-title"><strong>Case Number:</strong> {usercaseInfo.data.case.caseNumber} </h5>
                                        <p className="card-text"><strong>Description:</strong> {usercaseInfo.data.case.description}</p>
                                        <div id="buttonGroup" className="text-center">
                                            <a href={usercaseInfo.data.case.url} className="btn btn-primary mx-1" rel="noreferrer" target="_blank">Useful URL</a>
                                            <a href={usercaseInfo.data.case.urlPDF} className="btn btn-primary mx-1" rel="noreferrer" target="_blank">Useful PDF</a>
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

export default UserCaseDetails;