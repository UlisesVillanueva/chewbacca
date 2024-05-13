
import { CharacterCard } from '.';

export const CharacterList = ({ characters }) => {
    return (
        <div className="row rows-cols-1 row-cols-md-3 g-3">
            {
                characters.map( character => (
                    <CharacterCard 
                        key={ character.people_id  } 
                        { ...character }
                    />
                ))
            }
        </div>
    )
}
