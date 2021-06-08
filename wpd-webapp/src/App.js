import './App.css'
import 'bootstrap/dist/css/bootstrap.min.css'
import { Button, Navbar, Jumbotron } from 'react-bootstrap'

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <Navbar>
          <Jumbotron>
            <h1>WPD App</h1>
            <Button>Test Button</Button>
          </Jumbotron>
        </Navbar>
        
      </header>
    </div>
  );
}

export default App;
