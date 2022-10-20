import React from 'react';
import './App.css';
import { AuthProvider } from 'react-oidc-context';
import Header from './components/Header';

function App() {
  return (
    <div>
      <Header />
      <AuthProvider>
        <div className="container App">
          Main content
        </div>
      </AuthProvider>
    </div>
  );
}

export default App;
