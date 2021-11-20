// Imports 
import Navbar from './Navbar';
import Home from './Home';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import CaseDetails from './CaseDetails';
import UserDetails from './UserDetails';
import UserCaseDetails from './UserCaseDetails';
import CartDetails from './CartDetails';
import UserCartDetails from './UserCartDetails';
import NotFound  from './NotFound';

function App() {
  return (
    // Use Router so that it doesn't have to send request to server and have to refresh page. Faster load time
    <Router>
      <div className="App">
        <Navbar />
        <div className="container">
          <Switch>
            {/* Has to have exact path for home */}
            <Route exact path="/">
              <Home />
            </Route>
            {/* Dynamic path for viewing case information*/}
            <Route path="/view/case/:id">
              <CaseDetails />
            </Route>
            {/* Dynamic path for viewing user information */}
            <Route path="/view/user/:id">
              <UserDetails />
            </Route>
            {/* Dynamic path for viewing user with case information */}
            <Route path="/view/user-case/:caseid/:userid">
              <UserCaseDetails />
            </Route>
            {/* Dynamic path for viewing cart informations */}
            <Route path="/view/cart/:id">
              <CartDetails />
            </Route>
            {/* Dynamic path for viewing user and cart information  */}
            <Route path="/view/user-cart/:cartid/:userid">
              <UserCartDetails />
            </Route>
            {/* If no other path matches then display the NotFound page */}
            {/* HAS TO BE LAST */}
            <Route path="*">
              <NotFound />
            </Route>
          </Switch>
        </div>
      </div>
    </Router>
  );
}

export default App;
