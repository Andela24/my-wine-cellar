import React, { useState } from 'react'
import { useNavigate } from "react-router-dom"

const Signup = ({ handleCurrentUser }) => {
    const [user, setUser] = useState({
      username: '',
      password: ''
    })

  const navigate=useNavigate()

    const handleChange = e => {
      setUser({
        ...user,
        [e.target.name]: e.target.value
      })
    }
  
    const handleSubmit = e => {
      e.preventDefault();
  
      fetch('/signup', {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: JSON.stringify(user),
       
      })
    
      .then(resp => {
        if(resp.ok){
           resp.json().then(data => {
              handleCurrentUser(data)
              navigate('/')
           })
        }else {
           resp.json().then(json => console.log(json.errors))
        }
     })

 }  
  
    return (
      <div>
        <h1>Create a new account</h1>
        <form className="form" onSubmit={ handleSubmit }>
          <div>
            <label htmlFor="username">Username: </label>
            <input type="text" id="username" name="username" value={ user.username } onChange={ handleChange } />
          </div><br />
          <div>
            <label htmlFor="password">Password: </label>
            <input type="password" id="password" name="password" value={ user.password } onChange={ handleChange } />
          </div><br />
          <input type="submit" value="Create Account" />
        </form>
      </div>
    )
  }
export default Signup

