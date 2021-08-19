import React from "react";
import ReactTagInput from "@pathofdev/react-tag-input";
import "@pathofdev/react-tag-input/build/index.css";
 
export const Sample = () => {
    const [tags, setTags] = React.useState(["タグ1"])
    return (
        <ReactTagInput
            placeholder="入力してください"
            tags={tags} 
            onChange={(newTags) => setTags(newTags)}
        />
    )
}
  
export default Sample