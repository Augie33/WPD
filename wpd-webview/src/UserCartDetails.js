// Imports
import 'bootstrap/dist/css/bootstrap.min.css';
import { Spinner, Container, Row, Col } from 'react-bootstrap';
import { useParams } from "react-router";
import { Link } from 'react-router-dom';
import { carturl } from "./constants/global";
import useFetch from "./useFetch";


const UserCartDetails = () => {
    // Destruct id from the params
    const { cartid, userid } = useParams();
    // Fetching data from the cartid and userid in the URL with the global carturl
    const { data:usercartInfo, error, isPending } = useFetch(`${carturl}/${cartid}/${userid}`);

    return ( 
        <div className="user-details">
            {/* If the data is still loading, it will display this */}
            { isPending && (
                <Container className=""> 
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
            {/* User information */}
            { usercartInfo && (
                <article>
                    {/* <!-- Hero Section --> */}
                    <h2 className="text-center pt-4"><strong>Case Number:</strong> {usercartInfo.data.cart.caseNumber}</h2>
                    <div className="container-fluid mx-auto my-4">
                        <div className="row justify-content-center">
                            <div className="col-12 col-lg-6 text-center">
                                <div className="card">
                                    <h5 className="card-header">Department: { usercartInfo.data.user.department }</h5>
                                    <div className="card-body">
                                        <h5 className="card-title">Name: <Link to={`/view/user/${usercartInfo.data.user._id}`}>{ usercartInfo.data.user.firstName + ' ' +usercartInfo.data.user.lastName}</Link></h5>
                                        <h5 className="card-title">Rank: { usercartInfo.data.user.rank }</h5>
                                        <h5 className="card-title">Email: <a href={`mailto:${usercartInfo.data.user.email}`} >{ usercartInfo.data.user.email }</a></h5>
                                        <h5 className="card-title">Number: <a href={`tel:${usercartInfo.data.user.phoneNumber}`}>{ usercartInfo.data.user.phoneNumber }</a></h5>
                                        <h5 className="card-title">Station Number: <a href={`tel:${usercartInfo.data.user.stationPhoneNumber}`}>{ usercartInfo.data.user.stationPhoneNumber}</a></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    {/* Case Information */}
                    {usercartInfo.data.cart.cases.map((cartcase) => (
                    <div className="container-fluid mx-auto my-4" key={cartcase._id}>
                        <div className="row justify-content-center">
                            <div className="col-12 col-lg-10">
                                <div className="card">
                                <Link to={`/view/case/${cartcase._id}`}> <h5 className="card-header">{cartcase.title}</h5> </Link>
                                    <div className="card-body">
                                        <p className="card-text"><strong>Description:</strong> {cartcase.description}</p>
                                        <div id="buttonGroup" className="text-center">
                                            {cartcase.url !== '' && <a href={cartcase.url} className="btn btn-primary mx-1" rel="noreferrer" target="_blank">Useful URL</a>}
                                            {cartcase.urlPDF !== '' && <a href={cartcase.urlPDF} className="btn btn-primary mx-1" rel="noreferrer" target="_blank">Useful PDF</a>}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    ))}
                </article>
            )}
        </div>
     );
}

export default UserCartDetails;