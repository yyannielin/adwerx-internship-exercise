import React, { useState } from "react";

const PostalCodeForm = ({token}) => {

  const [formData, setFormData] = useState({});

  const handlePostalCodeChange = async data => {
    const postal_code = data.target.value;
    if (postal_code.length != 5) {
      return false;
    }
    var client = new XMLHttpRequest();
    client.open('GET', `http://api.zippopotam.us/us/${postal_code}`, true);
    client.onreadystatechange = function() {
      const postal_code_response = JSON.parse(client.responseText);
      console.log(postal_code_response)
      setFormData({
        "postal_code[state]": postal_code_response?.places?.[0]?.state,
        "postal_code[country]": postal_code_response?.country,
        "postal_code[latitude]": postal_code_response?.places?.[0]?.latitude,
        "postal_code[longitude]": postal_code_response?.places?.[0]?.longitude,
      });
    };
    client.send();
  }

  const handleInputChange = (event) => {
    const { name, value } = event.target;
    setFormData({ ...formData, [name]: value });
  }

  return (
    <form action="/postal_codes" method="post">
      <input type="hidden" name="authenticity_token" value={token} />
      <label>
        Postal Code:
        <input type="text" 
        name="postal_code[postal_code]"
        onChange={handlePostalCodeChange}
        />
      </label>
      <label>
        State:
        <input
          type="text"
          name="postal_code[state]"
          value={formData['postal_code[state]']}
          onChange={handlePostalCodeChange}
        />
      </label>
      <label>
        Country:
        <input
          type="text"
          name="postal_code[country]"
          value={formData['postal_code[country]']}
          onChange={handlePostalCodeChange}
        />
      </label>
      <label>
        Longitude:
        <input
          type="text"
          name="postal_code[longitude]"
          value={formData['postal_code[longitude]']}
          onChange={handlePostalCodeChange}
        />
      </label>
      <label>
        Latitude:
        <input
          type="text"
          name="postal_code[latitude]"
          value={formData['postal_code[latitude]']}
          onChange={handlePostalCodeChange}
        />      
        </label>
      <input type="submit" value="Create Postal Code" />
    </form>
  );
};

export default PostalCodeForm;
