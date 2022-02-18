import React from 'react'

function UserPage({currentUser}) {
  return (
    <div>
        <ul>
          <h2>User Info</h2>
          <li>
          <input placeHolder={currentUser.username}></input>
          </li>
          <li>
          <input placeHolder={currentUser.name} ></input>
          </li>
          <li>
          <input placeHolder={currentUser.email}></input>
          </li>
          <li>
          <input placeHolder={currentUser.phone}></input>
          </li>
          <li>
          <input placeHolder={currentUser.address}></input>
          </li>
        </ul>
    </div>
  )
}

export default UserPage