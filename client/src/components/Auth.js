import React, { useState } from 'react'


function Auth({setCurrentUser, setFavourites}) {
    const [password, setPassword] = useState('')
    const [username, setUsername] = useState('')
    const [email, setEmail] = useState('')
    const [address, setAddress] = useState('')
    const [name, setName] = useState('')
    const [phone, setPhone] = useState('')
    const [login, setLogin] = useState('')

    const onSignUp = (e) => {
        e.preventDefault();

        const user = {
            password,
            username,
            email,
            address,
            name,
            phone
        }
        fetch(`http://localhost:3000/users`, {
            method: 'POST',
            headers:{'Content-Type':'application/json'},
            body:JSON.stringify(user)
        })
        console.log(user)
        setCurrentUser(user)
        
    }
    const onLogIn = (e) => {
        e.preventDefault();
        fetch(`http://localhost:3000/users`).then((resp) => resp.json()).then(data => {
            
            let userData = data
            console.log("hello", userData)
            userData.map((user) => {
                if (user.password === password && user.username === username)
                setCurrentUser(user);
                setFavourites(user.movies);
            })
            
        })

        // userData.map((user) => {
        //     if (user.password === password && user.username === username)
        //     setCurrentUser(user) 
        //     else 
        //     alert("No Matching Credentials");
        // })
        
    }

  return (
    <div>
        <p>Login/Sign Up Page</p>
        <form onSubmit={onSignUp}>
        <input type='text'placeholder='password' value={password} onChange={(e) => setPassword(e.target.value)}></input>
        <input type='text'placeholder='username' value={username} onChange={(e) => setUsername(e.target.value)}></input>
        <input type='text'placeholder='email' value={email} onChange={(e) => setEmail(e.target.value)}></input>
        <input type='text'placeholder='address' value={address} onChange={(e) => setAddress(e.target.value)}></input>
        <input type='text'placeholder='name' value={name} onChange={(e) => setName(e.target.value)}></input>
        <input type='text'placeholder='phone' value={phone} onChange={(e) => setPhone(e.target.value)}></input>
        <button>Sign Up</button>
        </form >
        <form onSubmit={onLogIn}>
        <input type='text'placeholder='password' value={password} onChange={(e) => setPassword(e.target.value)}></input>
        <input type='text'placeholder='username' value={username} onChange={(e) => setUsername(e.target.value)}></input>
        
        <button>Login</button>
        </form >
    </div>
  )
}

export default Auth