
int colorType(String? type) {
  switch(type){
    case "Normal": return 0xAAA8A77A; 
    case "Fire": return 0xAAEE8130; 
    case "Water": return 0xAA6390F0; 
    case "Electric": return 0xAAF7D02C; 
    case "Grass": return 0xAA7AC74C; 
    case "Ice": return 0xAA96D9D6; 
    case "Fighting": return 0xAAC22E28; 
    case "Poison": return 0xAAA33EA1;
    case "Ground": return 0xAAE2BF65; 
    case "Flying": return 0xAAA98FF3; 
    case "Psychic": return 0xAAF95587; 
    case "Bug": return 0xAAA6B91A; 
    case "Rock": return 0xAAB6A136; 
    case "Ghost": return 0xAA735797; 
    case "Dragon": return 0xAA6F35FC; 
    case "Dark": return 0xAA705746; 
    case "Steel": return 0xAAB7B7CE; 
    case "Fairy": return 0xAAD685AD; 
    default: return 0xAAA8A77A; 
  }
  
}
