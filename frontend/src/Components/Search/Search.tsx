import { ChangeEvent, useState, MouseEvent, SyntheticEvent } from "react";
import "./Search.css";

type Props = {};

const Search: React.FC<Props> = (props: Props): JSX.Element => {
  const [search, setSearch] = useState<string>("");

  const handleChange = (e: ChangeEvent<HTMLInputElement>) => {
    setSearch(e.target.value);
    console.log("e", e);
  };

  const onClick = (e: SyntheticEvent) => {
    console.log(e);
  };

  return (
    <div>
      <input value={search} onChange={(e) => handleChange(e)}></input>
      <button onClick={(e) => onClick(e)} />
    </div>
  );
};

export default Search;
