import logo from './logo.svg';
import './App.scss';
import 'bootstrap/dist/css/bootstrap.min.css'

function App() {
  return (
    <div className="App">
      <div className="alert alert-danger alert-dismissible fade show" role="alert">
        <strong>Oh snap! You got an error!</strong>
        <p>
          Change this and that and try again.
        </p>
        <button type="button" className="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    </div >
  );
}

export default App;
