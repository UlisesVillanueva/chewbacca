import { Navigate, Route, Routes } from 'react-router-dom';
import { Navbar } from '../../ui';
import { WikiPage, CharacterPage, SearchPage } from '../pages';

export const StarWarsRoutes = () => {
  return (
    <>
        <Navbar />

        <div className="container" style={{display: "flex", alignItems: "center", flexDirection: "column"}}>
            <Routes>
      
                <Route path="wiki" element={<WikiPage />} />
                <Route path="search" element={<SearchPage />} />
                <Route path="character/:id" element={<CharacterPage />} />
                <Route path="/" element={<Navigate to="/wiki" />} />

            </Routes>
        </div>


    </>
  )
}
