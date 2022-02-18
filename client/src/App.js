import React, { useState, useEffect } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import './App.css';
import MovieList from './components/MovieList';
import MovieListHeading from './components/MovieListHeading';
import SearchBox from './components/SearchBox';
import AddFavourites from './components/AddFavourites';
import RemoveFavourites from './components/RemoveFavourites';
import Auth from './components/Auth';
import UserPage from './components/UserPage';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";


const App = () => {
	const [movies, setMovies] = useState([]);
	const [favourites, setFavourites] = useState([]);
	const [searchValue, setSearchValue] = useState('');
  const [currentUser, setCurrentUser] = useState({});
  const [dateRented, setDateRented] = useState( new Date().toLocaleString());
  const [expiration, setExpiration] = useState( new Date().toLocaleString());
  const [rating, setRating] = useState(0.00)
  const [price, setPrice] = useState(5.00)
  
	const getMovieRequest = async () => {
		const url = `http://localhost:3000/movies`;

		const response = await fetch(url);
		const responseJson = await response.json();

		if (responseJson) {
			setMovies(responseJson);
		}
	};
  // const getFavourites = async () => {
	// 	const url = `http://localhost:3000/users`;

	// 	const response = await fetch(url);
	// 	const responseJson = await response.json();

	// 	if (responseJson) {
	// 		setMovies(responseJson);
	// 	}
	// };

	useEffect(() => {
		getMovieRequest();
    
	}, []);

	useEffect(() => {
		const movieFavourites = currentUser.movies;

		if (movieFavourites) {
			setFavourites(currentUser.movies);
      console.log("favorites" , favourites)
		}
	}, []);

	const saveToLocalStorage = (items) => {
		localStorage.setItem('react-movie-app-favourites', JSON.stringify(items));
	};

	const addFavouriteMovie = (movie) => {
   

    const newFavourite = {
        dateRented,
        expiration,
        price,
        rating,
        movie_id: movie.id,
        user_id: currentUser.id
    }
    fetch(`http://localhost:3000/watchlists`, {
        method: 'POST',
        headers:{'Content-Type':'application/json'},
        body:JSON.stringify(newFavourite)
    })
    console.log(newFavourite)
    setFavourites(currentUser.movies)
    
    
    // console.log(newFavourite)
		// const newFavouriteList = [...favourites, movie];
		// setFavourites(newFavouriteList);
		// saveToLocalStorage(newFavouriteList);
	};

	const removeFavouriteMovie = (movie) => {

     console.log('watchlists', currentUser.watchlists)
     if (currentUser)
     currentUser.watchlists.map((watchlist) => {
       
       if (watchlist.movie_id === movie.id) 
                 fetch(`http://localhost:3000/watchlists/${watchlist.id}`, {
             method: "DELETE",
           });
          
         
         
        
     })
     setFavourites(currentUser.movies);
  };
  //      if (watchlist.movie_id === movie.id) 
  //           fetch(`http://localhost:3000/watchlists/${watchlist.id}`, {
  //       method: "DELETE",
  //     });
  //     setFavourites(currentUser.movies);
  //   
  //   else
  //     console.log("error")
  // })


   
    //   fetch(`http://localhost:9292/watchlists/${movie.id}`, {
    //     method: "DELETE",
    //   });
    //   setFolders(folders.filter(({ id }) => id !== folderId));
    // };
		// const newFavouriteList = favourites.filter(
		// 	(favourite) => favourite.imdbID !== movie.imdbID
		// );

		// setFavourites(newFavouriteList);
		// saveToLocalStorage(newFavouriteList);
	

	return (
		<div className='container-fluid movie-app'>
      
       <Router>
      <div>
        <nav>
          <ul>
            <li>
              <Link to="/auth">Login/Signup</Link>
            </li>
            <li>
              <Link to="/movies">Movies</Link>
            </li>
            <li>
              <Link to="/users">User Info</Link>
            </li>
            <li>
              <Link to="/watchlists">Watchlist</Link>
            </li>
          </ul>
        </nav>
     

        
        <Switch>
          <Route path="/auth">
           
          <Auth
       setCurrentUser={setCurrentUser} 
      setFavourites={setFavourites}
      />
          </Route>
          <Route path="/users">
          <UserPage 
      currentUser={currentUser} 
      />
          </Route>
          <Route path="/movies">
          <div className='row d-flex align-items-center mt-4 mb-4'>
				<MovieListHeading heading='Movies' />
				<SearchBox searchValue={searchValue} setSearchValue={setSearchValue} />
			</div>
      
			<div className='row'>
				<MovieList
					movies={movies}
					handleFavouritesClick={addFavouriteMovie}
					favouriteComponent={AddFavourites}
				/>
			</div>
          </Route>
          <Route path="/watchlists">
        	<div className='row d-flex align-items-center mt-4 mb-4'>
				<MovieListHeading heading='Watchlist' />
			</div>
			<div className='row'>
				<MovieList
					movies={favourites}
					handleFavouritesClick={removeFavouriteMovie}
					favouriteComponent={RemoveFavourites}
				/>
			</div>
          </Route>
        </Switch>
      </div>
    </Router>
      {/* <p>Current Logged in User is: {currentUser.username}</p>
      <Auth
       setCurrentUser={setCurrentUser} 
      setFavourites={setFavourites}
      />
      <UserPage 
      currentUser={currentUser} 
      />
			<div className='row d-flex align-items-center mt-4 mb-4'>
				<MovieListHeading heading='Movies' />
				<SearchBox searchValue={searchValue} setSearchValue={setSearchValue} />
			</div>
      
			<div className='row'>
				<MovieList
					movies={movies}
					handleFavouritesClick={addFavouriteMovie}
					favouriteComponent={AddFavourites}
				/>
			</div>
			<div className='row d-flex align-items-center mt-4 mb-4'>
				<MovieListHeading heading='Favourites' />
			</div>
			<div className='row'>
				<MovieList
					movies={favourites}
					handleFavouritesClick={removeFavouriteMovie}
					favouriteComponent={RemoveFavourites}
				/>
			</div> */}
		</div>
	);
};

export default App;


// `http://www.omdbapi.com/?s=${searchValue}&apikey=5eca1855`;